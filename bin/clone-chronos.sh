#!/bin/bash

set -x
set -e

cd /opt
rm -rf /opt/chronos
git clone git@github.com:stevencox/stars-releases.git chronos

exit 0
