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
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'Quramy/tsuquyomi' " Typescript as-you-type errors and linting
Plug 'leafgarland/typescript-vim' " Typescript syntax highlighting and support
Plug 'google/vim-jsonnet' " Jsonnet syntax highlighting and general support
Plug 'unblevable/quick-scope' " Highlight good anchors for `FftT` movement.
Plug 'Chiel92/vim-autoformat' " Run autoformatters in a consistent way.
Plug 'plasticboy/vim-markdown' " Markdown syntax highlighting.
Plug 'hynek/vim-python-pep8-indent' " Auto PEP8 identation for python.
Plug 'vim-scripts/txt.vim' " Generic syntax highlighting for text files
Plug 'natebosch/vim-lsc'
Plug 'dart-lang/dart-vim-plugin'
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

" Things to ignore in filename autocomp.
set wildignore+=*.a,*.o,*.pch,*.bin,*.toc
set wildignore+=*.pyc,*.gz,*.bz2,*.7z,*.zip
set wildignore+=*.pdf,*.png,*.pdf,*.mkv,*.mp3,*.mp4
set wildignore+=*~,*.swp,.git

let javaScript_fold=1
" Airline
let g:airline#extensions#hunks#enabled = 0
let g:airline_powerline_fonts=1
" Dart
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let dart_style_guide = 2
let dart_format_on_save = 1
" reset prettier defaults
let g:prettier#autoformat = 0
let g:prettier#config#single_quote = 'false'
" max line length that prettier will wrap on
let g:prettier#config#print_width = 80
" number of spaces per indentation level
let g:prettier#config#tab_width = 2
" use tabs over spaces
let g:prettier#config#use_tabs = 'false'
" print semicolons
let g:prettier#config#semi = 'true'
" single quotes over double quotes
let g:prettier#config#single_quote = 'false'
" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'
" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'false'
" avoid|always
let g:prettier#config#arrow_parens = 'avoid'
" none|es5|all
let g:prettier#config#trailing_comma = 'none'
" flow|babylon|typescript|css|less|scss|json|graphql|markdown
let g:prettier#config#parser = 'none'
" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'
" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'

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
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
"set background=light
"colorscheme solarized
