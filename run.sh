#!/bin/bash

sed -i "s/__host__/$RABBITMQ_HOST/g" /etc/collectd/conf-available/rabbitmq.conf
sed -i "s/__username__/$RABBITMQ_USERNAME/g" /etc/collectd/conf-available/rabbitmq.conf
sed -i "s/__password__/$RABBITMQ_PASSWORD/g" /etc/collectd/conf-available/rabbitmq.conf

sed -i "s/__graphite__/$GRAPHITE_HOST/g" /etc/collectd/conf-available/write-graphite.conf

cat \
    /etc/collectd/conf-available/rabbitmq.conf \
    /etc/collectd/conf-available/write-graphite.conf \
    | tee -a /etc/collectd/collectd.conf

# Print resulting collectd.conf file, just to be sure.
nl /etc/collectd/collectd.conf

exec collectd -f

