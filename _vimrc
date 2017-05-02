" set nocompatible
" set old regexp engine
" set re=1
" set mouse=a
filetype on
set rtp+=~/vimfiles/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'ctrlp.vim'
Bundle 'emmet.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
" Plugin 'jpo/vim-railscasts-theme'
" Bundle 'rizzatti/funcoo.vim'
" Bundle 'rizzatti/dash.vim'
" Bundle 'rstacruz/sparkup'

let g:user_emmet_leader_key='<C-f>'
let g:user_emmet_mode='inv'

let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_server_type = 'roslyn'

" ctrlp option
" let g:ctrlp_working_path_mode = 'c'

" set shellcmdflag=-ic
colorscheme industry
syntax on

set nohlsearch
set nobackup
set expandtab
set number
set incsearch
set ignorecase
set ruler
"set paste
set textwidth=999
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set backspace=indent,eol,start
"set foldlevel=0
"set foldmethod=marker
set guifont=Consolas:h14
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ \ [%l/%L\ (%p%%)
set encoding=utf8
"set clipboard+=unnamed
"colors wintersday
filetype plugin indent on
" set cursorline
set nowrap
"highlight Cursorline guibg=#333333
"set cursorcolumn
"highlight Cursorcolumn guibg=#111111
"let g:netrw altv = 1 " netrw to split new file in the right

" make CTRL-Y funcation as scroll up in windows
" unmap <C-Y>

" activate html snipp in erb file
au BufRead *.erb set ft=erb.html


" Map keys on how to move between split panes
map <silent>,h <C-w>h
map <silent>,j <C-w>j
map <silent>,k <C-w>k
map <silent>,l <C-w>l

let mapleader = "-"

" tabn
nmap <leader>1 :tabn 1<CR>
nmap <leader>2 :tabn 2<CR>
nmap <leader>3 :tabn 3<CR>
nmap <leader>4 :tabn 4<CR>
nmap <leader>5 :tabn 5<CR>
nmap <leader>6 :tabn 6<CR>
nmap <leader>7 :tabn 7<CR>
nmap <leader>8 :tabn 8<CR>

nmap \ dd
map <leader><space> viw
"map <c-d> dd
"imap <c-d> <esc>ddi
" nnoremap <leader>d dd
" nnoremap <leader>c ddO
nmap <leader>d ddp

" NERDTree settings
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"
map <silent><F9> :NERDTreeToggle<CR>
noremap <silent> <F9> :NERDTreeToggle<CR>

" back to normal mode from insert mode
inoremap jj <Esc>

" My own customizations for python programming
" au FileType python set textwidth=79 "comply with PEP8
au FileType python set tabstop=4
au FileType python set softtabstop=4
au FileType python set shiftwidth=4
au FileType python set commentstring=\ #\ %s
" au FileType python let g:pydiction_location = 'C:/Program\ Files/Vim/vimfiles/ftplugin/python/pydiction/complete-dict' 

" My own customizations for ruby programming
au FileType ruby set textwidth=79
au FileType ruby set tabstop=2
au FileType ruby set softtabstop=2
au FileType ruby set shiftwidth=2
au FileType ruby set commentstring=\ #\ %s

" augroup AutoReloadConfig
"     autocmd!
"     autocmd BufWritePre .vimrc echo "reload!"
"     autocmd BufWritePost .vimrc so % 
" augroup END

fun! BuildNodePlayground()
    call BuildPlayground("node", "//=>", "console.log")
    echom "Let's play node"
endfun

fun! BuildPythonPlayground()
    call BuildPlayground("python", "#=>", "print")
    echom "Let's play python"
endfun

fun! BuildRubyPlayground()
    call BuildPlayground("ruby", "#=>", "puts")
    echom "Let's play ruby"
endfun

fun! BuildLispPlayground()
    call BuildPlayground("clisp", ";;=> ", "print")
    echom "Let's play CLisp"
endfun

function! Ext()
    autocmd!
    autocmd! BufWritePost <buffer> execute "!$(which ruby) ~/play/ejext/generator/jxc.rb %"
endfunction

function! Xext()
    autocmd!
    autocmd! BufWritePost <buffer> execute "!/Users/jing/.rvm/rubies/ruby-2.1.2/bin/ruby ~/play/extjsml/bin/extjsmlc % -with-requirejs"
endfunction

" au FileType ruby call Rb_append_output()

" My own customizations for yaml
au FileType yaml set textwidth=79
au FileType yaml set tabstop=2
au FileType yaml set softtabstop=2
au FileType yaml set shiftwidth=2
au FileType yaml set commentstring=\ #\ %s

filetype plugin on

" if &term =~ "xterm"
"   "256 color --
"     let &t_Co=256
"     " restore screen after quitting
"     set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
"   if has("terminfo")
"     let &t_Sf="\ESC[3%p1%dm"
"     let &t_Sb="\ESC[4%p1%dm"
"   else
"     let &t_Sf="\ESC[3%dm"
"     let &t_Sb="\ESC[4%dm"
"   endif
" endif
" colorscheme tmrnight

if has("win32")
    set shell=cmd.exe
    set shellcmdflag=/c\ powershell.exe\ -NoLogo\ -NoProfile\ -NonInteractive\ -ExecutionPolicy\ RemoteSigned
    set shellpipe=|
    set shellredir=>
endif
