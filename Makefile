all: binary

BUILDX_CMD ?= docker buildx
DESTDIR ?= ./bin/build

ifeq ($(DETECTED_OS),Windows)
	BINARY_EXT=.exe
endif

.PHONY: binary
binary:
	$(BUILDX_CMD) bake -f swarmctl-bake.hcl binary

.PHONY: build ## Build the swarmctl cli
build:
	CGO_ENABLED=0 GO111MODULE=on go build -trimpath -tags "$(GO_BUILDTAGS)" -ldflags "$(GO_LDFLAGS)" -o "$(DESTDIR)/swarmctl$(BINARY_EXT)" ./cmd

.PHONY: cross
cross: ## Compile the CLI for linux, darwin and windows
	$(BUILDX_CMD) bake -f swarmctl-bake.hcl binary-cross

.PHONY: tes
test: ## Run unit tests
	$(BUILDX_CMD) bake -f swarmctl-bake.hcl test

.PHONY: lint
lint: ## run linter(s)
	$(BUILDX_CMD) bake -f swarmctl-bake.hcl lint

.PHONY: docs
docs: ## generate documentation
	$(eval $@_TMP_OUT := $(shell mktemp -d -t compose-output.XXXXXXXXXX))
	$(BUILDX_CMD) bake -f swarmctl-bake.hcl --set "*.output=type=local,dest=$($@_TMP_OUT)" docs-update
	rm -rf ./docs/internal
	cp -R "$($@_TMP_OUT)"/out/* ./docs/
	rm -rf "$($@_TMP_OUT)"/*

.PHONY: validate-docs
validate-docs: ## validate the doc does not change
	$(BUILDX_CMD) bake -f swarmctl-bake.hcl docs-validate


.PHONY: go-mod-tidy
go-mod-tidy: ## Run go mod tidy in a container and output resulting go.mod and go.sum
	$(BUILDX_CMD) bake -f swarmctl-bake.hcl vendor-update

.PHONY: validate-go-mod
validate-go-mod: ## Validate go.mod and go.sum are up-to-date
	$(BUILDX_CMD) bake -f swarmctl-bake.hcl vendor-validate

validate: validate-docs validate-go-mod ## Validate sources

help: ## Show help
	@echo Please specify a build target. The choices are:
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'