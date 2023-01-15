local overrides = require "custom.plugins.overrides"

return {
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["keaising/im-select.nvim"] = {
    config = function()
      require("im_select").setup()
    end,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["TimUntersberger/neogit"] = {
    requires = "nvim-lua/plenary.nvim",
  },
  ["kylechui/nvim-surround"] = {
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  -- over  -- telescope 文件夹
  ["nvim-telescope/telescope-file-browser.nvim"] = {
    module = "telescope",
    config = function()
      require("telescope").load_extension "file_browser"
    end,
  },
  ["vim-test/vim-test"] = {},
  -- git
  ["lewis6991/gitsigns.nvim"] = {
    config = function()
      require("gitsigns").setup {
        current_line_blame = true,
      }
    end,
  },
  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },
  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.cmp,
  },
  -- copilot
  ["zbirenbaum/copilot.lua"] = {
    cmd = "Copilot",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },
  ["zbirenbaum/copilot-cmp"] = {
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
