# BIRD Looking Glass

These are docker images for [bird-lg](https://github.com/sileht/bird-lg) build from sources:
- **ibhde/bird-lgproxy** - proxy to query the local *bird* instance
- **ibhde/bird-lg** - web based frontend UI


## Tagged Docker Images

The images are based on Debain GNU/Linux and install **bird-lg** from the github sources.

### bird-lgproxy

* [`latest` Dockerfile](https://github.com/DE-IBH/bird-lg-docker/blob/master/bird-lgproxy/Dockerfile)

  [![Layers](https://images.microbadger.com/badges/image/ibhde/bird-lgproxy:latest.svg)](https://images.microbadger.com/badges/image/ibhde/bird-lgproxy:latest)

### bird-lg

* [`latest` Dockerfile](https://github.com/DE-IBH/bird-lg-docker/blob/master/bird-lg/Dockerfile)

  [![Layers](https://images.microbadger.com/badges/image/ibhde/bird-lg:latest.svg)](https://images.microbadger.com/badges/image/ibhde/bird-lg:latest)


## Usage

The container will run with user nobody:nogroup (65534:65534) by default. You need to ensure that *bird-lgproxy* is allowed to query *bird* by passing the approperiate uid/gid via the LGGID or LGUID environemnt variables!

### docker run

```
$ docker run --rm --net=host -e LGGID:101 -v /path/to/bird/sockets:/var/run/bird ibhde/bird-lgproxy
```

```
$ docker run --rm ibhde/bird-lg
```

### docker-compose

```
# docker-compose.yml example for lg
version: '3'
services:
  lg:
    image: ibhde/bird-lg
    volumes:
      - ./conf/lg/lg.cfg:/bird-lg/lg.cfg:ro
    restart: always
```

```
# docker-compose.yml example for lgproxy
version: '3'
services:
  lgproxy:
    image: ibhde/bird-lgproxy
    network_mode: host
    environment:
      - LGGID=0
    volumes:
      - ./conf.d/lgproxy.cfg:/bird-lg/lgproxy.cfg:ro
      - /var/run/bird:/var/run/bird
      - /var/run/bird6:/var/run/bird6
    restart: always

```
