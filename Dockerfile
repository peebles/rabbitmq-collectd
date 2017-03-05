FROM pataquets/collectd
RUN apt-get update && apt-get install -y python libpython2.7 python-setuptools wget && apt-get clean
RUN easy_install collectd-rabbitmq && \
    wget https://raw.githubusercontent.com/NYTimes/collectd-rabbitmq/master/config/types.db.custom && \
    cat types.db.custom >> /usr/share/collectd/types.db && rm types.db.custom
ADD write-graphite.conf /etc/collectd/conf-available/write-graphite.conf
ADD rabbitmq.conf /etc/collectd/conf-available/rabbitmq.conf
ADD run.sh run.sh
ENTRYPOINT [ "/run.sh" ]
