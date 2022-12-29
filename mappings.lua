local M = {}

M.general = {
  -- 移动行
  n = {
    ["<A-j>"] = {"<cmd> move .+1 <CR>", "move current line to next"},
    ["<A-k>"] = {"<cmd> move .-2 <CR>", "move current line to prev"},
  },
}

-- more keybinds!

return M
