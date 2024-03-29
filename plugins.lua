local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    -- dependencies = {
    --   -- format & linting
    --   {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     config = function()
    --       require "custom.configs.null-ls"
    --     end,
    --   },
    -- },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
  {
    "kylechui/nvim-surround",
    event = "InsertEnter",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    enabled = true,
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "VimEnter",
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup {
  --         markdown = true,
  --       }
  --     end, 100)
  --   end,
  --   dependencies = {
  --     "zbirenbaum/copilot-cmp",
  --     config = function()
  --       require("copilot_cmp").setup()
  --     end,
  --   },
  -- },
  {
    "simrat39/symbols-outline.nvim",
    event = "VimEnter",
    config = function()
      require("symbols-outline").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "VimEnter",
    config = function()
      require("ufo").setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      }
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue or blue
        RRGGBBAA = false, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = false, -- CSS rgb() and rgba() functions
        hsl_fn = false, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = "both", -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
        virtualtext = "■",
        -- update color values even if buffer is not focused
        -- example use: cmp_menu, cmp_docs
        always_update = true,
      },
      -- all the sub-options of filetypes apply to buftypes
      buftypes = {},
    },
  },
  {
    "tpope/vim-fugitive",
    event = "VimEnter",
  },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("todo-comments").setup {}
    end,
  },
  -- {
  --   "shellRaining/hlchunk.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("hlchunk").setup {
  --       blank = {
  --         enable = false,
  --       },
  --     }
  --   end,
  -- },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    event = "VimEnter",
    config = function()
      require("hop").setup()
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "David-Kunz/jester",
    event = "VimEnter",
    opts = {
      cmd = "pnpm jest -t '$result' -- $file",
      path_to_jest_debug = "node_modules/jest/bin/jest.js",
      dap = {
        type = "node2",
        request = "launch",
        cwd = vim.fn.getcwd(),
        runtimeArgs = { "--inspect-brk", "$path_to_jest", "--no-coverage", "-t", "$result", "--", "$file" },
        args = { "--no-cache" },
        sourceMaps = true,
        protocol = "inspector",
        skipFiles = { "<node_internals>/**/*.js" },
        console = "integratedTerminal",
        port = 9229,
        disableOptimisticBPs = true,
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VimEnter",
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        config = function()
          require "dap"
          vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
        end,
      },
    },
    config = function()
      require "custom.dap.dap-jest"
      local dap, dapui = require "dap", require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
    end,
    event = "BufEnter",
  },
}

return plugins
