#!/bin/bash
set -ex

docker run -it --rm --name vim-ide -v `pwd`:/src/ stevemcquaid/vim-ide:latest
