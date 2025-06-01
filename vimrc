":runtime vim-unbundle/plugin/unbundle.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python3_host_prog = expand('~') . "/.vim/python" . "/python-vim-env/bin/python"
autocmd TermOpen * startinsert
let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_yarp = 1

set nocompatible
"filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'VundleVim/Vundle.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'editorconfig/editorconfig-vim'
Plug 'bling/vim-airline'
Plug 'chrisbra/csv.vim'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"Plug 'tpope/vim-fugitive'
"Plug 'Igorjan94/codeforces.vim'

Plug 'posva/vim-vue'
Plug 'mzlogin/vim-smali'
Plug 'lambdalisue/suda.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'aperezdc/vim-template'
Plug 'tpope/vim-dispatch'
Plug 'dhruvasagar/vim-table-mode'
Plug 'skanehira/preview-uml.vim'
"Plug 'Shougo/neosnippet.vim'
"call vundle#end()            " required
call plug#end()            " required

""vim-colors-solarized
set background=dark
let g:solarized_termcolors=256
let mapleader = " "
colorscheme solarized
map 0 ^
imap jj <Esc>

" https://github.com/LucHermitte/local_vimrc/
set noswapfile

" airline
let g:airline#extensions#tabline#enabled = 1

" custom
set hidden

syntax on
set number
set relativenumber

set autoindent
set smartindent
set expandtab
set ts=2
set sw=2

filetype plugin on
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete
set undofile
set undodir=~/.vim/undodir
set belloff=all
set hlsearch
set ignorecase
set smartcase

map <LEADER>f :FZF<Enter>
map <LEADER><LEADER> :Buffers<Enter>
map <LEADER>r :Rg<Enter>
let g:fzf_buffers_jump = 1
map ' "

let g:suda#prefix = 'sudo://'
cmap w!! w sudo://%

autocmd FileType haskell setlocal keywordprg=hoogle\ --info
command! HaskellRun terminal runhaskell %
command! PythonRun terminal python3 %
command! PyTest terminal pytest
source ~/.vim/lsp.vim
"source ~/.vim/template.vim
let g:templates_no_autocmd = 1
let g:templates_directory = expand('~'). '/.vim/templates'
let g:templates_no_builtin_templates = 1

let g:preview_uml_url='http://localhost:8888'

" CUSTOM COMMANDS
command! Huuid let @a=system("python3 -c 'import uuid; print(uuid.uuid4())'") | let @" = substitute(@a, '\n', '', 'g')


"" BEGIN COMMON MACROS
" automatically fills field value
command! HAutoField let @q='vt:"ayf:c$=''''<Esc>"aPA,<Esc>j0'
"" END COMMON MACROS
if !empty(glob('~/.vim/autoload/plug.vim'))
  source ~/.vim/private/vimrc
endif
