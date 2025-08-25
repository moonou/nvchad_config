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
map("n", "<leader>cb",
  function()
     vim.t.bufs = vim.tbl_filter(function(bufnr)
        return vim.api.nvim_buf_get_option(bufnr, "modified")
      end, vim.t.bufs)
  end, { desc = "Close all modified buffers" }
)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
