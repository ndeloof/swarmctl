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
    golangci-lint run --build-tags "$BUILD_TAGS" ./...