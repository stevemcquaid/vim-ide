#!/bin/bash
set -ex

source scripts/common.sh

docker push stevemcquaid/$PACKAGE_NAME:latest
