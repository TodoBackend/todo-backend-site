#!/bin/bash
set -e -u

export BUILDSTAMP="${CIRCLE_SHA1}-${CIRCLE_BUILD_NUM}"

npm install -g bower
bundle exec rake build
