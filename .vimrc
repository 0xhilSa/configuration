syntax on
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

vnoremap <A-Left> <gv
vnoremap <A-Right> >gv
vnoremap <A-Up> :m '<-2<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv
nnoremap <A-Left> <<
nnoremap <A-Right> >>
nnoremap <A-Up> :m .-2<CR>==
nnoremap <A-Down> :m .+1<CR>==
nnoremap <leader>hl :nohlsearch<CR>

nnoremap <C-Left> :bprev<CR>
nnoremap <C-Right> :bnext<CR>

highlight Visual ctermbg=DarkGray guibg=DarkGray
hi Cursor guifg=black guibg=gray

call plug#begin('~/.vim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:coc_global_extensions = [
  \ 'coc-clangd',
  \ 'coc-pyright',
  \ 'coc-json',
  \ 'coc-vimlsp',
  \ ]

let g:coc_diagnostic_disable = 1

nnoremap <silent> gd :call CocAction('jumpDefinition')<CR>
nnoremap <silent> gr :call CocAction('jumpReferences')<CR>
nnoremap <silent> gi :call CocAction('jumpImplementation')<CR>
nnoremap <silent> <leader>d :CocDiagnostics<CR>

inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "<CR>"

nnoremap <leader>f :CocCommand editor.action.formatDocument<CR>
autocmd FileType python setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

set background=dark
colorscheme gruvbox
