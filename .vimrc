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
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'wting/gitsessions.vim'
Plugin 'digitaltoad/vim-pug'

"
"  " ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"
"  " ------ Go ------"
Plugin 'fatih/vim-go', { 'do': 'GoUpdateBinaries' } 

" " ------- Typescript _______ "
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'jason0x43/vim-js-indent'
Plugin 'Quramy/tsuquyomi'

" " ------- Rust ------- "
Plugin 'rust-lang/rust.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"
set background=dark
colorscheme desert
call togglebg#map("<F5>")
syntax on

filetype plugin indent on

" removes scrollbar from macvim
set guioptions=
set wildignore=*/node_modules/*,*/build/*
set guifont=Hermit\ Light\ 10

" no bells 
set visualbell
set t_vb=

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

" --- clears highlighted search --- "
nmap <silent> :/ :nohlsearch<CR>

" --------- CURSOR -----------"
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
:autocmd InsertEnter,InsertLeave * set cul!

" ----- Tsuquyomi -----
nmap <silent> <leader>i :TsuImport<CR>
let g:tsuquyomi_singlequte_import = 1
let g:tsuquyomi_completion_case_sensitive = 1
let g:tsuquyomi_completion_preview = 1
let g:tsuquyomi_disable_quickfix = 0
let g:tsuquyomi_save_onrename = 1

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeToggle<CR>
let NERDTreeDirArrows=0
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$', '\.swo$']

" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
set signcolumn=yes

" Enable folding (za)
set foldmethod=indent
set foldlevel=99

" width of a tab space
set tabstop=2
set shiftwidth=2
" expand tabs with spaces
set et
" ignore case in search
" set ic

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
let g:ale_linters = {}
let g:ale_linters['typescript'] = ['tsserver']
let g:ale_linters['javascript'] = []
let g:ale_linters['rust'] = ['cargo']
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_linters_explicit = 1

let g:ale_fixers = {}
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_fix_on_save_ignore = ['tslint', 'tsserver']
let g:ale_typescript_prettier_use_local_config = 1 

" auto-format/complete rust "  
let g:rustfmt_autosave = 1

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" ------- Markdown Preview -------- "
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

" search ctrlp with regex by default
let g:ctrlp_regexp_search = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_clear_cache_on_exit = 1

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let undo_dir = expand('$HOME/.vim/undo_dir')
    if !isdirectory(undo_dir)
        call mkdir(undo_dir, "", 0700)
    endif
    set undodir=$HOME/.vim/undo_dir
    set undofile
endif

" ---------- Swap Lines ---------------
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-s-up> :call <SID>swap_up()<CR>
noremap <silent> <c-s-down> :call <SID>swap_down()<CR>

" strip trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" fullscreen fix 
map <silent> <F11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

" list TODO's
command! Todo noautocmd vimgrep /TODO/j src/** | cw
command! W noautocmd w
command! Q noautocmd q

"
"-------- Copy/Paste from visual mode --------" 
set clipboard=unnamed
