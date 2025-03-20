local indentGroup = vim.api.nvim_create_augroup("Indentation", { clear = true })
local formatting = vim.api.nvim_create_augroup("Formatting", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {"*.go", "*.lua", "*.ts", "*.json"},
    group = indentGroup,
    callback = function ()
        vim.api.nvim_command("set shiftwidth=4")
        vim.api.nvim_command("set softtabstop=4")
        vim.api.nvim_command("set tabstop=4")
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"*.go", "*.lua", "*.ts", "*.json", "*.py"},
    group = formatting,
    callback = function ()
        vim.lsp.buf.format()
    end
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("RecordingEnter", {
    callback = function(ctx)
        vim.opt.cmdheight = 1
    end
})
vim.api.nvim_create_autocmd("RecordingLeave", {
    callback = function(ctx)
        vim.opt.cmdheight = 0
    end
})
