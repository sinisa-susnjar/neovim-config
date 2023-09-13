require("theprimeagen")

-- Create a autogroup and autocmd to modify buffers / files before write
local preWriteGrp = vim.api.nvim_create_augroup("PreWriteGroup", { clear = true })
vim.api.nvim_create_autocmd(
  { "BufWritePre", "FileWritePre" },
  { pattern = "*",
    callback = function()
      vim.cmd("TrailerTrim")
    end,
    group = preWriteGrp,
    desc = "Make modifications to buffers before writing, e.g. strip whitespace"
  }
)
