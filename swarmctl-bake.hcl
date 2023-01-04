variable "GO_VERSION" {
  default = "1.19.4"
}

variable "BUILD_TAGS" {
  default = ""
}

# Defines the output folder
variable "DESTDIR" {
  default = ""
}
function "bindir" {
  params = [defaultdir]
  result = DESTDIR != "" ? DESTDIR : "./bin/${defaultdir}"
}

target "_common" {
  args = {
    GO_VERSION = GO_VERSION
    BUILD_TAGS = BUILD_TAGS
    BUILDKIT_CONTEXT_KEEP_GIT_DIR = 1
  }
}

group "default" {
  targets = ["binary"]
}

target "binary" {
  inherits = ["_common"]
  target = "binary"
  output = [bindir("build")]
  platforms = ["local"]
}

target "binary-cross" {
  inherits = ["binary"]
  platforms = [
    "darwin/amd64",
    "darwin/arm64",
    "linux/amd64",
    "linux/arm/v6",
    "linux/arm/v7",
    "linux/arm64",
    "linux/ppc64le",
    "linux/riscv64",
    "linux/s390x",
    "windows/amd64",
    "windows/arm64"
  ]
}

target "release" {
  inherits = ["binary-cross"]
  target = "release"
  output = [bindir("release")]
}

target "test" {
  inherits = ["_common"]
  target = "test-coverage"
  output = [bindir("coverage")]
}

target "lint" {
  inherits = ["_common"]
  target = "lint"
  output = ["type=cacheonly"]
}

target "docs-validate" {
  inherits = ["_common"]
  target = "docs-validate"
  output = ["type=cacheonly"]
}

target "docs-update" {
  inherits = ["_common"]
  target = "docs-update"
  output = ["./docs"]
}