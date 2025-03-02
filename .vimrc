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
  Plug 'plasticboy/vim-markdown'
  Plug 'godlygeek/tabular'
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }
call plug#end()

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*" --glob "!node_modules/*" --glob "!__pycache__/*"'
let $FZF_DEFAULT_OPTS = '--layout=reverse --border=rounded --info=inline --height=40% --preview-window=right:60% --color=bg+:#282a36,fg:#f8f8f2,hl:#ff79c6,fg+:#50fa7b,pointer:#ffb86c,marker:#8be9fd'

let g:coc_global_extensions = [
  \ 'coc-clangd',
  \ 'coc-pyright',
  \ 'coc-json',
  \ 'coc-vimlsp',
  \ 'coc-rust-analyzer'
  \ ]

let g:coc_diagnostic_disable = 1

nnoremap <silent> gd :call CocAction('jumpDefinition')<CR>
nnoremap <silent> gr :call CocAction('jumpReferences')<CR>
nnoremap <silent> gi :call CocAction('jumpImplementation')<CR>
nnoremap <silent> <leader>d :CocDiagnostics<CR>
nnoremap <leader>md :!glow %<CR>

inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "<CR>"

nnoremap <leader>f :CocCommand editor.action.formatDocument<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fh :History<CR>

autocmd FileType python setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType rust setlocal tabstop=2 shiftwidth=2 softtabstop=2  expandtab

set background=dark
let g:gruvbox_contrast_dark="hard"
set termguicolors
colorscheme gruvbox
