# Swarm Control

`swarmctl` is a replacement command line for `docker` regarding swarm mode support.
This command line is a drop-in replacement, with the exact same UX (actually, running the same code)

- [X] `docker swarm`   => `swarmctl swarm` 
- [X] `docker secret`  => `swarmctl secret`
- [X] `docker config`  => `swarmctl config`
- [X] `docker service` => `swarmctl service`
- [X] `docker task`    => `swarmctl task`
- [X] `docker service` => `swarmctl service`

## How to use

build:
`go build -o swarmctl cmd/main.go`

then run
`./swarmctl swarm init`