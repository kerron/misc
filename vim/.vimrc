if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-surround'
Plug 'othree/yajs.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'Quramy/tsuquyomi' " Typescript as-you-type errors and linting
Plug 'leafgarland/typescript-vim' " Typescript syntax highlighting and support
Plug 'mhinz/vim-signify' " Display git diff in gutter.
Plug 'google/vim-jsonnet' " Jsonnet syntax highlighting and general support
Plug 'unblevable/quick-scope' " Highlight good anchors for `FftT` movement.
Plug 'Chiel92/vim-autoformat' " Run autoformatters in a consistent way.
Plug 'plasticboy/vim-markdown' " Markdown syntax highlighting.
Plug 'hynek/vim-python-pep8-indent' " Auto PEP8 identation for python.
Plug 'vim-scripts/txt.vim' " Generic syntax highlighting for text files
call plug#end()


set runtimepath+=~/.vim_runtime
set spelllang=en
set spellfile=$HOME/Dropbox/vim/spell/en.utf-8.add
execute pathogen#infect()

augroup filetype javascript syntax=javascript

set cursorline
set foldcolumn=1
set foldlevelstart=99 
set foldmethod=syntax
let javaScript_fold=1
set nosmd
set noru
set incsearch
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
set number
set showcmd
set wildmenu
set showmatch
set hlsearch
set foldenable
set foldlevelstart=20
set clipboard=unnamed
set clipboard=unnamedplus

let g:prettier#autoformat = 0
let g:prettier#config#single_quote = 'false'
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

let g:solarized_termcolors=256

if has('gui_running')
    set background=light
else
    set background=dark
endif

if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

call togglebg#map("alt+t")

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>e :call FzyCommand("find . -type f", ":e")<cr>
nnoremap <leader>v :call FzyCommand("find . -type f", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("find . -type f", ":sp")<cr>
nnoremap <leader>e :call FzyCommand("ag . --silent -l -g ''", ":e")<cr>
nnoremap <leader>v :call FzyCommand("ag . --silent -l -g ''", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("ag . --silent -l -g ''", ":sp")<cr>
nnoremap <leader><space> :nohlsearch<cr>

filetype indent on

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax enable
syntax on
"colorscheme onedark
"let g:airline_theme='onedark'

