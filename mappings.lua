local M = {}

M.general = {
  -- 移动行
  n = {
    ["<A-j>"] = { "<cmd> move .+1 <CR>", "move current line to next" },
    ["<A-k>"] = { "<cmd> move .-2 <CR>", "move current line to prev" },
  },
  i = {
    ["jk"] = { "<ESC>", "jk to escape" },
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
