# docker swarmctl swarm init

<!---MARKER_GEN_START-->
Initialize a swarm

### Options

| Name                              | Type          | Default        | Description                                                                                                                  |
|:----------------------------------|:--------------|:---------------|:-----------------------------------------------------------------------------------------------------------------------------|
| `--advertise-addr`                | `string`      |                | Advertised address (format: <ip\|interface>[:port])                                                                          |
| `--autolock`                      |               |                | Enable manager autolocking (requiring an unlock key to start a stopped manager)                                              |
| `--availability`                  | `string`      | `active`       | Availability of the node ("active"\|"pause"\|"drain")                                                                        |
| `--cert-expiry`                   | `duration`    | `2160h0m0s`    | Validity period for node certificates (ns\|us\|ms\|s\|m\|h)                                                                  |
| `--data-path-addr`                | `string`      |                | Address or interface to use for data path traffic (format: <ip\|interface>)                                                  |
| `--data-path-port`                | `uint32`      | `0`            | Port number to use for data path traffic (1024 - 49151). If no value is set or is set to 0, the default port (4789) is used. |
| `--default-addr-pool`             | `ipNetSlice`  |                | default address pool in CIDR format                                                                                          |
| `--default-addr-pool-mask-length` | `uint32`      | `24`           | default address pool subnet mask length                                                                                      |
| `--dispatcher-heartbeat`          | `duration`    | `5s`           | Dispatcher heartbeat period (ns\|us\|ms\|s\|m\|h)                                                                            |
| `--external-ca`                   | `external-ca` |                | Specifications of one or more certificate signing endpoints                                                                  |
| `--force-new-cluster`             |               |                | Force create a new cluster from current state                                                                                |
| `--listen-addr`                   | `node-addr`   | `0.0.0.0:2377` | Listen address (format: <ip\|interface>[:port])                                                                              |
| `--max-snapshots`                 | `uint64`      | `0`            | Number of additional Raft snapshots to retain                                                                                |
| `--snapshot-interval`             | `uint64`      | `10000`        | Number of log entries between Raft snapshots                                                                                 |
| `--task-history-limit`            | `int64`       | `5`            | Task history retention limit                                                                                                 |


<!---MARKER_GEN_END-->

