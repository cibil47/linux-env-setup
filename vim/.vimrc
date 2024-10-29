" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Turn syntax highlighting on.
syntax enable
" syntax on

" Add numbers to each line on the left-hand side.
set number

" Add relative number
set relativenumber

" Use highlighting when doing a search.
" set hlsearch

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Don't add extra line at the end of file 
set nofixendofline

set noswapfile

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

set cursorline

set undodir=~/.vim/undordir
set undofile

"So I can move around in insert
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>


" Install vim-plug if not there
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Code Completion and Language Servers
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Comment and uncomment lines
Plug 'preservim/nerdcommenter'

" Syntax highlighting for languages
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Registers related
Plug 'junegunn/vim-peekaboo'

" Color themes
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes' 

" Git wrapper
Plug 'tpope/vim-fugitive'

" Directory tree
Plug 'preservim/nerdtree'

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" Multi cursor
Plug 'mg979/vim-visual-multi'

" Visualize undo history tree (in vim undo is not linear)
Plug 'mbbill/undotree'

Plug 'kergoth/vim-bitbake'

" Assembly syntax highlighting
Plug 'HealsCodes/vim-gas'

call plug#end()

" Enable Assembly highlighting for below file extensions
autocmd BufNewFile,BufRead *.s set filetype=gas
autocmd BufNewFile,BufRead *.S set filetype=gas

" Set mapleader to space
let mapleader = " "

" Code Completion and language server
source ~/cibil/git/linux-env-setup/vim/coc.vim

" Comment and uncomment lines
source ~/cibil/git/linux-env-setup/vim/nerdcommenter.vim

" statusline/tabline plugin
source ~/cibil/git/linux-env-setup/vim/lightline.vim

" NerdTree plugin 
source ~/cibil/git/linux-env-setup/vim/nerdtree.vim

" Color Schemes
source ~/cibil/git/linux-env-setup/vim/color.vim

" Copy the whole file to system register
nmap <C-y> ggVG"+y

" map <Leader>+f to search in ag the word under the cursor
map <Leader>f :call fzf#vim#ag(expand('<cword>'))<kEnter>

" Remap ESC to Ctrl + i in insert mode
" imap <C-i> <esc>

