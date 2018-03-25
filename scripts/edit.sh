#!/bin/bash
set -ex

docker run -it --rm --name vim-ide -e TERM=$TERM -v `pwd`:/src/ stevemcquaid/vim-ide:latest
