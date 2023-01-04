all: binary

BUILDX_CMD ?= docker buildx
DESTDIR ?= ./bin/build

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

help: ## Show help
	@echo Please specify a build target. The choices are:
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'