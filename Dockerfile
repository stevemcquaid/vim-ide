FROM    ubuntu:16.04

MAINTAINER Steve McQuaid <steve@stevemcquaid.com>

ENV     VERSION 0.0.1
# ENV     TERM xterm-256color

RUN     apt-get update && \
        apt-get upgrade -y

RUN     apt-get install -y \
        curl \
        wget \
        nmap \
        nano \
        git 

# RUN     apt-get install -y vim

# Install python and update plugins
RUN     apt-get install -y python3-dev python3-pip
RUN     pip3 install --upgrade pip
RUN     pip3 install requests

# Install GoLang
ENV     DEBIAN_FRONTEND noninteractive
ENV     INITRD No
ENV     LANG en_US.UTF-8
ENV     GOVERSION 1.9.4
ENV     GOROOT /opt/go
ENV     GOPATH /root/.go
RUN     cd /opt && \
        wget https://storage.googleapis.com/golang/go${GOVERSION}.linux-amd64.tar.gz && \
        tar zxf go${GOVERSION}.linux-amd64.tar.gz && \
        rm go${GOVERSION}.linux-amd64.tar.gz && \
        ln -s /opt/go/bin/go /usr/bin/ && \
        mkdir $GOPATH

# Install VIM
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
# install packages
RUN apt-get update                                                      && \
    apt-get install -y sudo ncurses-dev libtolua-dev \
            exuberant-ctags pandoc lynx                                 && \
    ln -s /usr/include/lua5.2/ /usr/include/lua                         && \
    ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so /usr/lib/liblua.so     && \
    cd /tmp
# build and install vim
RUN git clone https://github.com/vim/vim.git                            && \
    cd vim                                                              && \
    git checkout v8.0.1617                                              && \
    ./configure --with-features=huge --enable-luainterp \
        --enable-gui=no --without-x --prefix=/usr                       && \
    make VIMRUNTIMEDIR=/usr/share/vim/vim80                             && \
    make install
# get go tools
RUN go get golang.org/x/tools/cmd/godoc                                 && \
    go get github.com/nsf/gocode                                        && \
    go get github.com/derekparker/delve/cmd/dlv                         && \
    go get golang.org/x/tools/cmd/goimports                             && \
    go get github.com/rogpeppe/godef                                    && \
    go get golang.org/x/tools/cmd/guru                                  && \
    go get golang.org/x/tools/cmd/gorename                              && \
    go get github.com/golang/lint/golint                                && \
    go get github.com/kisielk/errcheck                                  && \
    go get github.com/jstemmer/gotags

## Install Pathogen
RUN     mkdir -p /root/.vim/autoload /root/.vim/bundle
RUN     curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install vim-go-ide
RUN     git clone https://github.com/farazdagi/vim-go-ide.git /root/.vim_go_runtime
RUN     bash /root/.vim_go_runtime/bin/install
RUN     python3 /root/.vim_go_runtime/bin/update_plugins

# Install TagbarToggle
RUN     apt-get install -y exuberant-ctags

# RUN     vim +PluginInstall +qall

# Copy files over
ADD     dotfiles/.vimrc /.vimrc
ADD     dotfiles/.bashrc /.bashrc
ADD     dotfiles/.profile /.profile

# Install golang and deps for vim-go-ide
# See line 24

ENV     TERM xterm-256color
CMD     ["vim", "-u", "/root/.vimrc.go"]
