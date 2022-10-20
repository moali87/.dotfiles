require('plugins')
require('code_actions_utils')
require('key-functions')

local workMachine = "LV1XJ97QFQ"

-- VIM Leader key
vim.g.mapleader = " "

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

-- VIM folding
vim.api.nvim_command([[
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
]])

-- VIM Colorscheme
vim.api.nvim_command("set termguicolors")
vim.o.background = "dark"
vim.api.nvim_command("colorscheme gruvbox")

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

-- Map panel movement keys
-- Down
nmap("<Leader>v", "<C-W><C-J>")
-- Up
nmap("<Leader>r", "<C-W><C-K>")
-- Left
nmap("<Leader>f", "<C-W><C-H>")
-- Right
nmap("<Leader>j", "<C-W><C-L>")

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

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>o', builtin.find_files, {})
vim.keymap.set('n', '<leader>p', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

-- Eslint mapping
-- nmap("<leader>f", "mF:%!eslint_d --stdin --fix-to-stdout<CR>")

-- set spacing
local indentGroup = vim.api.nvim_create_augroup("Indentation", { clear = true})
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {"*.ts", "*.go", "*.lua"},
    group = indentGroup,
    callback = function ()
        vim.cmd("set shiftwidth=4")
        vim.cmd("set softtabstop=4")
        vim.cmd("set tabstop=4")
    end
})
