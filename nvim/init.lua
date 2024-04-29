-- VIM Leader key
vim.g.mapleader = " "

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("plugins")
require("code_actions_utils")
require("key-functions")

-- python3
vim.g.python3_host_prog = "expand(\"~/.pyenv/shims/python\")"

-- disable perl provider
vim.g.loaded_perl_provider = 0

-- nodejs
vim.g.node_host_prog = "~/.local/share/nvm/v16.17.1/bin/neovim-node-host"

-- UTF-8
vim.opt.encoding = "utf-8"

-- VIM RTP
vim.api.nvim_command([[
set rtp+=~/.local/share/nvm/v16.17.1
set rtp+=~/opt/homebrew/bin/
]])

-- impatientLike
vim.loader.enable()

-- VIM folding
vim.api.nvim_command([[
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
]])

-- VIM Colorscheme
vim.api.nvim_command("set termguicolors")
vim.api.nvim_command("colorscheme monokai-pro")

-- VIM editor settings
vim.opt.guicursor = ""
vim.api.nvim_command([[
set mouse=
set cmdheight=0
set timeoutlen=0
set scrolloff=10
set relativenumber
set number
set expandtab
" set tabstop=2
" set softtabstop=2
" set shiftwidth=2
set ignorecase
set smartcase
set smartindent
set smarttab
set wildmenu
set wildmode=full,list
set nocompatible
set shell=/bin/zsh
syntax on
set completeopt=menu,menuone,noselect
set fillchars+=vert:\|
hi vertsplit guifg=fg guibg=bg
hi Visual term=reverse cterm=reverse guibg=Grey
set laststatus=3
]])
vim.cmd [[ autocmd RecordingEnter * set cmdheight=1 ]]
vim.cmd [[ autocmd RecordingLeave * set cmdheight=0 ]]

-- Disable arrow keys
imap("<up>", "<nop>")
imap("<down>", "<nop>")
imap("<left>", "<nop>")
imap("<right>", "<nop>")

-- Map keys
require("config.base.keymaps")


-- Eslint mapping
-- nmap("<leader>f", "mF:%!eslint_d --stdin --fix-to-stdout<CR>")
-- floaterm
vim.keymap.set("n", "<leader>gj", ":FloatermNew --height=0.95 --width=0.95 --wintype=float --autoclose=0 jirust<CR>")

-- set spacing
require("config.base.autocmd")
