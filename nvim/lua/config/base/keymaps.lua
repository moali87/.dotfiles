local indentGroup = vim.api.nvim_create_augroup("Indentation", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {"*.go", "*.lua", "*.ts", "*.json"},
    group = indentGroup,
    callback = function ()
        vim.api.nvim_command("set shiftwidth=4")
        vim.api.nvim_command("set softtabstop=4")
        vim.api.nvim_command("set tabstop=4")
    end
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
