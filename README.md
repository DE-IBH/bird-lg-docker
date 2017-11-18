# BIRD Looking Glass

These are docker images for [bird-lg](https://github.com/sileht/bird-lg) build from sources:
- **liske/bird-lgproxy** - proxy to query the local *bird* instance
- **liske/bird-lg** - web based frontend UI


## Tagged Docker Images

The images are based on Debain GNU/Linux and install **bird-lg** from the github sources.

### bird-lgproxy

* [`latest` Dockerfile](https://github.com/liske/bird-lg-docker/blob/master/bird-lgproxy/Dockerfile)

  [![Layers](https://images.microbadger.com/badges/image/liske/bird-lgproxy:latest.svg)](https://images.microbadger.com/badges/image/liske/bird-lgproxy:latest)

### bird-lg

* [`latest` Dockerfile](https://github.com/liske/bird-docker/blob/master/bird-lg/Dockerfile)

  [![Layers](https://images.microbadger.com/badges/image/liske/bird-lg:latest.svg)](https://images.microbadger.com/badges/image/liske/bird-lg:latest)


## Usage

The container will run with user nobody:nogroup (65534:65534) by default.
You need to ensure that *bird-lgproxy* is allowed to query *bird* by passing the approperiate uid/gid via the LGGID or LGUID environemnt variables!

```
$ docker run --rm --net=host -e LGGID:101 -v /path/to/bird/sockets:/var/run/bird liske/bird-lgproxy
```

```
$ docker run --rm liske/bird-lg
```
