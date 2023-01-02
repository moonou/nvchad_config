local M = {}

M.general = {
  -- 移动行
  n = {
    ["<A-j>"] = { "<cmd> move .+1 <CR>", "move current line to next" },
    ["<A-k>"] = { "<cmd> move .-2 <CR>", "move current line to prev" },
    -- telescope find browser
    ["<leader>fg"] = { "<cmd> Telescope file_browser <CR>", "open telescope file browser" },
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
