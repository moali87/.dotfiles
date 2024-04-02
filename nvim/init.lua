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

-- this needs to be set before setting the material colorscheme
-- vim.g.material_style = "darker"
vim.o.background = "dark"

require('plugins')
require('code_actions_utils')
require('key-functions')

local workMachine = "LV1XJ97QFQ"

-- python3
vim.g.python3_host_prog = "expand('~/.pyenv/shims/python')"

-- disable perl provider
vim.g.loaded_perl_provider = 0

-- nodejs
vim.g.node_host_prog = '~/.local/share/nvm/v16.17.1/bin/neovim-node-host'

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
vim.g.sonokai_style = 'espresso'
vim.g.sonokai_diagnostic_virtual_text = 'colored'
vim.g.sonokai_better_performance = 1
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_diagnostic_text_highlight = 1
vim.api.nvim_command("set termguicolors")
-- vim.api.nvim_command("colorscheme tokyonight-night")
-- vim.api.nvim_command("colorscheme sonokai")
-- vim.api.nvim_command("colorscheme terafox")
-- vim.api.nvim_command("colorscheme gruvbox")
-- vim.api.nvim_command("colorscheme catppuccin-mocha")
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
set shell=/opt/homebrew/bin/fish
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
-- Map LazyGit
nmap("<Leader>gg", ":LazyGit<CR>")

-- Map buffer movement
nmap("<Leader>w", ":bprevious<CR>")
nmap("<Leader>e", ":bnext<CR>")
nmap("<Leader>q", ":bd<CR>")
nmap("<Leader>Q", ":bd!<CR>")
nmap("<Leader>s", ":vert sb")

-- Map Terminal
tmap("<Leader><ESC>", "<C-\\><C-n>")
tmap("<F9>", "<cmd> vsplit | term<CR>")

-- MISC toggles
nmap("<F4>", "<cmd> IndentBlanklineToggle<CR>")

-- Notes mapping
-- nmap("<F5>", "<cmd> e ~/notes/Upstart Standup.norg<CR>")
local function getHostname()
    local f = io.popen("/bin/hostname")
    if f then
        local hostname = f:read("*a") or ""
        f:close()
        hostname = string.gsub(hostname, "\n$", "")
        return hostname
    end
    return nil
end
if getHostname() == workMachine then
    require('config.neorg.keymaps.upstart')
end

-- Trouble
require('config.trouble.keymaps')

-- Tmux
require('config.nvim-tmux-navigator.keymaps')

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>o', builtin.find_files, {})
vim.keymap.set('n', '<leader>p', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

-- Eslint mapping
-- nmap("<leader>f", "mF:%!eslint_d --stdin --fix-to-stdout<CR>")
-- floaterm
vim.keymap.set('n', '<leader>gj', ':FloatermNew --height=0.95 --width=0.95 --wintype=float --autoclose=0 jirust<CR>')

-- set spacing
require('config.base.keymaps')
