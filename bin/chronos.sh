#!/bin/bash

set -x
set -e

cd /opt

if [ -d chronos ]; then
    cd chronos
    git pull
else
    git clone git@github.com:stevencox/stars-releases.git chronos
    cd chronos
fi

export MESOS_NATIVE_^CBRARY=/usr/local/lib/libmesos.so
/bin/java -cp chronos*.jar org.apache.mesos.chronos.scheduler.Main \
    --zk_hosts=zk://stars-dc0.edc.renci.org:2181,stars-dc1.edc.renci.org:2181,stars-dc2.edc.renci.org:2181 \
    --master=zk://stars-dc0.edc.renci.org:5050,stars-dc1.edc.renci.org:5050,stars-dc2.edc.renci.org:5050/mesos

exit 0
