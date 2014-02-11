set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'ctrlp'

" ctrlp option
" let g:ctrlp_working_path_mode = 'c'

set shellcmdflag=-ic
syntax on
set nohlsearch
set nobackup
set expandtab
set number
set incsearch
set ignorecase
set ruler
"set paste
set textwidth=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set backspace=indent,eol,start
"set foldlevel=0
set foldmethod=marker
"set guifont=Monaco:h20
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ \ [%l/%L\ (%p%%)
set encoding=utf8
"set clipboard+=unnamed
"colors wintersday
filetype plugin indent on
set cursorline
set nowrap
"highlight Cursorline guibg=#333333
"set cursorcolumn
"highlight Cursorcolumn guibg=#111111
"let g:netrw altv = 1 " netrw to split new file in the right

" make CTRL-Y funcation as scroll up in windows
" unmap <C-Y>

" Map keys on how to move between split panes
map <silent>,h <C-w>h
map <silent>,j <C-w>j
map <silent>,k <C-w>k
map <silent>,l <C-w>l

let mapleader = "-"
map - ddp
nmap \ dd
map <space> viw
map <c-d> dd
imap <c-d> <esc>ddi
nnoremap <leader>d dd
nnoremap <leader>c ddO

" NERDTree settings
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"
map <silent><F9> :NERDTreeToggle<CR>
noremap <silent> <F9> :NERDTreeToggle<CR>

" back to normal mode from insert mode
inoremap jj <Esc>

" My own customizations for python programming
au FileType python set textwidth=79 "comply with PEP8
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

" My own customizations for yaml
au FileType yaml set textwidth=79
au FileType yaml set tabstop=2
au FileType yaml set softtabstop=2
au FileType yaml set shiftwidth=2
au FileType yaml set commentstring=\ #\ %s

colorscheme railscasts

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
