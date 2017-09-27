#!/bin/bash

set -x
set -e

cd /opt

rm -rf /opt/chronos
git clone git@github.com:stevencox/stars-releases.git chronos
cd chronos

export MESOS_NATIVE_LIBRARY=/usr/local/lib/libmesos.so
/bin/java -cp chronos*.jar org.apache.mesos.chronos.scheduler.Main $*
    --zk_hosts=zk://stars-dc0.edc.renci.org:2181,stars-dc1.edc.renci.org:2181,stars-dc2.edc.renci.org:2181 \
    --master=zk://stars-dc0.edc.renci.org:5050,stars-dc1.edc.renci.org:5050,stars-dc2.edc.renci.org:5050/mesos 

exit 0
