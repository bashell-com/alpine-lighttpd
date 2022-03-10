FROM quay.io/bashell/alpine-bash:latest

MAINTAINER Chaiwat Suttipongsakul "cwt@bashell.com"

RUN apk update \
 && apk upgrade \
 && apk add --no-cache \
	lighttpd \
	lighttpd-mod_auth \
	lighttpd-mod_webdav \
 && mkdir -p /var/lib/lighttpd/cache/compress \
 && chown -R lighttpd:lighttpd /var/lib/lighttpd \
 && ln -s /dev/fd/3 /var/log/lighttpd/access.log \
 && ln -s /dev/stderr /var/log/lighttpd/error.log \
 && rm -rf /var/cache/*/*

COPY start.sh /start.sh

VOLUME ["/etc/lighttpd", "/var/lib/lighttpd", "/var/www"]

STOPSIGNAL SIGTERM

EXPOSE 443/tcp 80/tcp

CMD ["/start.sh"]

