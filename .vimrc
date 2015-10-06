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

if has('win32') || has('win64')
	let &runtimepath.=',~/.vim'
	set encoding=utf-8
endif


if !has('gui') 
    set t_Co=256
    colo atom-dark-256
    highlight CursorLine ctermfg=NONE
else
    colo atom-dark
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

set guifont=Inconsolata\ For\ Powerline:h12

let g:OmniSharp_selector_ui = 'ctrlp'	

let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
let g:OmniSharp_server_type = 'v1'

" let g:syntastic_cs_checkers = ['code_checker']
" let g:OmniSharp_server_type = 'roslyn'

nnoremap <leader>gd :OmniSharpGotoDefinition<cr>
nnoremap <leader>gi :OmniSharpFindImplementations<cr>
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
nnoremap <leader>fu :OmniSharpFindUsages

augroup CSharpSyntax
    au!
    au InsertLeave *.cs SyntasticCheck
augroup END

set hls

" clear most recent search with return in normal mode
"nnoremap <silent> <cr> :let @/=""<cr>
nnoremap <silent> <cr> :noh<cr>
nnoremap <silent> * :let @/=expand('<cword>') \| exe "normal mS" \| set hlsearch <cr>

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

