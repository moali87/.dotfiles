vim.keymap.set('n', '<F5>', function ()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(buf, true, {
        relative='editor', border='double', width=100, height=50, row=1, col=35
    })
    vim.cmd('e ~/notes/work/index.norg')
end)
