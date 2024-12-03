require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<C-/>",
  function()
    require("cmp").complete()
  end,
  {
    desc = "show cmp"
  }
)

map("n", "<leader>df", vim.diagnostic.open_float, { desc = "Show diagnostics" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
