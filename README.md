### neovim Configuration for Python 
neovim configuration for python in Ubuntu
Tested and working fine on Ubuntu 20.04, python 3.8

### Steps

* Install neovim - https://github.com/neovim/neovim/wiki/Installing-Neovim (recommend building from source)
* Install the vim pluggin manager, vim-plug - https://github.com/junegunn/vim-plug
* install the required python libraries in the base environment
```shell
pip install pynvim --upgrade flake8 black jedi
```
* copy the init.vim file to ~/.config/nvim/init.vim
* start the neovim by caling nvim from terminal
* Install the pluggins that are added in the init.vim file by running the following from nvim
```shell
<esc> :PlugInstall <enter>
```
* restart and run nvim!

For installation, please refer https://www.youtube.com/watch?v=YZVgKEiYp9k
