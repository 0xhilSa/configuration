syntax on
:set number
:set relativenumber
:set scrolloff=5
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set expandtab
:set laststatus=2
set incsearch
set hlsearch
set statusline=%f\ %y\ [%{&fileencoding}]\ %m\ %r\ %=%l/%L

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

let mapleader = " "

autocmd BufWritePre * %s/\s\+$//e
autocmd FileType python,c,cpp,cuda,html,css,javascript,typescript,rust,asm,zig setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

call plug#begin()
  Plug 'rose-pine/vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vhda/verilog_systemverilog.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set background=dark
colorscheme rosepine

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*" --glob "!node_modules/*" --glob "!__pycache__/*" --glob "!*.swp" --glob "!*.blob" --glob "!.ccls-cache/" --glob "!.npm/" --glob "!.nvm/" --glob "!.vim/" --glob "!.nuget/"'

nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fh :History<CR>

let g:coc_global_extensions = [
  \ 'coc-clangd',
  \ 'coc-pyright',
  \ 'coc-json',
  \ 'coc-vimlsp',
  \ 'coc-rust-analyzer',
  \ 'coc-html',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-eslint'
  \ ]

let g:coc_config_home = expand('~/.config/coc')
call coc#config('inlayHint.enable', v:false)
call coc#config('signature.enable', v:false)

nnoremap <silent> gd :call CocAction('jumpDefinition')<CR>
nnoremap <silent> gr :call CocAction('jumpReferences')<CR>
nnoremap <silent> gi :call CocAction('jumpImplementation')<CR>
nnoremap <silent> <leader>cd :CocDiagnostics<CR>
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "<CR>"

autocmd FileType python,c,cpp,cuda,fortran,zig,rust setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType python,c,cpp,rust,cuda,zig,fortran setlocal omnifunc=coc#refresh()

hi Normal guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi CursorLineNr guibg=NONE ctermbg=NONE
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLineNC guibg=NONE ctermbg=NONE
hi TabLine guibg=NONE ctermbg=NONE
hi TabLineFill guibg=NONE ctermbg=NONE
hi TabLineSel guibg=NONE ctermbg=NONE
