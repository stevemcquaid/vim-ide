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

# VIM
ENV     LANG en_US.UTF-8
ENV     LANGUAGE en_US:en
# Install deps/packages
RUN     apt-get update                                                      && \
        apt-get install -y sudo ncurses-dev libtolua-dev \
            exuberant-ctags pandoc lynx                                 && \
        ln -s /usr/include/lua5.2/ /usr/include/lua                         && \
        ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so /usr/lib/liblua.so     && \
        cd /tmp
# Build and install vim
RUN     git clone https://github.com/vim/vim.git                            && \
        cd vim                                                              && \
        git checkout v8.0.1617                                              && \
        ./configure --with-features=huge --enable-luainterp \
            --enable-gui=no --without-x --prefix=/usr                       && \
        make VIMRUNTIMEDIR=/usr/share/vim/vim80                             && \
        make install

# Get go tools
RUN     go get golang.org/x/tools/cmd/godoc                                 && \
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

# Install vundle
# RUN     git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim

# Install vim-go-ide
RUN     git clone https://github.com/farazdagi/vim-go-ide.git /root/.vim_go_runtime
RUN     bash /root/.vim_go_runtime/bin/install
RUN     python3 /root/.vim_go_runtime/bin/update_plugins

# Install TagbarToggle
RUN     apt-get install -y exuberant-ctags

ENV     UHOME=/root
# Copy files over
#RUN cd $UHOME/.vim/bundle/ \
#    && git clone --depth 1 https://github.com/pangloss/vim-javascript \
#    && git clone --depth 1 https://github.com/scrooloose/nerdcommenter \
#    && git clone --depth 1 https://github.com/godlygeek/tabular \
#    && git clone --depth 1 https://github.com/Raimondi/delimitMate \
#    && git clone --depth 1 https://github.com/nathanaelkane/vim-indent-guides \
#    && git clone --depth 1 https://github.com/groenewege/vim-less \
#    && git clone --depth 1 https://github.com/othree/html5.vim \
#    && git clone --depth 1 https://github.com/elzr/vim-json \
#    && git clone --depth 1 https://github.com/bling/vim-airline \
#    && git clone --depth 1 https://github.com/easymotion/vim-easymotion \
#    && git clone --depth 1 https://github.com/mbbill/undotree \
#    && git clone --depth 1 https://github.com/majutsushi/tagbar \
#    && git clone --depth 1 https://github.com/vim-scripts/EasyGrep \
#    && git clone --depth 1 https://github.com/jlanzarotta/bufexplorer \
#    && git clone --depth 1 https://github.com/kien/ctrlp.vim \
#    && git clone --depth 1 https://github.com/scrooloose/nerdtree \
#    && git clone --depth 1 https://github.com/jistr/vim-nerdtree-tabs \
#    && git clone --depth 1 https://github.com/scrooloose/syntastic \
#    && git clone --depth 1 https://github.com/tomtom/tlib_vim \
#    && git clone --depth 1 https://github.com/marcweber/vim-addon-mw-utils \
#    && git clone --depth 1 https://github.com/vim-scripts/taglist.vim \
#    && git clone --depth 1 https://github.com/terryma/vim-expand-region \
#    && git clone --depth 1 https://github.com/tpope/vim-fugitive \
#    && git clone --depth 1 https://github.com/airblade/vim-gitgutter \
#    && git clone --depth 1 https://github.com/fatih/vim-go \
#    && git clone --depth 1 https://github.com/plasticboy/vim-markdown \
#    && git clone --depth 1 https://github.com/michaeljsmith/vim-indent-object \
#    && git clone --depth 1 https://github.com/terryma/vim-multiple-cursors \
#    && git clone --depth 1 https://github.com/tpope/vim-repeat \
#    && git clone --depth 1 https://github.com/tpope/vim-surround \
#    && git clone --depth 1 https://github.com/vim-scripts/mru.vim \
#    && git clone --depth 1 https://github.com/vim-scripts/YankRing.vim \
#    && git clone --depth 1 https://github.com/tpope/vim-haml \
#    && git clone --depth 1 https://github.com/SirVer/ultisnips \
#    && git clone --depth 1 https://github.com/honza/vim-snippets \
#    && git clone --depth 1 https://github.com/derekwyatt/vim-scala \
#    && git clone --depth 1 https://github.com/christoomey/vim-tmux-navigator \
#    && git clone --depth 1 https://github.com/ekalinin/Dockerfile.vim \
#    # Theme
#    && git clone --depth 1 https://github.com/altercation/vim-colors-solarized

    # vimrc pluginsi

RUN     cd $UHOME/.vim/bundle/ \
        && git clone --depth 1 https://github.com/godlygeek/tabular \
        && git clone --depth 1 https://github.com/scrooloose/nerdtree \
        && git clone --depth 1 https://github.com/scrooloose/nerdcommenter \
        && git clone --depth 1 https://github.com/jistr/vim-nerdtree-tabs \
        && git clone --depth 1 https://github.com/fatih/vim-go \
        && git clone --depth 1 https://github.com/Lokaltog/vim-easymotion \
        && git clone --depth 1 https://github.com/majutsushi/tagbar \
        && git clone --depth 1 https://github.com/tpope/vim-repeat \
        && git clone --depth 1 https://github.com/tpope/vim-speeddating \
        && git clone --depth 1 https://github.com/tpope/vim-surround \
        && git clone --depth 1 https://github.com/tpope/vim-pathogen \
        && git clone --depth 1 https://github.com/tpope/vim-fugitive \
        && git clone --depth 1 https://github.com/tpope/vim-git \
        && git clone --depth 1 https://github.com/tpope/vim-commentary \
        && git clone --depth 1 https://github.com/vim-scripts/AutoClose \
        && git clone --depth 1 https://github.com/bling/vim-airline \
        && git clone --depth 1 https://github.com/vim-airline/vim-airline-themes \
        && git clone --depth 1 https://github.com/bling/vim-bufferline \
        && git clone --depth 1 https://github.com/airblade/vim-gitgutter \
        && git clone --depth 1 https://github.com/scrooloose/syntastic \
        && git clone --depth 1 https://github.com/plasticboy/vim-markdown \
        && git clone --depth 1 https://github.com/mbbill/undotree \
        && git clone --depth 1 https://github.com/myusuf3/numbers.vim \
        && git clone --depth 1 https://github.com/ekalinin/Dockerfile.vim \
        && git clone --depth 1 https://github.com/MarcWeber/vim-addon-mw-utils 

ADD     dotfiles/.vimrc /.vimrc
ADD     dotfiles/.bashrc /.bashrc
ADD     dotfiles/.profile /.profile
# ADD     dotfiles/.vim/colors /root/.vim/colors

# ADD     dotfiles/.vim/bundle/ /root/.vim/bundle/

# Install golang and deps for vim-go-ide
# See line 24
ENV     HOME /root
ENV     TERM xterm-256color

#CMD     ["vim", "-u", "/root/.vimrc.go"]

RUN     mkdir -p /src

WORKDIR /src

CMD     ["vim", "-u", "/.vimrc"]

