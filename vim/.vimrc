if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'valloric/youcompleteme'
Plug 'ianks/vim-tsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-surround'
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
Plug 'natebosch/vim-lsc' " dart language support for vim
Plug 'dart-lang/dart-vim-plugin'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
" Navigate undo tree
Plug 'simnalamburt/vim-mundo'
call plug#end()

set runtimepath+=~/.vim_runtime
set spelllang=en
set spellfile=$HOME/Dropbox/vim/spell/en.utf-8.add
execute pathogen#infect()

augroup filetype javascript syntax=javascript

set autochdir                  " Set working dir to current file
set autoread                   " Auto reload changed files.
set backspace=2                " Backspace for sane people.
set backupdir=~/.vim/backup//  " Backups.
set cc=81,82                   " Column markers.
set clipboard=unnamed,unnamedplus " Yank to both tmux and X window clipboard
set cursorline                 " Show current line in buffer.
set diffopt+=vertical          " Show diffs of files split vertically
set dir=~/.vim/swap//          " Swap files.
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
set number                     " Set line numbers
set relativenumber             " Relative line number
set shiftwidth=2               " How many spaces << >> modify.
set showmatch                  " Show matching braces / brackets
set showmode                   " Show the mode you're currently in
set softtabstop=2              " Make tabs act like spaces for editing ops
set t_Co=256                   " 256 colours terminal
set textwidth=0                " Width in columns to autobreak at (default)
set timeout                    " For YCM's recompilation.
set title                      " Let vim change my tab/window title
set timeoutlen=1000            " Chord timeouts
set ttimeoutlen=0              " Chord timeouts
set ttyfast                    " Fast TTY connection (local)
set undodir=$HOME/.vim/undo    " Where to save undo histories
set undofile                   " Save undo's after file closes
set undolevels=1000            " How many undos
set undoreload=10000           " Number of lines to save.
set wildchar=<Tab>             " Get wild comps with Tab.
set wildmenu                   " Autocomp menu.
set wildmode=list:longest,full " Shell like filename autocomp.
set scrolloff=16

"" Things to ignore in filename autocomp.
set wildignore+=*.a,*.o,*.pch,*.bin,*.toc
set wildignore+=*.pyc,*.gz,*.bz2,*.7z,*.zip
set wildignore+=*.pdf,*.png,*.pdf,*.mkv,*.mp3,*.mp4
set wildignore+=*~,*.swp,.git

let javaScript_fold=1
let g:gitgutter_async=1
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

nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <leader>m :NERDTreeToggle<CR>

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd BufRead,BufNewFile *.md setlocal spell

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

if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

syntax enable
syntax on
hi tsxTagName guifg=#E06C75 ctermfg=DarkRed
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
"set background=light
"colorscheme solarized
