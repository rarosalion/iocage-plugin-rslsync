#!/bin/sh

## add user to match up with rslsync guide
pw user add rslsync -c rslsync -u 817 -d /nonexistent -s /usr/bin/nologin

## create rslsync db folder
mkdir -p /var/db/rslsync
mkdir -p /usr/local/bin
chown rslsync:rslsync /var/db/rslsync

## install bin
fetch -o /tmp https://download-cdn.resilio.com/stable/freebsd/x64/0/resilio-sync_freebsd_x64.tar.gz
tar xvf /tmp/resilio-sync_freebsd_x64.tar.gz -C /usr/local/bin/
rm /usr/local/bin/LICENSE.TXT /tmp/resilio-sync_freebsd_x64.tar.gz

# enable the service
sysrc rslsync_enable="YES"

# start the service
find -type d /usr/local/etc -exec chmod 755 {} \;
chmod 644 /usr/local/etc/rslsync.conf
ls -alF /usr/local/etc/
service rslsync start # 2>/dev/null
