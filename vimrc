"Creating File of configurations for Vim, following random internet tutorial 
"
if empty(glob('$HOME/.vim/autoload/plug.vim'))
  silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirsDone!
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype off

"Especificando o diretorio aonde deverão ser instalados os plugins do Vim

call plug#begin('$HOME/.vim/Plugins')


" Local de Listagem dos Plugins

"Nerd tree (NerdTree Git)
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' 

"Nerd Commenter
Plug 'scrooloose/nerdcommenter'

"UltiSnips, plugin para inserir compleições de código baseadas em um arquivos
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

"Using VimTex for writing text
Plug 'lervag/vimtex'

" Vim airline and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Testing the YouCompleteMe plugin, for C Programming Languages families syntax
"support, first a commit for sake of safeness :)
"Plug 'Valloric/YouCompleteMe'
"Plug 'valloric/youcompleteme'

"Plugin for parentesis and quotes completion
Plug 'Raimondi/delimitMate'

"Plugin for navigation in panes, windows and splits in tmux
Plug 'christoomey/vim-tmux-navigator'

"Plugin para agilizar folds in vim, principalmente em vimtex
Plug 'konfekt/fastfold'

"" Plugin for syntax checking, Asynchronous Light Engine
"Plug 'w0rp/ale'

" Plugin for autocompletion of Python builtins 
Plug 'davidhalter/jedi-vim'

" Supertab for Python files completion tests
Plug 'ervandew/supertab'

" Tagbar - Destaque de definições
Plug 'majutsushi/tagbar'

" Mark the commented plugins for removal

" #### Plugins in avaliation

" Custom surround text
Plug 'tpope/vim-surround'

" Tpope's Vim fugitive was installed in the directory

" Float terminal
Plug 'voldikss/vim-floaterm'

" Shougo denite vim
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Vim corretor automático para texto
Plug 'sedm0784/vim-you-autocorrect', { 'branch': 'gh5_flicker'}

" Nord Pallete Color Scheme
Plug 'mhartington/oceanic-next'
Plug 'edkolev/tmuxline.vim'
Plug 'szorfein/fromthehell.vim'

" Vim bracket special highlighting
Plug 'luochen1990/rainbow'

" Html/CSS edition
Plug 'mattn/emmet-vim'

" Focus writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Coc auto-completion/intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do':'pip3 install jedi==0.18.0'}

call plug#end()

""Colocando esquema de cores
"colorscheme gotham
"colorscheme OceanicNext
"colorscheme nord
"colorscheme iceberg
"colorscheme spacegray
set encoding=utf-8
set relativenumber
set number
filetype indent on
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set colorcolumn=50,70,90,100
set scrolloff=5
set hlsearch
set showmatch
"set spell spelllang=pt
" Spell suggestion ´sps´
set sps=10 
"filetype plugin indent on 
syntax on
"colorscheme fromthehell
colorscheme OceanicNext

highlight SpellBad ctermfg=DarkRed ctermbg=None
set backspace=indent,eol,start

" Typewriter mode
function! Typewriter()
    nnoremap j jzt
    nnoremap k kzt
    " Latex: Salvar e compilar
    nnoremap <localleader>v :w<CR>:VimtexCompile<CR>:VimtexView <CR> 
endfunction

nnoremap <F5> :call Typewriter()<CR>
call Typewriter()

" Primeira funão de autocomando
autocmd! BufReadPost *.tex set fdm=marker

" Python virtual environment detection



" MAPEAMENTO DE TECLAS

"#################################################


" -> RELOAD VIMRC 
" Source the .vimrc or _vimrc file, depending on system
if &term == "win32" || "pcterm" || has("gui_win32")
	noremap ,v :e $HOME/_vimrc<CR>
	nmap <F12> :<C-u>source $HOME/_vimrc <BAR> echo "Vimrc recarregado!"<CR>
else
	noremap ,v :e $HOME/.vimrc<CR>
	nmap <F12> :<C-u>source $HOME/.vimrc <BAR> echo "Vimrc recarregado!"<CR>
endif  
" -> END: RELOAD VIMRC

" Abrir o .vimrc para edição
map <F9> :vsplit +113 $HOME/.vimrc <CR> 
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
noremap <localleader>h zt
noremap <localleader>l zb
"inoremap <silent> <C-e> <C-\><C-O>zt<C-O>7<C-Y>
" Para poder recuperar texto apagado acidentalmente  em Insert Mode
inoremap <silent> <C-W> <C-\><C-O>db
inoremap <silent> <C-U> <C-\><C-O>d0
"inoremap <silent> <C-Y> <C-R>"

" VIM congifuration from scratch
nnoremap <silent> <backspace> :nohlsearch<Bar>:echo<CR>

" ->END: GUIAS

" -> LEADER 
let mapleader = "\ "
let g:mapleader = "\ "
let maplocalleader = "\\"

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
nnoremap <localleader>= :vertical resize +15<cr>
nnoremap <localleader>- :vertical resize -15<cr>

" Inserir linha antes e depois do texto 
nnoremap <localleader>o o<esc>
nnoremap <localleader>O O<esc>

" Desabilitando função Ex do vim pela tecla Q
nnoremap Q <nop>

" Incremental substitution
" let i = 550 | g/^\s*\(\)\=/s//\=printf("%d, ", i)/ | let i = i-1

" Vim 8+: Mapeamento do terminal
nnoremap <leader>pt :terminal ++shell python3 %

" Se o a numeração de erros do ALE ficar pesada lembrar de 
" desativar a numeração para tentar ajudar.
"map <F5> <C-\>:set number!<CR> 
"nnoremap <localleader>T :ALEFix trim_whitespace <CR>
"nnoremap <localleader>Y :ALEFix remove_trailing_lines <CR>

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
" Automatically open the NerdTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Closing NerdTree window if it is the only open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Using this to prevent opening files in Tree buffer
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
let g:plug_window = 'noautocmd vertical topleft new'

noremap <F2> :NERDTreeToggle<cr>


"################ ############## -############### -> NERDCOMMENTER ############### ###############  

" Usando configuração expressa recomendada pela 
" descrição do projeto no Github

" Comentar linhas acima
map <leader>co O<esc><leader>cA

" ############################################# -> VIMSPELL  ###########################
" 

" Função para não ativar o corretor ortográfico
" em arquivos que não sejam de texto

let b:fn_exten=expand('%:e')
if b:fn_exten == 'tex'
    set spelllang=pt
else
    set nospell
endif

" Definição do verificador ortográfico
function! Toogle_spell()
    if &spelllang == 'pt'
        set spell spelllang=en
        echom "Changed Spell Language to English!"
    else
        set spell spelllang=pt
        echom "Idioma alterado para Português!"
    endif
endfunction

nnoremap <F8> :call Toogle_spell()<CR>

"" Vim-Grammarous
"" Enable use of vim-spelllang
"let g:grammarous#use_vim_spelllang=1
"let g:grammarous#show_first_error = 1
"nnoremap <localleader>G <Plug>(grammarous-open-info-window)
"vnoremap <C-g> :GrammarousCheck <CR> 


"################ ############## -###############-> ULTISNIPS ############### ###############  

" If you want :UltiSnipsEdit to split your window.
" Função encontrada em fórum para mudar a selação de snippets para Enter
let g:ulti_expand_or_jump_res = 0

function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
" Those mapping below must remove the '\' before the quote to work
"imap <expr> <CR> pumvisible() ? \"<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : \"<Plug>delimitMateCR"
"imap <expr> <CR> pumvisible() ? \"<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : \"\n"

"let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="ª"
let g:UltiSnipsJumpBackwardTrigger="º"
let g:UltiSnipsSnippetDirectories = ['$HOME/.vim/UltiSnips', 'UltiSnips']

"############################################# ---> YOUCOMPLETEME ################################

"let g:ycm_use_clangd = "Always"
""let g:ycm_server_python_interpreter = ''

"" Video do Youtube TLDR

"let g:ycm_python_binary_path = 'python3'
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_min_num_of_chars_for_completion = 2

"" Trying to use a gobal configuration file to python coding -> Valloric's User's Guide
"let g:ycm_python_interpreter_path = ''

"" Function to get variable of python
""function! GetBashPython()
    ""let b:env_python = system('which python3')
""endfunction

""" Call function to get python environment
"":call GetBashPython()

"let g:ycm_python_sys_path = ["/usr/local/lib/python3.6/dist-packages/tensorflow"]
"let g:ycm_extra_conf_vim_data = [
  "\  'g:ycm_python_interpreter_path',
  "\  'g:ycm_python_sys_path'
  "\]
"let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_config/python/global_extra_conf.py'
"let g:ycm_server_python_interpreter = '/usr/bin/python3.6'
""let g:ycm_server_python_interpreter = b:env_python


" ############################################# --> VIMTEX #######################################
"  Configuration of vim for using LaTeX text editor(?)
"
let g:vimtex_view_method = 'zathura'
let g:latex_view_general_viewer = 'zathura'
let g:tex_flavor = 'latex'
"let g:vimtex_compiler_latexmk = {'build_dir': './output'}
let g:vimtex_compiler_method = 'latexrun'
let g:vimtex_compiler_latexrun = {'build_dir': './output/'}
let g:vimtex_complete_bib = {'simple': 1}


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
" Folding methods in vimtex
let g:vimtex_fold_enabled = 1
" To fold only subsections
let g:vimtex_fold_types = {'sections':{'parse_levels':0, 'sections': ['subsection', 'subsubsections']} }
set fillchars=fold:\ 

"let g:vimtex_quickfix_enabled = 0
let g:vimtex_quickfix_mode=0
"let g:vimtex_fold_manual = 1 
"
"Table of Contents customization
augroup vimtex_customization
  autocmd!
  autocmd FileType tex call CreateTocs()
augroup END

function! CreateTocs()
  let g:custom_toc1 = vimtex#toc#new({
      \ 'layers' : ['label', 'todo'],
      \ 'todo_sorted' : 0,
      \ 'show_help' : 0,
      \ 'show_numbers' : 0,
      \ 'mode' : 4,
      \})
  nnoremap <silent> \ly :call g:custom_toc1.open()<cr>

  let g:custom_toc2 = vimtex#toc#new({
      \ 'layers' : ['include'],
      \ 'show_help' : 0,
      \})
  nnoremap <silent> \lY :call g:custom_toc2.open()<cr>
endfunction

"" ############################################# -> VIM-ALE  ###########################
"" Plugin for asynchronous linting (hope that is fast)
"" Janela lateral
"let g:ale_set_loclist = 1
"let g:ale_list_vertical = 1
"let g:ale_keep_list_window_open = 1

"let g:ale_linters = {'python' : ['flake8']}
"let g:ale_fixers = {'python' : [ 'pylint', 'autopep8', 'yapf']}
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_close_preview_on_insert = 1 
"let g:ale_cursor_detail = 0
"let g:ale_echo_delay=300

"" For ALE linting process
"let g:airline#extensions#ale#enabled = 1

"" Mappings for quickfix operations
"nmap \e :ALENext<CR>
"nmap \r :ALEPrevious<CR>
"nmap <C-q> :ALEToggle<CR>
"nmap <C-d> <Plug>(ale_detail)

"let g:ale_list_window_size = 3
"let g:ale_sign_column_always = 1
"let g:ale_echo_cursor = 1

"" Formatting echos msg
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" ################################################ -> LIGTHLINE ##################################
"  Configuration for Gotham Theme
"let g:lightline = { 'colorscheme': 'gotham' }
"let g:lightline = { 'colorscheme': 'oceanicnext' }

" Air line configuration for buffer show
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'deus'
let g:airline#extensions#tmuxline#enabled = 0

" TmuxLine
let g:tmuxline_theme = 'zenburn'


" ############################################# -> VIM-TMUX-NAVIGATOR ###########################
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1 

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" ############################################# -> JEDI-VIM  ###########################

let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0

" Remove the tab completion mode, consider using Supertab
let g:jedi#completions_command = "<C-Space>"
let g:jedi#show_call_signatures = "0"


" ############################################# -> TAGBAR   ##########################
nnoremap <F6> :TagbarToggle <CR><C-W>w


" ############################################# -> FUGITIVE-VIM   ##########################

" Git help functions, password cache

" Add all files from CWD
nnoremap <F3> :Git add . <CR>
nnoremap <F4> :Git commit <CR>



" ############################################# -> DENITE-VIM ##########################

" Denite default mappings documentation example
" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" ######################################################  VIM-YOU-AUTOCORRECT ##

" Para desfazer a palavra corrigida automaticamente
imap <C-Z> <C-O><Plug>VimyouautocorrectUndo

" Para fazer que vá para a próxima palavra
imap <C-r> <C-O><Plug>VimyouautocorrectNext
imap <C-e> <C-O><Plug>VimyouautocorrectPrevious

" ######################################################  VIM-FLOATERM ##
 
nnoremap <F7> :FloatermNew <CR>
tnoremap <F7> <C-\><C-N>:FloatermKill <CR>

" ######################################################  GOYO and LIMELIGHT ##
let g:limelight_conceal_ctermfg = 'gray'


" ######################################################  CoC.VIM ##
"
" ## Coc.vim documentation suggested mappings!
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" ####################### Rainbow-vim ###############
let g:rainbow_active = 0 "set to 0 if you want to enable it later via :RainbowToggle

