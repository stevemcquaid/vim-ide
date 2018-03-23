# Vim Golang IDE

A nice VIM development environment in a container

# Usage
    `docker run -v $PWD:/src -it --rm stevemcquaid/$PACKAGE_NAME:latest` - Run vim using current dir as project source.
    `make help` - View available make-targets

# Useful commands
    `ctrl+w, h` - Select NERDTree browser window
    `ctrl+w, l` - Select source code window
    `ctrl+w, h, m` - Select NERDTree browser window, modify the file structure (add/delete/copy/move files or dirs)

# Todo
    [x] Get the .vimrc working with pathogen
    [ ] Use pathogen to load a custom plugin
    [ ] Load python autocomplete support with pathogen
    [ ] Install vim-go-ide using pathogen
    [ ] Merge the nice stuff of https://github.com/farazdagi/vim-go-ide into the .vimrc (Dockerfile#ln87-125)


