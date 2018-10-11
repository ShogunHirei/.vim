"#Creating File of configurations for Vim, following random internet tutorial 
"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"Especificando o diretorio aonde deverão ser instalados os plugins do Vim

call plug#begin('~/.vim/Plugins')

"Color theme
Plug 'szorfein/fromthehell.vim'

call plug#end()


""Colocando esquema de cores
syntax on
colorscheme fromthehell
