#!/bin/bash

chown lighttpd:lighttpd /var/lib/lighttpd
chown lighttpd:lighttpd /var/lib/lighttpd/cache
chown lighttpd:lighttpd /var/lib/lighttpd/cache/compress

exec 3>&1
/usr/sbin/lighttpd-angel -D -f /etc/lighttpd/lighttpd.conf

