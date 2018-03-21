#!/bin/bash
set -ex

source scripts/common.sh

docker build -t stevemcquaid/$PACKAGE_NAME:latest .
