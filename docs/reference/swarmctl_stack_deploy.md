# docker swarmctl stack deploy

<!---MARKER_GEN_START-->
Deploy a new stack or update an existing stack

### Aliases

`docker swarmctl stack deploy`, `docker swarmctl stack up`

### Options

| Name                   | Type          | Default  | Description                                                                                       |
|:-----------------------|:--------------|:---------|:--------------------------------------------------------------------------------------------------|
| `-c`, `--compose-file` | `stringSlice` |          | Path to a Compose file, or "-" to read from stdin                                                 |
| `--prune`              |               |          | Prune services that are no longer referenced                                                      |
| `--resolve-image`      | `string`      | `always` | Query the registry to resolve image digest and supported platforms ("always"\|"changed"\|"never") |
| `--with-registry-auth` |               |          | Send registry authentication details to Swarm agents                                              |


<!---MARKER_GEN_END-->

