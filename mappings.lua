local M = {}

M.general = {
  n = {
    -- 移动行
    ["<A-j>"] = { "<cmd> move .+1 <CR>", "move current line to next" },
    ["<A-k>"] = { "<cmd> move .-2 <CR>", "move current line to prev" },
    -- SymboldOutline
    ["<leader>o"] = { "<cmd> SymbolsOutline <CR>", "open symbols outline" },
    ["<leader>cb"] = { "<cmd> bufdo bd <CR>", "close all buffers" },
    ["f"] = {
      function()
        local hop = require "hop"
        hop.hint_char1()
      end,
      "open hop",
    },
    ["ft"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection
        hop.hint_patterns({ direction = directions.AFTER_CURSOlR }, "<\\w*")
      end,
      "open hop",
    },
  },
  i = {
    ["<C-/>"] = {
      function()
        require("cmp").complete()
      end,
      "show cmp",
    },
  },
}

M.test = {
  -- vim test
  n = {
    ["<leader>t"] = {
      function()
        require("jester").run()
      end,
      "test nearest",
    },
    ["<leader>T"] = {
      function()
        require("jester").debug()
      end,
      "debug test nearest",
    },
    ["<leader>B"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "toggle breakpoint",
    },
    ["<F5>"] = {
      function ()
        require("dap").continue()
      end
    },
    ["<F10>"] = {
      function ()
        require("dap").step_over()
      end
    },
    ["<F11>"] = {
      function ()
        require("dap").step_into()
      end
    },
    ["<F12>"] = {
      function ()
        require("dap").step_out()
      end
    }
  },
}

-- more keybinds!

return M
