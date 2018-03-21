#!/bin/bash
set -ex

source scripts/common.sh

docker run -it -v $PWD/dotfiles:/root --rm stevemcquaid/$PACKAGE_NAME:latest
