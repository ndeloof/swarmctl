# syntax=docker/dockerfile:1

ARG GO_VERSION=1.19.4
ARG XX_VERSION=1.1.2
ARG GOLANGCI_LINT_VERSION=v1.49.0

ARG BUILD_TAGS=""

# xx is a helper for cross-compilation
FROM --platform=${BUILDPLATFORM} tonistiigi/xx:${XX_VERSION} AS xx
FROM golangci/golangci-lint:${GOLANGCI_LINT_VERSION}-alpine AS golangci-lint

FROM --platform=${BUILDPLATFORM} golang:${GO_VERSION}-alpine AS base
COPY --from=xx / /
RUN apk add --no-cache \
      docker \
      file \
      git \
      make \
      protoc \
      protobuf-dev
WORKDIR /src
ENV CGO_ENABLED=0

FROM base AS build-base
COPY go.* .
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go mod download

FROM build-base AS build
ARG BUILD_TAGS
ARG TARGETPLATFORM
RUN xx-go --wrap
RUN --mount=type=bind,target=. \
    --mount=type=cache,target=/root/.cache \
    --mount=type=cache,target=/go/pkg/mod \
    make build GO_BUILDTAGS="$BUILD_TAGS" DESTDIR=/usr/bin && \
    xx-verify --static /usr/bin/swarmctl

FROM scratch AS binary-unix
COPY --link --from=build /usr/bin/swarmctl /
FROM binary-unix AS binary-darwin
FROM binary-unix AS binary-linux
FROM scratch AS binary-windows
COPY --link --from=build /usr/bin/swarmctl /swarmctl.exe
FROM binary-$TARGETOS AS binary

FROM build-base AS test
ARG CGO_ENABLED=0
ARG BUILD_TAGS
RUN --mount=type=bind,target=. \
    --mount=type=cache,target=/root/.cache \
    --mount=type=cache,target=/go/pkg/mod \
    go test -tags "$BUILD_TAGS" -v -coverprofile=/tmp/coverage.txt -covermode=atomic $(go list  $(TAGS) ./... | grep -vE 'e2e') && \
    go tool cover -func=/tmp/coverage.txt

FROM scratch AS test-coverage
COPY --from=test /tmp/coverage.txt /coverage.txt

FROM build-base AS lint
ARG BUILD_TAGS
RUN --mount=type=bind,target=. \
    --mount=type=cache,target=/root/.cache \
    --mount=from=golangci-lint,source=/usr/bin/golangci-lint,target=/usr/bin/golangci-lint \
    golangci-lint run --timeout=5m --build-tags "$BUILD_TAGS" ./...

FROM base AS docsgen
WORKDIR /src
RUN --mount=target=. \
    --mount=target=/root/.cache,type=cache \
    go build -o /out/docsgen ./docs/yaml/main/generate.go

FROM --platform=${BUILDPLATFORM} alpine AS docs-build
RUN apk add --no-cache rsync git
WORKDIR /src
COPY --from=docsgen /out/docsgen /usr/bin
ARG DOCS_FORMATS
RUN --mount=target=/context \
    --mount=target=.,type=tmpfs <<EOT
  set -e
  rsync -a /context/. .
  docsgen --formats "$DOCS_FORMATS" --source "docs/reference"
  mkdir /out
  cp -r docs/reference /out
EOT

FROM scratch AS docs-update
COPY --from=docs-build /out /out

FROM docs-build AS docs-validate
RUN --mount=target=/context \
    --mount=target=.,type=tmpfs <<EOT
  set -e
  rsync -a /context/. .
  git add -A
  rm -rf docs/reference/*
  cp -rf /out/* ./docs/
  if [ -n "$(git status --porcelain -- docs/reference)" ]; then
    echo >&2 'ERROR: Docs result differs. Please update with "make docs"'
    git status --porcelain -- docs/reference
    exit 1
  fi
EOT

FROM build-base AS vendored
RUN --mount=type=bind,target=.,rw \
    --mount=type=cache,target=/go/pkg/mod \
    go mod tidy && mkdir /out && cp go.mod go.sum /out

FROM scratch AS vendor-update
COPY --from=vendored /out /

FROM vendored AS vendor-validate
RUN --mount=type=bind,target=.,rw <<EOT
  set -e
  git add -A
  cp -rf /out/* .
  diff=$(git status --porcelain -- go.mod go.sum)
  if [ -n "$diff" ]; then
    echo >&2 'ERROR: Vendor result differs. Please vendor your package with "make go-mod-tidy"'
    echo "$diff"
    exit 1
  fi
EOT

FROM --platform=$BUILDPLATFORM alpine AS releaser
WORKDIR /work
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT
RUN --mount=from=binary \
    mkdir -p /out && \
    # TODO: should just use standard arch
    TARGETARCH=$([ "$TARGETARCH" = "amd64" ] && echo "x86_64" || echo "$TARGETARCH"); \
    TARGETARCH=$([ "$TARGETARCH" = "arm64" ] && echo "aarch64" || echo "$TARGETARCH"); \
    cp swarmctl* "/out/swarmctl-${TARGETOS}-${TARGETARCH}${TARGETVARIANT}$(ls swarmctl* | sed -e 's/^swarmctl//')"

FROM scratch AS release
COPY --from=releaser /out/ /
