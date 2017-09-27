#!/bin/bash

set -x
set -e

cd /opt/chronos
export MESOS_NATIVE_LIBRARY=/usr/local/lib/libmesos.so
/bin/java -cp chronos*.jar org.apache.mesos.chronos.scheduler.Main $*

exit 0
