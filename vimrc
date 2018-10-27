"#Creating File of configurations for Vim, following random internet tutorial 
"
if empty(glob('/home/shogunhirei/.vim/autoload/plug.vim'))
  silent !curl -fLo /home/shogunhirei/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"Especificando o diretorio aonde deverão ser instalados os plugins do Vim

call plug#begin('/home/shogunhirei/.vim/Plugins')


" Local de Listagem dos Plugins
"
"Color theme
Plug 'szorfein/fromthehell.vim'

"Nerd tree
Plug 'scrooloose/nerdtree'

"Nerd Commenter
Plug 'scrooloose/nerdcommenter'

"UtilSnips, plugin para inserir compleições de código baseadas em um arquivos
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

"Testing the YouCompleteMe plugin, for C Programming Languages families syntax
"support, first a commit for sake of safeness :)



call plug#end()


""Colocando esquema de cores
syntax on
colorscheme fromthehell
set number
filetype plugin on 
filetype indent on
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent


" MAPEAMENTO DE TECLAS
"#################################################


" -> RELOAD VIMRC 
" Source the .vimrc or _vimrc file, depending on system
if &term == "win32" || "pcterm" || has("gui_win32")
	map ,v :e $HOME/_vimrc<CR>
	nmap <F12> :<C-u>source /home/shogunhirei/_vimrc <BAR> echo "Vimrc recarregado!"<CR>
else
	map ,v :e $HOME/.vimrc<CR>
	nmap <F12> :<C-u>source /home/shogunhirei/.vimrc <BAR> echo "Vimrc recarregado!"<CR>
endif  
" -> END: RELOAD VIMRC
"
"
"
" EDIÇÃO, VISUALIZAÇÃO, GERENCIAMENTO, etc... 
"#################################################
"
" -> GUIAS 
map <F4> :tabnext<cr>
map <F3> :tabprevious<cr>

" ->END: GUIAS

" -> LEADER 
let mapleader = " "
let g:mapleader = " "
map <leader>w :w<cr>
map <leader>qq :q!<cr>

" -> END: LEADER 

"""CONFIGURAÇÃO DOS PLUGINS
"#################################################
"
"-> NerdTree Configurations""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeMapActivateNode='<right>'
map <F2> :NERDTreeToggle<cr>


"-> END NerdTree configurations""""""""""""""""""

"-> NerdCommenter
" Usando configuração expressa recomendada pela 
" descrição do projeto no Github


"->END: NerdCommenter
"
"
" -> UtilSnips
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"



" -> END: UtilSnips
















