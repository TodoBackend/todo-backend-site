#!/bin/bash
set -e -u

export BUILDSTAMP="${CIRCLE_SHA1}-${CIRCLE_BUILD_NUM}"

bundle install --path=vendor/bundle
