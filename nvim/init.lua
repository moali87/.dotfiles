-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- lazy.nvim
require("config.lazy")
require("config.base.code_actions_utils")
require("config.base.key-functions")

-- python3
vim.g.python3_host_prog = "expand(\"~/.pyenv/shims/python\")"

-- disable perl provider
vim.g.loaded_perl_provider = 0

-- UTF-8
vim.opt.encoding = "utf-8"

-- VIM RTP
vim.api.nvim_command([[
set rtp+=~/opt/homebrew/bin/
]])

-- impatientLike
vim.loader.enable()

-- VIM folding
-- vim.api.nvim_command([[
-- set foldmethod=indent
-- set foldnestmax=10
-- set nofoldenable
-- set foldlevel=2
-- ]])

-- VIM Colorscheme
vim.api.nvim_command("set termguicolors")

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
-- vim.cmd [[ autocmd RecordingEnter * set cmdheight=1 ]]
-- vim.cmd [[ autocmd RecordingLeave * set cmdheight=0 ]]

-- Map keys
require("config.base.keymaps")


-- Eslint mapping
-- nmap("<leader>f", "mF:%!eslint_d --stdin --fix-to-stdout<CR>")

-- set spacing
require("config.base.autocmd")

-- Load all LSP's in "lua/config/lsp"
local lsp_path = vim.fn.stdpath("config") .. "/lua/config/lsp"

-- Then load all other LSP configs
for _, file in ipairs(vim.fn.readdir(lsp_path)) do
    if file:match("%.lua$") and file ~= "global.lua" then
        local module_name = "config.lsp." .. file:gsub("%.lua$", "")
        require(module_name)
    end
end

require("config.lsp.global")
