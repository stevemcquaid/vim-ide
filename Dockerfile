FROM    ubuntu:16.04

ENV     VERSION 0.0.1

RUN     apt-get update -y

RUN     apt-get upgrade -y

RUN     apt-get install -y \
        curl \
        nmap \
        nano \ 
        git

RUN     apt-get install -y vim

# Install Pathogen
RUN     mkdir -p /root/.vim/autoload /root/.vim/bundle
RUN     curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install vim-go-ide
RUN     git clone https://github.com/farazdagi/vim-go-ide.git /root/.vim_go_runtime
RUN     bash /root/.vim_go_runtime/bin/install

# Install python and update plugins
RUN     apt-get install -y python3-dev python3-pip; \
        pip3 install --upgrade pip
RUN     pip3 install requests
RUN     python3 /root/.vim_go_runtime/bin/update_plugins

# Install TagbarToggle
RUN     apt-get install -y exuberant-ctags

ENV     TERM xterm-256color
CMD     ["vim", "-u", "/root/.vimrc.go"]
