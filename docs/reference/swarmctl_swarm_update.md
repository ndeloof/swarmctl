# docker swarmctl swarm update

<!---MARKER_GEN_START-->
Update the swarm

### Options

| Name                     | Type          | Default     | Description                                                 |
|:-------------------------|:--------------|:------------|:------------------------------------------------------------|
| `--autolock`             |               |             | Change manager autolocking setting (true\|false)            |
| `--cert-expiry`          | `duration`    | `2160h0m0s` | Validity period for node certificates (ns\|us\|ms\|s\|m\|h) |
| `--dispatcher-heartbeat` | `duration`    | `5s`        | Dispatcher heartbeat period (ns\|us\|ms\|s\|m\|h)           |
| `--external-ca`          | `external-ca` |             | Specifications of one or more certificate signing endpoints |
| `--max-snapshots`        | `uint64`      | `0`         | Number of additional Raft snapshots to retain               |
| `--snapshot-interval`    | `uint64`      | `10000`     | Number of log entries between Raft snapshots                |
| `--task-history-limit`   | `int64`       | `5`         | Task history retention limit                                |


<!---MARKER_GEN_END-->

