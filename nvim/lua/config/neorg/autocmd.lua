local M = function ()
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

    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = {"*.norg"},
        group = indentGroup,
        callback = function ()
            vim.cmd("set shiftwidth=2")
            vim.cmd("set softtabstop=2")
            vim.cmd("set tabstop=2")
        end
    })
end
return M
