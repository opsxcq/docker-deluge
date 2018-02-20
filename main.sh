#!/bin/bash

if [ ! -f "/config/autoadd.conf" ]
then
    cat > /config/autoadd.conf <<EOF
{
  "file": 1, 
  "format": 1
}{
  "watchdirs": {
    "1": {
      "path": "/autoadd", 
      "abspath": "/autoadd", 
      "enabled": true
    }
  }, 
  "next_id": 2
}
EOF
fi

if [ ! -f "/config/web.conf" ]
then
    cat > /config/web.conf <<EOF
{
  "file": 1, 
  "format": 1
}{
  "port": 8112, 
  "enabled_plugins": [
    "Label", 
    "AutoAdd", 
    "Extractor", 
    "Execute"
  ], 
  "pwd_sha1": "49061dcaa629c86b78f023f6aa94231b3be55fc8", 
  "theme": "gray", 
  "show_sidebar": true, 
  "sidebar_show_zero": true, 
  "pkey": "ssl/daemon.pkey", 
  "https": false, 
  "sessions": {
    "ddee2c7c56eeec380e2e930e99405d52": {
      "login": "admin", 
      "expires": 1518581268.0, 
      "level": 10
    }
  }, 
  "base": "/", 
  "pwd_salt": "80150185e4ab059a6a210947a2807acca98d2eaf", 
  "show_session_speed": true, 
  "first_login": false, 
  "cert": "ssl/daemon.cert", 
  "session_timeout": 3600, 
  "default_daemon": "", 
  "sidebar_multiple_filters": true
}
EOF
fi

if [ ! -f "/config/blocklist.conf" ]
then
    cat > /config/blocklist.conf <<EOF
{
  "file": 1, 
  "format": 1
}{
  "check_after_days": 4, 
  "timeout": 180, 
  "url": "http://john.bitsurge.net/public/biglist.p2p.gz", 
  "try_times": 3, 
  "list_size": 7649836, 
  "last_update": 1518590804.334369, 
  "list_type": "PeerGuardian", 
  "list_compression": "GZip", 
  "load_on_start": false
}
EOF
fi


if [ ! -f "/config/core.conf" ]
then
    cat > /config/core.conf <<EOF
{
  "file": 1, 
  "format": 1
}{
  "info_sent": 0.0, 
  "lsd": false, 
  "send_info": false, 
  "move_completed_path": "/downloads", 
  "enc_in_policy": 0, 
  "queue_new_to_top": false, 
  "ignore_limits_on_local_network": true, 
  "rate_limit_ip_overhead": true, 
  "daemon_port": 58846, 
  "natpmp": true, 
  "max_active_limit": 8, 
  "utpex": true, 
  "max_active_downloading": 3, 
  "max_active_seeding": 5, 
  "allow_remote": true, 
  "max_half_open_connections": -1, 
  "download_location": "/incomplete", 
  "compact_allocation": true, 
  "max_upload_speed": 15.0, 
  "cache_expiry": 60, 
  "prioritize_first_last_pieces": false, 
  "auto_managed": true, 
  "enc_level": 2, 
  "max_connections_per_second": -1, 
  "dont_count_slow_torrents": false, 
  "random_outgoing_ports": true, 
  "max_upload_slots_per_torrent": -1, 
  "new_release_check": false, 
  "enc_out_policy": 0, 
  "outgoing_ports": [
    0, 
    0
  ], 
  "seed_time_limit": 180, 
  "cache_size": 512, 
  "share_ratio_limit": 2.0, 
  "max_download_speed": 1000.0, 
  "geoip_db_location": "/usr/share/GeoIP/GeoIP.dat", 
  "torrentfiles_location": "/dot-torrent/", 
  "stop_seed_at_ratio": false, 
  "peer_tos": "", 
  "listen_interface": "", 
  "upnp": true, 
  "max_download_speed_per_torrent": -1, 
  "max_upload_slots_global": -1, 
  "enabled_plugins": [
    "Label", 
    "AutoAdd", 
    "Extractor", 
    "Execute", 
    "Notifications", 
    "Scheduler", 
    "Blocklist"
  ], 
  "random_port": true, 
  "autoadd_enable": true, 
  "max_connections_global": -1, 
  "enc_prefer_rc4": false, 
  "listen_ports": [
    6881, 
    6891
  ], 
  "dht": true, 
  "stop_seed_ratio": 2.0, 
  "seed_time_ratio_limit": 7.0, 
  "max_upload_speed_per_torrent": -1, 
  "copy_torrent_file": true, 
  "del_copy_torrent_file": false, 
  "move_completed": true, 
  "proxies": {
    "peer": {
      "username": "", 
      "password": "", 
      "type": 0, 
      "hostname": "", 
      "port": 8080
    }, 
    "web_seed": {
      "username": "", 
      "password": "", 
      "type": 0, 
      "hostname": "", 
      "port": 8080
    }, 
    "tracker": {
      "username": "", 
      "password": "", 
      "type": 0, 
      "hostname": "", 
      "port": 8080
    }, 
    "dht": {
      "username": "", 
      "password": "", 
      "type": 0, 
      "hostname": "", 
      "port": 8080
    }
  }, 
  "add_paused": false, 
  "max_connections_per_torrent": 100, 
  "remove_seed_at_ratio": false, 
  "autoadd_location": "/autoadd", 
  "plugins_location": "/config/plugins"
}
EOF
fi


if [ ! -f "/config/extractor.conf" ]
then
    cat > /config/extractor.conf <<EOF
{
  "file": 1, 
  "format": 1
}{
  "use_name_folder": true, 
  "extract_path": "/downloads/extracted"
}
EOF
fi

deluged -c /config
deluge-web -c /config/
