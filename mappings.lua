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
    ["<leader>t"] = { "<cmd> TestNearest -strategy=neovim <CR>", "test nearest" },
    ["<leader>T"] = { "<cmd> TestFile -strategy=neovim <CR>", "test file" },
  },
}

-- more keybinds!

return M
