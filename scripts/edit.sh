#!/bin/bash
set -ex

docker run -it --rm -e TERM=$TERM -v `pwd`:/src/ stevemcquaid/vim-ide:latest
