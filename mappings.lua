local M = {}

M.general = {
  n = {
  -- 移动行
    ["<A-j>"] = { "<cmd> move .+1 <CR>", "move current line to next" },
    ["<A-k>"] = { "<cmd> move .-2 <CR>", "move current line to prev" },
    -- SymboldOutline
    ["<leader>o"] = { "<cmd> SymbolsOutline <CR>", "open symbols outline" },
  },
  i = {
    ["jk"] = { "<ESC>", "jk to escape" },
    ["<C-/>"] = {
      function()
        require("cmp").complete()
      end,
      "show cmp"
    },
  }
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
