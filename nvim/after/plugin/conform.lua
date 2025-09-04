require("conform").setup({
  formatters_by_ft = {
    cpp = { "clang_format" },
    lua = { "stylua" },
    d = { "dfmt" },
    -- Conform will run multiple formatters sequentially
    -- python = { "black" },
    python = { "autopep8" },
    -- Use a sub-list to run only the first available formatter
    -- javascript = { { "prettierd", "prettier" } },
    json = { "jq" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

require("conform").formatters.autopep8 = {
  prepend_args = { "--indent-size=2" },
}

require("conform").formatters.stylua = {
  prepend_args = { "--indent-width=2", "--indent-type=Spaces" },
}
