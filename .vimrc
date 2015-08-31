set nocompatible

syntax on
set ts=4
set sw=4
set laststatus=2
set hidden
set cursorline
set backspace=indent,eol,start
set expandtab

let mapleader=","

set timeoutlen=800
set nu

if has('win32') || has('win64')
	let &runtimepath.=',~/.vim'
	set encoding=utf-8
endif

colo atom-dark-256

if !has('gui') 
    set t_Co=256
endif

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
    Plugin 'Lokaltog/vim-easymotion'
    "Plugin 'OmniSharp/omnisharp-vim'
    Plugin 'tpope/vim-dispatch'
    Plugin 'scrooloose/syntastic'
    Plugin 'ctrlpvim/ctrlp.vim'
    "Plugin 'OrangeT/vim-csharp'
    Plugin 'bling/vim-airline'
    Plugin 'chrisbra/vim-show-whitespace' " <leader>ws to show whitespace
    Plugin 'scrooloose/nerdtree'
call vundle#end()

nnoremap <leader>p :CtrlP<CR>

nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nc :NERDTree %<CR>

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

nnoremap <space> <PageDown>
nnoremap <S-Space> <PageUp>

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

set guifont=Inconsolata\ For\ Powerline:h12

let g:OmniSharp_selector_ui = 'ctrlp'	
"let g:syntastic_cs_checkers = ['code_checker', 'syntax', 'semantic', 'issues']
let g:syntastic_cs_checkers = ['code_checker']
nnoremap <leader>gd :OmniSharpGotoDefinition<cr>
nnoremap <leader>gi :OmniSharpFindImplementations<cr>
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
nnoremap <leader>fu :OmniSharpFindUsages

autocmd InsertLeave *.cs SyntasticCheck

let g:OmniSharp_server_type = 'roslyn'

set hls

" clear most recent search with return in normal mode
"nnoremap <silent> <cr> :let @/=""<cr>
nnoremap <silent> <cr> :noh<cr>

