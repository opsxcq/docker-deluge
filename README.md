# Deluge
[![Docker Pulls](https://img.shields.io/docker/pulls/strm/deluge.svg?style=plastic)](https://hub.docker.com/r/strm/deluge/)

![logo](logo.jpg)

Deluge is a BitTorrent client written in Python. Deluge is cross-platform, using
a front and back end architecture where libtorrent, a software library written
in C++ which provides the application's networking logic, is connected to one of
various front ends (including a text console, a Web interface. and a graphical
desktop interface using GTK+) through the project's own Python bindings.

# Run

```yaml
version: '3'

services:
    deluge:
      image: strm/deluge
      volumes:
        - "/data/torrent-files/:/dot-torrent"
        - "/data/torrent-input/:/autoadd"
        - "/data/torrent:/downloads"
        - "deluge-incomplete:/incomplete"
        - "deluge-config:/config"
      ports:
        - "8888:8112"
        - "58846:58846"

volumes:
  deluge-incomplete:
  deluge-config:
```

# FAQ

### Volumes

 * `/autoadd` - Any `.torrent` files added here will be added to deluge.
 * `/dot-torrent` - `.torrent` files that you've downloaded.
 * `/config` - Your configuration files.
 * `/downloads` - Where torrents will be stored.
 * `/config` - Where configuration and torrent metadata will be stored.

### Ports

 * `8112` - Web interface
 * `58846` - RPC

### Default credentials

If you let deluge set the cretentials, the default password is `deluge` but
better change it. The default password in the config file is `secret`.
