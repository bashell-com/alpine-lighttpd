# Lighttpd on Alpine
[![Docker Repository on Quay](https://quay.io/repository/bashell/alpine-lighttpd/status "Docker Repository on Quay")](https://quay.io/repository/bashell/alpine-lighttpd)
- Based on [Alpine-Bash](https://quay.io/repository/bashell/alpine-bash)
- Source code is on [GitHub](https://github.com/bashell-com/alpine-lighttpd)

## Usage
*(If you're using **Docker&trade;**, please change command `podman` to `docker`.)*

### Configuration and Data Storage
Assume that you want to store data on `/data`, and it is *writable*, then extract default configuration files from the image using this command:
```console
mkdir -p /data/lighttpd/etc
mkdir -p /data/lighttpd/htdocs
mkdir -p /data/lighttpd/lib/cache/compress
cd /data/lighttpd/etc
podman run --rm yyy tar c -C /etc/lighttpd -O . | tar xvf -
```
You should review and edit `lighttpd.conf` *before* next step.

### Run
```console
podman run -d --name=lighttpd \
  -v /data/lighttpd/etc:/etc/lighttpd \
  -v /data/lighttpd/htdocs:/var/www/localhost/htdocs \
  -v /data/lighttpd/lib:/var/lib/lighttpd \
  -P \
  quay.io/bashell/alpine-lighttpd
```

### Log
```console
podman logs -f lighttpd
```
