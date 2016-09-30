FROM debian:8.6

MAINTAINER Bruno Dias <contato@diasbruno.com>

ADD assets /assets

RUN /assets/setup.sh \ 
 && rm -rf /var/lib/apt/lists/* /var/cache

EXPOSE 1521

CMD /usr/sbin/startup.sh && /usr/sbin/sshd -D

ADD create-user.sql /docker-entrypoint-initdb.d/
