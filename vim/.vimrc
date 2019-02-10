set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'prettier/vim-prettier', {'do': 'yarn install','for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']}
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-surround'
call plug#end()

:syntax on
:set cursorline
:set nosmd
:set noru
:set incsearch

set clipboard=unnamedplus
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set relativenumber
set updatetime=250
set noshowmode
set ttimeoutlen=0
set laststatus=0
set directory^=$HOME/.vim/tmp//

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
  let g:ycm_semantic_triggers['typescript'] = ['.'] 
