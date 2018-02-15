# Deluge

![logo](logo.jpg)

Deluge is a BitTorrent client written in Python. Deluge is cross-platform, using a front and back end architecture where libtorrent, a software library written in C++ which provides the application's networking logic, is connected to one of various front ends (including a text console, a Web interface. and a graphical desktop interface using GTK+) through the project's own Python bindings.

# Run

# FAQ

### Volumes

 * `/autoadd` - Any `.torrent` files added here will be added to deluge.
 * `/config` - Your configuration files.
 * `/downloads` - Where torrents will be stored.

### Ports

 * `8112` - Web interface
 * `58846` - RPC

### Default credentials

The default password is `deluge` but better change it.
