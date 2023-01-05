# Swarm Control

![logo.png](logo.png)

`swarmctl` is a replacement command line for `docker` regarding swarm mode support.
This command line is a drop-in replacement, with the exact same UX (actually, running the same code)

- [X] `docker swarm`   => `swarmctl swarm` 
- [X] `docker node`    => `swarmctl node`
- [X] `docker secret`  => `swarmctl secret`
- [X] `docker config`  => `swarmctl config`
- [X] `docker service` => `swarmctl service`
- [X] `docker stack`   => `swarmctl stack`

## How to use

build:
`make`

then run
`./bin/build/swarmctl swarm init`

## Demo

[![asciicast](https://asciinema.org/a/aPX9jrbMuPMsS8MLcgtvNi7vA.svg)](https://asciinema.org/a/aPX9jrbMuPMsS8MLcgtvNi7vA)