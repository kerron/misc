if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " VSCode like autocompletion
Plug 'itchyny/vim-gitbranch' "git branch for status line 
Plug 'itchyny/lightline.vim' "status line for vim
Plug 'herringtondarkholme/yats.vim' "syntax highlighting for typescript
Plug 'ap/vim-css-color' "shows hex colours
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "best finder in the world
Plug 'junegunn/fzf.vim' "needed for fzf
Plug 'Shougo/vimproc.vim', {'do' : 'make'} "need for ctrl-t|v to open window in fzf
Plug 'ryanoasis/vim-devicons' "icons for nerdcommenter 
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround' " command shortcuts for text
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin' " show git status in nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " stylise the nerdtree
Plug 'tpope/vim-repeat' " Allow repeating plugin commands
Plug 'vimwiki/vimwiki' " personal note taking
Plug 'Jorengarenar/vim-MvVis' " move blocks around 
Plug 'airblade/vim-gitgutter' "shows git status in gutter (sidebar)
Plug 'skamsie/vim-lineletters' " change line numbers to letters
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } } "documentation for JS/TYPESCRIPT 
Plug 'Quramy/tsuquyomi'
Plug 'joshdick/onedark.vim'
call plug#end()

set spelllang=en
set spellfile=~/.vim/spell/en.utf-8.add
set autoread                   " Auto reload changed files.
set backspace=2                " Backspace for sane people.
set backupdir=~/.vim/backups/  " Backups.
set cc=81,82                   " Column markers.
set cursorline                 " Show current line in buffer.
set swapfile
set dir=~/.vim/swap/          " Swap files.
set expandtab                  " Tabs as spaces.
set foldlevelstart=100         " Start unfolded
set hidden
set history=5000               " Command history.
set hlsearch                   " Highlight previous search results
set incsearch                  " Do incremental searching
set laststatus=2               " Always display the last status
set mouse=a                    " Mouse support.
set nohidden                   " Explicitly disallow hidden buffers.
set nonu                       " Turn off line number - necessary for relative line number
set nocompatible               " Neccessary for vimwiki
set shiftwidth=2               " How many spaces << >> modify.
set showmatch                  " Show matching braces / brackets
set showmode                   " Show the mode you're currently in
set softtabstop=2              " Make tabs act like spaces for editing ops
set t_Co=256                   " 256 colours terminal
set textwidth=0                " Width in columns to autobreak at (default)
set title                      " Let vim change my tab/window title
set timeoutlen=1000            " Chord timeouts
set ttimeoutlen=0              " Chord timeouts
set ttyfast                    " Fast TTY connection (local)
set undodir=~/.vim/undo    " Where to save undo histories
set undofile                   " Save undo's after file closes
set undolevels=1000            " How many undos
set undoreload=10000           " Number of lines to save.
set wildchar=<Tab>             " Get wild comps with Tab.
set wildmenu                   " Autocomp menu.
set wildmode=list:longest,full " Shell like filename autocomp.
set scrolloff=16
set showmatch                  " Show matching parenthesis
set matchtime=3                " time elapsed until for showing paren matches
set encoding=UTF-8
set ignorecase                 "case insensitive when search
set smartcase                  "which will automatically switch to a case-sensitive search
set virtualedit=block
set noshowmode                " hides vim mode

"" Things to ignore in filename autocomp.
set wildignore+=*.a,*.o,*.pch,*.bin,*.toc
set wildignore+=*.pyc,*.gz,*.bz2,*.7z,*.zip
set wildignore+=*.pdf,*.png,*.pdf,*.mkv,*.mp3,*.mp4
set wildignore+=*~,*.swp,.git
set completeopt-=preview " disable preview window

" vim vulnerability
set nomodeline
set re=1 " Yet Another TypeScript Syntax 

" YATS yet another typescript syntax
let g:yats_host_keyword = 1 "highlighting
set re=0
"end YATS

"NVIM
let g:python_host_prog  = '/usr/bin/python'
"end NVIM

" STATUS BAR
let g:lightline = {
      \'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" END STATUS BAR

let g:closetag_filetypes = 'html,xhtml,phtml,tsx'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tsx'


" Dart
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let dart_style_guide = 2
let dart_format_on_save = 1

" set filetypes as typescriptreact
" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
"
augroup filetype javascript syntax=javascript
augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx,*.ts,*.jsx set filetype=typescript.tsx
augroup END

" let g:solarized_termcolors=256

if system('uname -s') == "Darwin\n"
 set clipboard+=unnamedplus "OSX
else
  set clipboard=unnamedplus "Linux
endif

" COC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
" END COC

"WIKI
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
"END WIKI
" NERDCOMMENTER
nmap <silent> <C-_> <plug>NERDCommenterToggle
vmap <silent> <C-_> <plug>NERDCommenterToggle
" END NERDCOMMENTER


" NERDTree
let NERDSpaceDelims=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\.swo$', '__pycache__', '\.egg-info$', '^node_modules$', '^.watchman*', '.vscode$']
let g:NERDTreeGitStatusIndicatorMapCustom = {"Modified": "m", "Staged": "+", "Deleted": "x", "Dirty": "d"}

nmap <C-n> :NERDTreeToggle<CR>
" End NERDTree

" GIT GUTTER
nmap gc <Plug>(GitGutterNextHunk)
nmap gcp <Plug>(GitGutterPrevHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
let g:GitGutterLineNrHighlightsEnable = 1
let g:gitgutter_map_keys = 0
" END GIT GUTTER

" move using line letters
map <silent>, <Plug>LineLetters

nnoremap <silent> <Leader><space> :nohlsearch<CR>
xnoremap p pgvy

"FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_COMMAND = 'fd --type f'
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' 
      \ --layout reverse 
      \ --margin=1,4 
      \ --bind=ctrl-j:preview-down
      \ --bind=ctrl-k:preview-up"
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <silent> <Leader>h :History<CR>
nnoremap <silent> <Leader>sh :History/<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-p> :Files<CR>
imap <c-x><c-f> <plug>(fzf-complete-path)
"END FZF

" JAVASCRIPT/TYPESCRIPT DOCUMENTATION
let g:doge_javascript_settings = {
\  'destructuring_props': 1,
\}
" JAVASCRIPT/TYPESCRIPT DOCUMENTATION

filetype indent on
filetype plugin on " Neccessary for vimwiki

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

syntax enable
syntax on

set termguicolors
colorscheme onedark
