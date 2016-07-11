#!/usr/bin/env bash

cd /usr/src/wpscan
scl enable rh-ruby23 "./wpscan.rb $*"