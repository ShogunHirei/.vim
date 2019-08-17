"Creating File of configurations for Vim, following random internet tutorial 
"
if empty(glob('/home/lucashqr/.vim/autoload/plug.vim'))
  silent !curl -fLo /home/lucashqr/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype off

"Especificando o diretorio aonde deverão ser instalados os plugins do Vim

call plug#begin('/home/lucashqr/.vim/Plugins')


" Local de Listagem dos Plugins
"
"Color theme
Plug 'mhartington/oceanic-next'

"Nerd tree
Plug 'scrooloose/nerdtree'

"Nerd Commenter
Plug 'scrooloose/nerdcommenter'

"UltiSnips, plugin para inserir compleições de código baseadas em um arquivos
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'

"Using VimTex for writing text
Plug 'lervag/vimtex'

"Using the LightLine (I believe that's for highliting of the under bar
Plug 'itchyny/lightline.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Testing the YouCompleteMe plugin, for C Programming Languages families syntax
"support, first a commit for sake of safeness :)
Plug 'valloric/youcompleteme'

"Plugin for parentesis and quotes completion
Plug 'vim-scripts/delimitMate.vim'

"Plugin for navigation in panes, windows and splits in tmux
Plug 'christoomey/vim-tmux-navigator'

"Plugin para agilizar folds in vim, principalmente em vimtex
Plug 'konfekt/fastfold'

"Testando ferramentas para manipulação de múltiplas janelas
"Plug 'cesheridan/tabwins'

" Plugin for syntax checking, Asynchronous Light Engine
Plug 'w0rp/ale'

" Plugin for multiple cursors selection
Plug 'terryma/vim-multiple-cursors'

" Plugin for autocompletion of Python builtins 
Plug 'davidhalter/jedi-vim'

" Supertab for Python files compoletion tests
Plug 'ervandew/supertab'

" CtrlP, Fuzzy File finder, encontrar arquivos em diretórios 
Plug 'kien/ctrlp.vim'

call plug#end()

""Colocando esquema de cores
"colorscheme gotham
colorscheme OceanicNext
"colorscheme iceberg
"colorscheme spacegray
set number
"filetype indent on
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set colorcolumn=30,50,80,100
set hlsearch
set showmatch
filetype plugin indent on 
syntax on



" MAPEAMENTO DE TECLAS

"#################################################


" -> RELOAD VIMRC 
" Source the .vimrc or _vimrc file, depending on system
if &term == "win32" || "pcterm" || has("gui_win32")
	noremap ,v :e $HOME/_vimrc<CR>
	nmap <F12> :<C-u>source /home/lucashqr/_vimrc <BAR> echo "Vimrc recarregado!"<CR>
else
	noremap ,v :e $HOME/.vimrc<CR>
	nmap <F12> :<C-u>source /home/lucashqr/.vimrc <BAR> echo "Vimrc recarregado!"<CR>
endif  
" -> END: RELOAD VIMRC

" Abrir o .vimrc para edição
map <F9> :vsplit ~/.vimrc <CR> 
"
"
" EDIÇÃO, VISUALIZAÇÃO, GERENCIAMENTO, etc... 
"#################################################
"
" -> GUIAS 
noremap <localleader>k :tabnext<cr>
noremap <localleader>j :tabprevious<cr>
noremap <localleader>q :tabclose<cr>
noremap <localleader>b :tabnew 
inoremap <silent> <C-e> <C-\><C-O>zt<C-O>7<C-Y>
" Para poder recuperar texto apagado acidentalmente  em Insert Mode
inoremap <silent> <C-W> <C-\><C-O>db
inoremap <silent> <C-U> <C-\><C-O>d0
"inoremap <silent> <C-Y> <C-R>"
" Para navegar melhor em splits
" Retirado por causa da navegação em Tmux
"nnoremap <C-j> <C-w><C-j>
"nnoremap <C-k> <C-w><C-k>
"nnoremap <C-l> <C-w><C-l>
"nnoremap <C-h> <C-w><C-h>

" VIM congifuration from scratch
nnoremap <silent> <backspace> :nohlsearch<Bar>:echo<CR>

" ->END: GUIAS

" -> LEADER 
let mapleader = " "
let g:mapleader = " "

noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
noremap <leader>wq :wq<cr>
noremap <leader><leader>n /
noremap <leader><leader>N ?
noremap <leader><leader>s :s/
noremap <leader><leader>S :%s/
noremap <S-Tab> <C-i>
noremap <Tab> <C-o>
" Redimensionar janela na vertical (acho)
nnoremap _+ :resize +5<cr>
nnoremap __ :resize -5<cr>
nnoremap <localleader>+ :vertical resize +15<cr>
nnoremap <localleader>_ :vertical resize -15<cr>

" Inserir linha antes e depois do texto 
nnoremap <localleader>o o<esc>
nnoremap <localleader>O O<esc>


" Se o a numeração de erros do ALE ficar pesada lembrar de 
" desativar a numeração para tentar ajudar.
map <F5> <C-\>:set number!<CR> 
nnoremap <localleader>T :ALEFix trim_whitespace <CR>
nnoremap <localleader>Y :ALEFix remove_trailing_lines <CR>

" Para navegar entre os buffers mais facilmente

nnoremap <leader>BB :bN <CR>
nnoremap <leader>bb :bn <CR>
nnoremap <leader>bx :bdelete <CR>
" -> END: LEADER 

"""CONFIGURAÇÃO DOS PLUGINS
"
"############### ############### ############### --> NERDTREE ############### ############### #### 

let NERDTreeShowHidden=1
let NERDTreeMapActivateNode='<right>'
noremap <F2> :NERDTreeToggle<cr>


"################ ############## -############### -> NERDCOMMENTER ############### ###############  

" Usando configuração expressa recomendada pela 
" descrição do projeto no Github

" Comentar linhas acima
map <leader>co O<esc><Leader>cA


"################ ############## -###############-> ULTISNIPS ############### ###############  

" If you want :UltiSnipsEdit to split your window.
" Função encontrada em fórum para mudar a selação de snippets para Enter
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="ª"
let g:UltiSnipsJumpBackwardTrigger="º"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']


"############################################# ---> YOUCOMPLETEME ################################

let g:ycm_use_clangd = "Always"
let g:ycm_clangd_binary_path = "/home/lucashqr/Configuration Files/YCM Installation/llvm_root"
let g:ycm_server_python_interpreter = ''

" Video do Youtube TLDR

let g:ycm_python_binary_path = 'python3'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" Trying to use a gobal configuration file to python coding -> Valloric's User's Guide
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = ["/usr/local/lib/python3.6/dist-packages/tensorflow"]
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/Configuration Files/YCM/Python/global_extra_conf.py'
"let g:ycm_server_python_interpreter = '/usr/bin/python3.6'


" ############################################# --> VIMTEX #######################################
"  Configuration of vim for using LaTeX text editor(?)
"
let g:vimtex_view_method = 'zathura'
let g:latex_view_general_viewer = 'zathura'
let g:tex_flavor = 'xelatex'

" Para mudar o compilador para XeTex
function! SetXeTex()
    let g:Tex_CompileRule_pdf = 'xelatex -aux-directory=F:/Vim/my_latex_doc/temp --synctex=-1 '\
    '-src-specials -interaction=nonstopmode $*'
endfunction

map <localleader>lx :<C-U>call SetXeTex()<CR>

" Habilitar autocompletar com o YCM
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif

let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
let g:vimtex_fold_enabled = 1

" ############################################# -> VIM-ALE  ###########################
" Plugin for asynchronous linting (hope that is fast)
let g:ale_linters = {'python' : [ 'pylint', 'flake8']}
let g:ale_fixers = {'python' : ['autopep8', 'yapf']}
let g:ale_lint_on_text_changed = 'never'
let g:ale_close_preview_on_insert = 1 
let g:ale_cursor_detail = 0

" For ALE linting process
let g:airline#extensions#ale#enabled = 1

" Mappings for quickfix operations
nmap \e :ALENext<CR>
nmap \r :ALEPrevious<CR>
nmap <C-q> :ALEToggle<CR>
nmap <C-d> <Plug>(ale_detail)

let g:ale_list_window_size = 5

let g:ale_echo_cursor = 0

" ################################################ -> LIGTHLINE ##################################
"  Configuration for Gotham Theme
"let g:lightline = { 'colorscheme': 'gotham' }
let g:lightline = { 'colorscheme': 'oceanicnext' }

" Air line configuration for buffer show
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'oceanicnext'


" ############################################# -> VIM-TMUX-NAVIGATOR ###########################
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1 

nnoremap <silent> <C-l> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-h> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" ############################################# -> JEDI-VIM  ###########################

let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "bottom"
let g:jedi#popup_select_first = 1

" Remove the tab completion mode, consider using Supertab
let g:jedi#completions_command = "<C-Space>"


