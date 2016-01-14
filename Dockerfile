FROM debian:jessie
MAINTAINER mail@danny-edel.de

COPY sources-pre.list /etc/apt/sources.list
COPY debconf-preseed /tmp/

RUN export DEBIAN_FRONTEND=noninteractive \
	&& debconf-set-selections /tmp/debconf-preseed \
	&& apt-get update \
	&& apt-get -y dist-upgrade \
	&& apt-get -y install apt-cacher-ng/jessie-backports \
	&& apt-get -y install supervisor \
	&& apt-get -y install anacron unattended-upgrades ssmtp apt-listchanges \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /tmp/*

COPY backends_debian backends_ubuntu \
	/etc/apt-cacher-ng/

COPY sources-post.list /etc/apt/sources.list

COPY supervisord.conf /etc/supervisor/conf.d/

EXPOSE 3142

ENTRYPOINT [ "/usr/bin/supervisord" ]

VOLUME [ "/var/cache/apt-cacher-ng" ]
