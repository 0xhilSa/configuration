:set nowrap
:set number
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2 
:set smartindent
:set autoindent
:set expandtab

let mapleader=" "
nnoremap <leader>e :Ex<CR>


vnoremap <A-Up> :m '<-2<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv
nnoremap <A-Up> :m .-2<CR>==
nnoremap <A-Down> :m .+1<CR>==
nnoremap <leader>hl :nohlsearch<CR>
nnoremap <leader>e :Ex<CR>
nnoremap <C-Left> :bprev<CR>
nnoremap <C-Right> :bnext<CR>

highlight Visual ctermbg=DarkGray guibg=DarkGray

