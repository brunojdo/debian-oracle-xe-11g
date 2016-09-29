FROM debian:8.6

# MAINTAINER Wei-Ming Wu <wnameless@gmail.com>

ADD assets /assets

RUN /assets/setup.sh

EXPOSE 1521

CMD /usr/sbin/startup.sh && /usr/sbin/sshd -D

RUN rm -rf /var/lib/apt/lists/* /var/cache

ADD create-user.sql /docker-entrypoint-initdb.d/
