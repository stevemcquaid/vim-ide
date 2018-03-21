#!/bin/bash
set -ex

docker run -ti --rm -e TERM=$TERM -v $(pwd):/project/ rr32btg/vim-go-ide
