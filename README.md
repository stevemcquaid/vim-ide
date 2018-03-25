# Vim Golang IDE

A nice VIM development environment in a container

# Usage
  * ```docker run -v `pwd`:/src -it --rm stevemcquaid/vim-ide:latest``` - Run vim using current dir as project source.
  * `make help` - View available make-targets
  * `make build` - Build Dockerfile
  * `make run` - Run container in current directory

# Useful commands
  * `ctrl+w, h` - Select NERDTree browser window
  * `ctrl+w, l` - Select source code window
  * `ctrl+w, h, m` - Select NERDTree browser window, modify the file structure (add/delete/copy/move files or dirs)
  * `<<` - Indent line
  * `>>` - Outdent line
  * `u` - Undo
  * `ctrl+r` - Redo
  * `,+c+<space>` - Toggle comment on selected line(s)

# Todo
  - [x] Get the .vimrc working with pathogen
  - [x] Use pathogen to load a custom plugin
  - [x] Install vim-go-ide using pathogen
  - [x] Merge the nice stuff of https://github.com/farazdagi/vim-go-ide into the .vimrc (Dockerfile#ln87-125)
  - [x] Disable space autocomplete globally (Disable other autocomplete engines)
  - [x] Change color scheme
  - [x] Get a kickass bottom bar
  - [x] Get vim comment keybindings working
  - [x] Get vim indentation keybindings working
  - [ ] Load python autocomplete support with pathogen
  - [ ] Get autocomplete with function parameters working (Deocomplete?)
  - [ ] Get other language bindings to work well
  - [ ] Figure out vim buffer/tab navigation
  - [ ] Consolidate plugin customizations (-.vim files)
  - [ ] Always add trailing newline
  - [ ] Set markdown indentation to 2 spaces

