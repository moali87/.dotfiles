-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.api.nvim_command([[
set mouse=
" set cmdheight=0
set timeoutlen=0
set scrolloff=10
set relativenumber
set number
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set smartindent
set smarttab
set wildmenu
set wildmode=full,list
set nocompatible
set shell=/opt/homebrew/bin/fish
syntax on
set completeopt=menu,menuone,noselect
" set fillchars+=vert:\|
" hi vertsplit guifg=fg guibg=bg
" hi Visual term=reverse cterm=reverse guibg=Grey
set laststatus=3
]])
