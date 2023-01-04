# docker swarmctl service create

<!---MARKER_GEN_START-->
Create a new service

### Options

| Name                           | Type              | Default      | Description                                                                                         |
|:-------------------------------|:------------------|:-------------|:----------------------------------------------------------------------------------------------------|
| `--cap-add`                    | `list`            |              | Add Linux capabilities                                                                              |
| `--cap-drop`                   | `list`            |              | Drop Linux capabilities                                                                             |
| `--config`                     | `config`          |              | Specify configurations to expose to the service                                                     |
| `--constraint`                 | `list`            |              | Placement constraints                                                                               |
| `--container-label`            | `list`            |              | Container labels                                                                                    |
| `--credential-spec`            | `credential-spec` |              | Credential spec for managed service account (Windows only)                                          |
| `-d`, `--detach`               |                   |              | Exit immediately instead of waiting for the service to converge                                     |
| `--dns`                        | `list`            |              | Set custom DNS servers                                                                              |
| `--dns-option`                 | `list`            |              | Set DNS options                                                                                     |
| `--dns-search`                 | `list`            |              | Set custom DNS search domains                                                                       |
| `--endpoint-mode`              | `string`          | `vip`        | Endpoint mode (vip or dnsrr)                                                                        |
| `--entrypoint`                 | `command`         |              | Overwrite the default ENTRYPOINT of the image                                                       |
| `-e`, `--env`                  | `list`            |              | Set environment variables                                                                           |
| `--env-file`                   | `list`            |              | Read in a file of environment variables                                                             |
| `--generic-resource`           | `list`            |              | User defined resources                                                                              |
| `--group`                      | `list`            |              | Set one or more supplementary user groups for the container                                         |
| `--health-cmd`                 | `string`          |              | Command to run to check health                                                                      |
| `--health-interval`            | `duration`        |              | Time between running the check (ms\|s\|m\|h)                                                        |
| `--health-retries`             | `int`             | `0`          | Consecutive failures needed to report unhealthy                                                     |
| `--health-start-period`        | `duration`        |              | Start period for the container to initialize before counting retries towards unstable (ms\|s\|m\|h) |
| `--health-timeout`             | `duration`        |              | Maximum time to allow one check to run (ms\|s\|m\|h)                                                |
| `--host`                       | `list`            |              | Set one or more custom host-to-IP mappings (host:ip)                                                |
| `--hostname`                   | `string`          |              | Container hostname                                                                                  |
| `--init`                       |                   |              | Use an init inside each service container to forward signals and reap processes                     |
| `--isolation`                  | `string`          |              | Service container isolation mode                                                                    |
| `-l`, `--label`                | `list`            |              | Service labels                                                                                      |
| `--limit-cpu`                  | `decimal`         |              | Limit CPUs                                                                                          |
| `--limit-memory`               | `bytes`           | `0`          | Limit Memory                                                                                        |
| `--limit-pids`                 | `int64`           | `0`          | Limit maximum number of processes (default 0 = unlimited)                                           |
| `--log-driver`                 | `string`          |              | Logging driver for service                                                                          |
| `--log-opt`                    | `list`            |              | Logging driver options                                                                              |
| `--max-concurrent`             | `uint`            |              | Number of job tasks to run concurrently (default equal to --replicas)                               |
| `--mode`                       | `string`          | `replicated` | Service mode (replicated, global, replicated-job, or global-job)                                    |
| `--mount`                      | `mount`           |              | Attach a filesystem mount to the service                                                            |
| `--name`                       | `string`          |              | Service name                                                                                        |
| `--network`                    | `network`         |              | Network attachments                                                                                 |
| `--no-healthcheck`             |                   |              | Disable any container-specified HEALTHCHECK                                                         |
| `--no-resolve-image`           |                   |              | Do not query the registry to resolve image digest and supported platforms                           |
| `--placement-pref`             | `pref`            |              | Add a placement preference                                                                          |
| `-p`, `--publish`              | `port`            |              | Publish a port as a node port                                                                       |
| `-q`, `--quiet`                |                   |              | Suppress progress output                                                                            |
| `--read-only`                  |                   |              | Mount the container's root filesystem as read only                                                  |
| `--replicas`                   | `uint`            |              | Number of tasks                                                                                     |
| `--replicas-max-per-node`      | `uint64`          | `0`          | Maximum number of tasks per node (default 0 = unlimited)                                            |
| `--reserve-cpu`                | `decimal`         |              | Reserve CPUs                                                                                        |
| `--reserve-memory`             | `bytes`           | `0`          | Reserve Memory                                                                                      |
| `--restart-condition`          | `string`          |              | Restart when condition is met ("none"\|"on-failure"\|"any") (default "any")                         |
| `--restart-delay`              | `duration`        |              | Delay between restart attempts (ns\|us\|ms\|s\|m\|h) (default 5s)                                   |
| `--restart-max-attempts`       | `uint`            |              | Maximum number of restarts before giving up                                                         |
| `--restart-window`             | `duration`        |              | Window used to evaluate the restart policy (ns\|us\|ms\|s\|m\|h)                                    |
| `--rollback-delay`             | `duration`        | `0s`         | Delay between task rollbacks (ns\|us\|ms\|s\|m\|h) (default 0s)                                     |
| `--rollback-failure-action`    | `string`          |              | Action on rollback failure ("pause"\|"continue") (default "pause")                                  |
| `--rollback-max-failure-ratio` | `float`           | `0`          | Failure rate to tolerate during a rollback (default 0)                                              |
| `--rollback-monitor`           | `duration`        | `0s`         | Duration after each task rollback to monitor for failure (ns\|us\|ms\|s\|m\|h) (default 5s)         |
| `--rollback-order`             | `string`          |              | Rollback order ("start-first"\|"stop-first") (default "stop-first")                                 |
| `--rollback-parallelism`       | `uint64`          | `1`          | Maximum number of tasks rolled back simultaneously (0 to roll back all at once)                     |
| `--secret`                     | `secret`          |              | Specify secrets to expose to the service                                                            |
| `--stop-grace-period`          | `duration`        |              | Time to wait before force killing a container (ns\|us\|ms\|s\|m\|h) (default 10s)                   |
| `--stop-signal`                | `string`          |              | Signal to stop the container                                                                        |
| `--sysctl`                     | `list`            |              | Sysctl options                                                                                      |
| `-t`, `--tty`                  |                   |              | Allocate a pseudo-TTY                                                                               |
| `--ulimit`                     | `ulimit`          |              | Ulimit options                                                                                      |
| `--update-delay`               | `duration`        | `0s`         | Delay between updates (ns\|us\|ms\|s\|m\|h) (default 0s)                                            |
| `--update-failure-action`      | `string`          |              | Action on update failure ("pause"\|"continue"\|"rollback") (default "pause")                        |
| `--update-max-failure-ratio`   | `float`           | `0`          | Failure rate to tolerate during an update (default 0)                                               |
| `--update-monitor`             | `duration`        | `0s`         | Duration after each task update to monitor for failure (ns\|us\|ms\|s\|m\|h) (default 5s)           |
| `--update-order`               | `string`          |              | Update order ("start-first"\|"stop-first") (default "stop-first")                                   |
| `--update-parallelism`         | `uint64`          | `1`          | Maximum number of tasks updated simultaneously (0 to update all at once)                            |
| `-u`, `--user`                 | `string`          |              | Username or UID (format: <name\|uid>[:<group\|gid>])                                                |
| `--with-registry-auth`         |                   |              | Send registry authentication details to swarm agents                                                |
| `-w`, `--workdir`              | `string`          |              | Working directory inside the container                                                              |


<!---MARKER_GEN_END-->

