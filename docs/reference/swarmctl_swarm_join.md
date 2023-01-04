# docker swarmctl swarm join

<!---MARKER_GEN_START-->
Join a swarm as a node and/or manager

### Options

| Name               | Type        | Default        | Description                                                                 |
|:-------------------|:------------|:---------------|:----------------------------------------------------------------------------|
| `--advertise-addr` | `string`    |                | Advertised address (format: <ip\|interface>[:port])                         |
| `--availability`   | `string`    | `active`       | Availability of the node ("active"\|"pause"\|"drain")                       |
| `--data-path-addr` | `string`    |                | Address or interface to use for data path traffic (format: <ip\|interface>) |
| `--listen-addr`    | `node-addr` | `0.0.0.0:2377` | Listen address (format: <ip\|interface>[:port])                             |
| `--token`          | `string`    |                | Token for entry into the swarm                                              |


<!---MARKER_GEN_END-->

