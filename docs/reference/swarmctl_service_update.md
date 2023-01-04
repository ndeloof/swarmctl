# docker swarmctl service update

<!---MARKER_GEN_START-->
Update a service

### Options

| Name                           | Type              | Default | Description                                                                                         |
|:-------------------------------|:------------------|:--------|:----------------------------------------------------------------------------------------------------|
| `--args`                       | `command`         |         | Service command args                                                                                |
| `--cap-add`                    | `list`            |         | Add Linux capabilities                                                                              |
| `--cap-drop`                   | `list`            |         | Drop Linux capabilities                                                                             |
| `--config-add`                 | `config`          |         | Add or update a config file on a service                                                            |
| `--config-rm`                  | `list`            |         | Remove a configuration file                                                                         |
| `--constraint-add`             | `list`            |         | Add or update a placement constraint                                                                |
| `--constraint-rm`              | `list`            |         | Remove a constraint                                                                                 |
| `--container-label-add`        | `list`            |         | Add or update a container label                                                                     |
| `--container-label-rm`         | `list`            |         | Remove a container label by its key                                                                 |
| `--credential-spec`            | `credential-spec` |         | Credential spec for managed service account (Windows only)                                          |
| `-d`, `--detach`               |                   |         | Exit immediately instead of waiting for the service to converge                                     |
| `--dns-add`                    | `list`            |         | Add or update a custom DNS server                                                                   |
| `--dns-option-add`             | `list`            |         | Add or update a DNS option                                                                          |
| `--dns-option-rm`              | `list`            |         | Remove a DNS option                                                                                 |
| `--dns-rm`                     | `list`            |         | Remove a custom DNS server                                                                          |
| `--dns-search-add`             | `list`            |         | Add or update a custom DNS search domain                                                            |
| `--dns-search-rm`              | `list`            |         | Remove a DNS search domain                                                                          |
| `--endpoint-mode`              | `string`          |         | Endpoint mode (vip or dnsrr)                                                                        |
| `--entrypoint`                 | `command`         |         | Overwrite the default ENTRYPOINT of the image                                                       |
| `--env-add`                    | `list`            |         | Add or update an environment variable                                                               |
| `--env-rm`                     | `list`            |         | Remove an environment variable                                                                      |
| `--force`                      |                   |         | Force update even if no changes require it                                                          |
| `--generic-resource-add`       | `list`            |         | Add a Generic resource                                                                              |
| `--generic-resource-rm`        | `list`            |         | Remove a Generic resource                                                                           |
| `--group-add`                  | `list`            |         | Add an additional supplementary user group to the container                                         |
| `--group-rm`                   | `list`            |         | Remove a previously added supplementary user group from the container                               |
| `--health-cmd`                 | `string`          |         | Command to run to check health                                                                      |
| `--health-interval`            | `duration`        |         | Time between running the check (ms\|s\|m\|h)                                                        |
| `--health-retries`             | `int`             | `0`     | Consecutive failures needed to report unhealthy                                                     |
| `--health-start-period`        | `duration`        |         | Start period for the container to initialize before counting retries towards unstable (ms\|s\|m\|h) |
| `--health-timeout`             | `duration`        |         | Maximum time to allow one check to run (ms\|s\|m\|h)                                                |
| `--host-add`                   | `list`            |         | Add a custom host-to-IP mapping (host:ip)                                                           |
| `--host-rm`                    | `list`            |         | Remove a custom host-to-IP mapping (host:ip)                                                        |
| `--hostname`                   | `string`          |         | Container hostname                                                                                  |
| `--image`                      | `string`          |         | Service image tag                                                                                   |
| `--init`                       |                   |         | Use an init inside each service container to forward signals and reap processes                     |
| `--isolation`                  | `string`          |         | Service container isolation mode                                                                    |
| `--label-add`                  | `list`            |         | Add or update a service label                                                                       |
| `--label-rm`                   | `list`            |         | Remove a label by its key                                                                           |
| `--limit-cpu`                  | `decimal`         |         | Limit CPUs                                                                                          |
| `--limit-memory`               | `bytes`           | `0`     | Limit Memory                                                                                        |
| `--limit-pids`                 | `int64`           | `0`     | Limit maximum number of processes (default 0 = unlimited)                                           |
| `--log-driver`                 | `string`          |         | Logging driver for service                                                                          |
| `--log-opt`                    | `list`            |         | Logging driver options                                                                              |
| `--max-concurrent`             | `uint`            |         | Number of job tasks to run concurrently (default equal to --replicas)                               |
| `--mount-add`                  | `mount`           |         | Add or update a mount on a service                                                                  |
| `--mount-rm`                   | `list`            |         | Remove a mount by its target path                                                                   |
| `--network-add`                | `network`         |         | Add a network                                                                                       |
| `--network-rm`                 | `list`            |         | Remove a network                                                                                    |
| `--no-healthcheck`             |                   |         | Disable any container-specified HEALTHCHECK                                                         |
| `--no-resolve-image`           |                   |         | Do not query the registry to resolve image digest and supported platforms                           |
| `--placement-pref-add`         | `pref`            |         | Add a placement preference                                                                          |
| `--placement-pref-rm`          | `pref`            |         | Remove a placement preference                                                                       |
| `--publish-add`                | `port`            |         | Add or update a published port                                                                      |
| `--publish-rm`                 | `port`            |         | Remove a published port by its target port                                                          |
| `-q`, `--quiet`                |                   |         | Suppress progress output                                                                            |
| `--read-only`                  |                   |         | Mount the container's root filesystem as read only                                                  |
| `--replicas`                   | `uint`            |         | Number of tasks                                                                                     |
| `--replicas-max-per-node`      | `uint64`          | `0`     | Maximum number of tasks per node (default 0 = unlimited)                                            |
| `--reserve-cpu`                | `decimal`         |         | Reserve CPUs                                                                                        |
| `--reserve-memory`             | `bytes`           | `0`     | Reserve Memory                                                                                      |
| `--restart-condition`          | `string`          |         | Restart when condition is met ("none"\|"on-failure"\|"any")                                         |
| `--restart-delay`              | `duration`        |         | Delay between restart attempts (ns\|us\|ms\|s\|m\|h)                                                |
| `--restart-max-attempts`       | `uint`            |         | Maximum number of restarts before giving up                                                         |
| `--restart-window`             | `duration`        |         | Window used to evaluate the restart policy (ns\|us\|ms\|s\|m\|h)                                    |
| `--rollback`                   |                   |         | Rollback to previous specification                                                                  |
| `--rollback-delay`             | `duration`        | `0s`    | Delay between task rollbacks (ns\|us\|ms\|s\|m\|h)                                                  |
| `--rollback-failure-action`    | `string`          |         | Action on rollback failure ("pause"\|"continue")                                                    |
| `--rollback-max-failure-ratio` | `float`           | `0`     | Failure rate to tolerate during a rollback                                                          |
| `--rollback-monitor`           | `duration`        | `0s`    | Duration after each task rollback to monitor for failure (ns\|us\|ms\|s\|m\|h)                      |
| `--rollback-order`             | `string`          |         | Rollback order ("start-first"\|"stop-first")                                                        |
| `--rollback-parallelism`       | `uint64`          | `0`     | Maximum number of tasks rolled back simultaneously (0 to roll back all at once)                     |
| `--secret-add`                 | `secret`          |         | Add or update a secret on a service                                                                 |
| `--secret-rm`                  | `list`            |         | Remove a secret                                                                                     |
| `--stop-grace-period`          | `duration`        |         | Time to wait before force killing a container (ns\|us\|ms\|s\|m\|h)                                 |
| `--stop-signal`                | `string`          |         | Signal to stop the container                                                                        |
| `--sysctl-add`                 | `list`            |         | Add or update a Sysctl option                                                                       |
| `--sysctl-rm`                  | `list`            |         | Remove a Sysctl option                                                                              |
| `-t`, `--tty`                  |                   |         | Allocate a pseudo-TTY                                                                               |
| `--ulimit-add`                 | `ulimit`          |         | Add or update a ulimit option                                                                       |
| `--ulimit-rm`                  | `list`            |         | Remove a ulimit option                                                                              |
| `--update-delay`               | `duration`        | `0s`    | Delay between updates (ns\|us\|ms\|s\|m\|h)                                                         |
| `--update-failure-action`      | `string`          |         | Action on update failure ("pause"\|"continue"\|"rollback")                                          |
| `--update-max-failure-ratio`   | `float`           | `0`     | Failure rate to tolerate during an update                                                           |
| `--update-monitor`             | `duration`        | `0s`    | Duration after each task update to monitor for failure (ns\|us\|ms\|s\|m\|h)                        |
| `--update-order`               | `string`          |         | Update order ("start-first"\|"stop-first")                                                          |
| `--update-parallelism`         | `uint64`          | `0`     | Maximum number of tasks updated simultaneously (0 to update all at once)                            |
| `-u`, `--user`                 | `string`          |         | Username or UID (format: <name\|uid>[:<group\|gid>])                                                |
| `--with-registry-auth`         |                   |         | Send registry authentication details to swarm agents                                                |
| `-w`, `--workdir`              | `string`          |         | Working directory inside the container                                                              |


<!---MARKER_GEN_END-->

