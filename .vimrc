set nocompatible

syntax on
set ts=4
set sw=4
set laststatus=2
set hidden
set cursorline
set backspace=indent,eol,start
set expandtab
set nu

let mapleader=","

set timeoutlen=800

if has('win32') || has('win64') || has('win32unix')
    let &runtimepath.=',~/.vim'
    set encoding=utf-8

    if !has('gui_running')
        set shell=/usr/bin/bash
    endif

endif


filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-commentary'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'tpope/vim-dispatch'
    Plugin 'scrooloose/syntastic'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'bling/vim-airline'
    Plugin 'chrisbra/vim-show-whitespace' " <leader>ws to show whitespace
    Plugin 'scrooloose/nerdtree'
    Plugin 'ElmCast/elm-vim'
    Plugin 'morhetz/gruvbox'
    Plugin 'mkarmona/materialbox'
    Plugin 'jdkanani/vim-material-theme'

call vundle#end()

if !has('gui_running')
    set t_Co=256
    colo atom-dark-256
    highlight CursorLine ctermfg=NONE
else
    " colo atom-dark
    " colorscheme materialbox
    set background=dark
    colorscheme material-theme
endif


nnoremap <leader>p :CtrlP<CR>

nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nc :NERDTree %:h<CR>

filetype plugin indent on

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

nnoremap <leader>t :enew<cr>
nnoremap <leader>h :bp<cr>
nnoremap <leader>l :bn<cr>
nnoremap <leader>q :bp\|bd #<cr>

nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

nnoremap j gj
nnoremap k gk

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

set guifont=Fira\ Mono\ For\ Powerline:h12

augroup CSharpSyntax
    au!
    au InsertLeave *.cs SyntasticCheck
augroup END

set hls

" clear most recent search with return in normal mode
"nnoremap <silent> <cr> :let @/=""<cr>
nnoremap <silent> <cr> :noh<cr>
nnoremap <silent> * :let @/=expand('<cword>') \| exe "normal mS" \| set hlsearch <cr>


" Insert blank line above/below current line
nnoremap <leader>O m`O<Esc>``
nnoremap <leader>o m`o<Esc>``

" Set cwd to directory of the current file
nnoremap <leader>cd :cd %:h<cr>

function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

com! DiffSaved call s:DiffWithSaved()

augroup SyntaxOverrides
    au!
    au BufRead,BufNewFile *.vb,*.cls,*.frm setlocal filetype=vb
    au BufRead,BufNewFile *.md setlocal filetype=markdown
augroup END

nnoremap <space>fs :w<cr>
inoremap fd <Esc>
nmap <space>w <c-w>


