set nocompatible

syntax on
set ts=4
set sw=4
set laststatus=2

let mapleader=","

set timeoutlen=200
set nu
filetype off

if has('win32') || has('win64')
	let &runtimepath.=',~/.vim'
	set encoding=utf-8
endif

colo atom-dark

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'gmarik/Vundle.vim'
	Plugin 'tpope/vim-fugitive'
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-repeat'
	Plugin 'Lokaltog/vim-easymotion'
	Plugin 'OmniSharp/omnisharp-vim'
	Plugin 'tpope/vim-dispatch'
	Plugin 'scrooloose/syntastic'
	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'OrangeT/vim-csharp'
	Plugin 'bling/vim-airline'
call vundle#end()

filetype plugin indent on

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

nnoremap <leader>t :enew<cr>
nnoremap <leader>h :bp<cr>
nnoremap <leader>l :bn<cr>
nnoremap <leader>bq :bd<cr>

nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
let g:OmniSharp_selector_ui = 'ctrlp'	

nnoremap <Leader>ev :e ~/.vimrc<CR>
nnoremap <Leader>sv :so ~/.vimrc<CR>

nnoremap j gj
nnoremap k gk

nnoremap <space> <PageDown>
nnoremap <S-Space> <PageUp>

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

set guifont=monofur\ For\ Powerline:h13
