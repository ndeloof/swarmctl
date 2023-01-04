module github.com/moby/swarmctl

go 1.19

require (
	github.com/docker/cli v20.10.13+incompatible
	github.com/docker/cli-docs-tool v0.5.1
	github.com/docker/docker v23.0.0-rc.1+incompatible
	github.com/imdario/mergo v0.3.13
	github.com/opencontainers/go-digest v1.0.0
	github.com/pkg/errors v0.9.1
	github.com/spf13/cobra v1.6.1
	github.com/spf13/pflag v1.0.5
	github.com/xeipuuv/gojsonschema v1.2.0
	golang.org/x/term v0.3.0
	gopkg.in/yaml.v2 v2.4.0
	gotest.tools/v3 v3.4.0
)

require (
	github.com/xeipuuv/gojsonpointer v0.0.0-20180127040702-4e3ac2762d5f // indirect
	github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

require (
	github.com/docker/go-events v0.0.0-20190806004212-e31b211e4f1c // indirect
	github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
	go.etcd.io/etcd/raft/v3 v3.5.6 // indirect
	google.golang.org/genproto v0.0.0-20220706185917-7780775163c4 // indirect
	google.golang.org/grpc v1.48.0 // indirect
)

require (
	github.com/Azure/go-ansiterm v0.0.0-20210617225240-d185dfc1b5a1 // indirect
	github.com/Microsoft/go-winio v0.5.2 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/cespare/xxhash/v2 v2.1.2 // indirect
	github.com/docker/distribution v2.8.1+incompatible
	github.com/docker/docker-credential-helpers v0.7.0 // indirect
	github.com/docker/go v1.5.1-1.0.20160303222718-d30aec9fd63c // indirect
	github.com/docker/go-connections v0.4.0
	github.com/docker/go-metrics v0.0.1 // indirect
	github.com/docker/go-units v0.5.0
	github.com/fvbommel/sortorder v1.0.2
	github.com/go-sql-driver/mysql v1.6.0 // indirect
	github.com/gogo/protobuf v1.3.2
	github.com/golang/protobuf v1.5.2 // indirect
	github.com/google/go-cmp v0.5.9
	github.com/gorilla/mux v1.8.0 // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/kr/pretty v0.2.1 // indirect
	github.com/mattn/go-runewidth v0.0.13 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.4 // indirect
	github.com/miekg/pkcs11 v1.1.1 // indirect
	github.com/mitchellh/mapstructure v1.3.2
	github.com/moby/swarmkit/v2 v2.0.0-20230103175429-481f030e3561
	github.com/moby/sys/sequential v0.5.0
	github.com/moby/term v0.0.0-20221128092401-c43b287e0e0f // indirect
	github.com/morikuni/aec v1.0.0 // indirect
	github.com/opencontainers/image-spec v1.0.3-0.20220303224323-02efb9a75ee1 // indirect
	github.com/prometheus/client_golang v1.14.0 // indirect
	github.com/prometheus/client_model v0.3.0 // indirect
	github.com/prometheus/common v0.37.0 // indirect
	github.com/prometheus/procfs v0.8.0 // indirect
	github.com/rivo/uniseg v0.2.0 // indirect
	github.com/sirupsen/logrus v1.9.0
	github.com/theupdateframework/notary v0.7.1-0.20210315103452-bf96a202a09a
	golang.org/x/crypto v0.2.0 // indirect
	golang.org/x/net v0.4.0 // indirect
	golang.org/x/sys v0.3.0 // indirect
	golang.org/x/text v0.5.0 // indirect
	golang.org/x/time v0.1.0 // indirect
	google.golang.org/protobuf v1.28.1 // indirect
)

replace github.com/docker/cli => github.com/docker/cli v23.0.0-rc.1.0.20221229180220-850fb6921cf7+incompatible // master branch
