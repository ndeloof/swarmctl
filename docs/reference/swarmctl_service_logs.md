# docker swarmctl service logs

<!---MARKER_GEN_START-->
Fetch the logs of a service or task

### Options

| Name                 | Type     | Default | Description                                                                                 |
|:---------------------|:---------|:--------|:--------------------------------------------------------------------------------------------|
| `--details`          |          |         | Show extra details provided to logs                                                         |
| `-f`, `--follow`     |          |         | Follow log output                                                                           |
| `--no-resolve`       |          |         | Do not map IDs to Names in output                                                           |
| `--no-task-ids`      |          |         | Do not include task IDs in output                                                           |
| `--no-trunc`         |          |         | Do not truncate output                                                                      |
| `--raw`              |          |         | Do not neatly format logs                                                                   |
| `--since`            | `string` |         | Show logs since timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes) |
| `-n`, `--tail`       | `string` | `all`   | Number of lines to show from the end of the logs                                            |
| `-t`, `--timestamps` |          |         | Show timestamps                                                                             |


<!---MARKER_GEN_END-->

