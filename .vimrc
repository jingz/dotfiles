set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'posva/vim-vue'
"Bundle 'gmarik/vundle'
"Bundle 'emmet.vim'
"Bundle 'rizzatti/funcoo.vim'
"Bundle 'rizzatti/dash.vim'
"Bundle 'rstacruz/sparkup'

call vundle#end()
filetype plugin indent on

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:user_emmet_leader_key='<C-f>'
let g:user_emmet_mode='inv'

" ctrlp option
" let g:ctrlp_working_path_mode = 'c'

set mouse=a

" set shellcmdflag=-ic
colorscheme railscasts
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

au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

au FileType vue set tabstop=2
au FileType vue set softtabstop=2
au FileType vue set shiftwidth=2 " when indent adds 2 spaces

" augroup AutoReloadConfig
"     autocmd!
"     autocmd BufWritePre .vimrc echo "reload!"
"     autocmd BufWritePost .vimrc so % 
" augroup END

function! StripOutputComment(prefix_cment)
    " clear old output
    execute "mark s"
    execute "%s/\\s\\+" . escape(a:prefix_cment, "/") . ".*//ge"
    " execute "echo " . substitute('%s', "\s\+#=>.*", '', 'g')
    execute "'s"
endfunction

function! Test(lang, print_pattern, cment_pattern)
    " TODO move to args
    let l:cmdexecute = a:lang . " " . shellescape(expand('%'))
    let l:outputs = split(system(l:cmdexecute), "\n")

    let l:cur = 1
    execute "mark s"
    execute "normal! G"

    " collect line numbers of printing output
    let l:nl_print = search(a:print_pattern)
    let l:last_col = col("$")
    let l:collection_num_line = []
    let l:eol_column = []
    while l:nl_print > 0
        " echo l:nl_print
        let l:collection_num_line += [l:nl_print]
        let l:eol_column += [l:last_col]

        " search next print
        let l:new_nl_print = search(a:print_pattern)
        let l:last_col = col("$")

        if l:nl_print < l:new_nl_print
            let l:nl_print = l:new_nl_print
        else
            "reach to the last matche
            let l:nl_print = 0
        endif
    endwhile

    " echo l:collection_num_line

    let l:index = 0
    for nline in l:collection_num_line
        execute "normal! " . nline . "G$"
        while col("$") < max(l:eol_column)
            execute "normal! A "
        endwhile
        set nowrap
        execute "normal! A  " . a:cment_pattern . " " . l:outputs[l:index]
        let l:index = l:index + 1
    endfor

    execute "normal! 's"

    " for output in l:outputs
    "     execute "normal! " . l:cur . "Go" . output
    "     let l:cur = l:cur + 3
    " endfor
endfunction

" set up event triggering
function! LearnRb()
    autocmd!
    autocmd! BufWritePre <buffer> call StripOutputComment("#=>")
    autocmd! BufWritePost <buffer> call Test("ruby", "puts", "#=>")
    echom "Ruby Playgroup has been activated!"
    "augroup LearnRb
    "    autocmd!
    "    autocmd! BufWritePre <buffer> mark s | g/#=>/,$ d
    "    autocmd! BufWritePost <buffer> execute "$r! $(which ruby) % | sed 's/^/\\#=> /'" | 's
    "augroup END
endfunction

function! PlayNode()
    autocmd!
    autocmd! BufWritePre <buffer> call StripOutputComment("//=>")
    autocmd! BufWritePost <buffer> call Test("node", "console.log", "//=>")
    "augroup PlayNode
    "    autocmd!
    "    autocmd! BufWritePre <buffer> mark s | g/\/\/=>/,$ d
    "    autocmd! BufWritePost <buffer> execute "$r! $(which node) % | sed 's/^/\\/\\/=> /'" | 's
    "augroup END
    echom "Node Playground has been activated"
endfunction

function! LearnPy()
    autocmd!
    autocmd! BufWritePre <buffer> call StripOutputComment("#=>")
    autocmd! BufWritePost <buffer> call Test("python", "print", "#=>")
    "augroup LearnPy
    "    autocmd!
    "    autocmd! BufWritePre <buffer> mark s | g/^#=>/,$ d
    "    autocmd! BufWritePost <buffer> execute "$r! $(which python) % | sed 's/^/\\#=> /'" | 's
    "augroup END
    "echom "Ruby Append Output Active!"
endfunction

function! Ext()
    autocmd!
    autocmd! BufWritePost <buffer> execute "!$(which ruby) ~/play/ejext/generator/jxc.rb %"
endfunction

function! Xext()
    autocmd!
    autocmd! BufWritePost <buffer> execute "!$(which ruby) ~/play/ejext4/generator/jxc.rb % -with-requirejs"
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
