require("theprimeagen")

-- Create an autogroup and autocmd to modify buffers / files before write.
local preWriteGrp = vim.api.nvim_create_augroup("PreWriteGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre", "FileWritePre" }, {
  pattern = "*",
  callback = function()
    vim.cmd("TrailerTrim")
  end,
  group = preWriteGrp,
  desc = "Make modifications to buffers before writing, e.g. strip whitespaces.",
})

vim.cmd([[
function! DlangUnitTestFold(lnum)
  if getline(a:lnum) =~ '^\s*unittest\s{\s*$'
    return "a1"
  elseif getline(a:lnum) =~ '^}$'
    return "s1"
  else
    return "="
  endif
endfunction
]])
-- elseif getline(a:lnum) =~ '^\s*}\s*$'

-- Create an autogroup and autocmd to auto-fold buffers / files after read.
local postReadGrp = vim.api.nvim_create_augroup("PostReadGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.d",
  callback = function()
    vim.cmd("setlocal foldexpr=DlangUnitTestFold(v:lnum)")
  end,
  group = preWriteGrp,
  desc = "Autofold D unittests.",
})

-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

-- Associate MQL5 source files with C++
-- Disabled because reformatting messing things up
-- vim.api.nvim_command("au BufNewFile,BufRead *.mq5 set filetype=cpp")
-- vim.api.nvim_command("au BufNewFile,BufRead *.mqh set filetype=cpp")
