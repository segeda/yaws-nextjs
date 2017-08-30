FROM eptwalabha/alpine-yaws:0.2

COPY yaws.conf /etc/yaws/yaws.conf
COPY www /var/app/www
COPY src /var/app/src
COPY ebin /var/app/ebin

EXPOSE 80 80

CMD yaws -D --heart && tail -f /var/app/www/index.yaws
