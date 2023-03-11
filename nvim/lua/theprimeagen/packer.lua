-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Neovim remembers
  use({ 'vladdoster/remember.nvim', config = [[ require('remember') ]] })

  -- Awesome telescope
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Nice colour scheme
  use({ 
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
          vim.cmd('colorscheme rose-pine')
      end
  })

  -- Github nvim themes (not as nice as I thought)
  -- use({
  --     'projekt0n/github-nvim-theme', tag = 'v0.0.7',
  --     -- or                            branch = '0.0.x'
  --     config = function()
  --         -- Example config in Lua
  --         require("github-theme").setup({
  --             theme_style = "dark",
  --             function_style = "italic",
  --             sidebars = {"qf", "vista_kind", "terminal", "packer"},

  --             -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  --             colors = {hint = "orange", error = "#ff0000"},

  --             -- Overwrite the highlight groups
  --             overrides = function(c)
  --                 return {
  --                     htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
  --                     DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
  --                     -- this will remove the highlight groups
  --                     TSField = {},
  --                 }
  --             end
  --         })
  --         -- vim.cmd('colorscheme rose-pine')
  --     end
  -- })

  -- Dracula colour scheme (ditto)
  -- use('Mofiqul/dracula.nvim')

  -- Treesitter is a must
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  -- Harpoon from the nvim giga chad
  use('theprimeagen/harpoon')

  -- This is sweet!
  use('mbbill/undotree')

  -- Git is a must have
  use('tpope/vim-fugitive')

  -- Yes, LSP rocks!
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {'williamboman/mason.nvim'},           -- Optional
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},         -- Required
          {'hrsh7th/cmp-nvim-lsp'},     -- Required
          {'hrsh7th/cmp-buffer'},       -- Optional
          {'hrsh7th/cmp-path'},         -- Optional
          {'saadparwaiz1/cmp_luasnip'}, -- Optional
          {'hrsh7th/cmp-nvim-lua'},     -- Optional

          -- Snippets
          {'L3MON4D3/LuaSnip'},             -- Required
          {'rafamadriz/friendly-snippets'}, -- Optional
      }
  }

  use('mfussenegger/nvim-dap')
  use({ "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} })
  use {
      'tanvirtin/vgit.nvim',
      requires = {
          'nvim-lua/plenary.nvim'
      }
  }
end)
