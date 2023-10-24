function ColorMyPencils(color)
    color = color or "rose-pine"
    -- color = color or "vscode"
    -- color = color or "nightly"
    -- color = color or "onedark"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- highlight "normal" whitespace, e.g. blank, tab
    vim.api.nvim_set_hl(0, "Whitespace", { fg = "#303030" })
    -- highlight "nontext" whitespace, e.g. eol
    vim.api.nvim_set_hl(0, "NonText", { fg = "#303030" })

    -- vim.api.nvim_set_hl(0, "Comment", { fg="#556555", italic=true, bold=true })
    -- vim.api.nvim_set_hl(0, "Comment", { italic=true })
end

ColorMyPencils()
