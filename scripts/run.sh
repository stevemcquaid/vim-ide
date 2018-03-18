#!/bin/bash
set -ex

source scripts/common.sh

docker run -it -v $PWD:/src --rm stevemcquaid/$PACKAGE_NAME:latest
