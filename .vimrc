set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'
"
"  " ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'


"  " ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"
"  " ------ Go ------"
Plugin 'fatih/vim-go'
"
" " ------- Typescript _______ "
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'jason0x43/vim-js-indent'
Plugin 'Quramy/tsuquyomi'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"
"
set background=light
colorscheme solarized
syntax on

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

" --------- CURSOR -----------"
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
:autocmd InsertEnter,InsertLeave * set cul!

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let NERDTreeDirArrows=0

" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn

" Enable folding (za)
set foldmethod=indent
set foldlevel=99

" width of a tab space
set tabstop=2
set shiftwidth=2
" expand tabs with spaces
set et
" ignore case in search
set ic

" ----- lightline.vim  settings -----
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ]
      \           ],
      \  'right': [  [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \              [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightlineFilename',
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \ },
      \ }
function! LightlineFilename()
  return expand('%:f/%:t') !=# '' ? expand('%f/%:t') : '[No Name]'
endfunction

" ------- Linters -------- "
let g:ale_linters = {
\   'typescript': ['tslint', 'tsserver'],
\}
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" search ctrlp with regex by default
let g:ctrlp_regexp_search = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" let g:ctrlp_clear_cache_on_exit = 0

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let undo_dir = expand('$HOME/.vim/undo_dir')
    if !isdirectory(undo_dir)
        call mkdir(undo_dir, "", 0700)
    endif
    set undodir=$HOME/.vim/undo_dir
    set undofile
endif


"
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" ---------- Strip Whitespace --------------
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

