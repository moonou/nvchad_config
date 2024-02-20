local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "prisma",
  },
  autotag = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- format
    "prettier",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "json-lsp",
    "typescript-language-server",
    "eslint-lsp",
    "tailwindcss-language-server",
    "prisma-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    root_folder_label = false,
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cmp = {
  sources = {
    { name = "codeium" },
    -- { name = "luasnip", group_index = 2 },
    { name = "nvim_lsp" },
    { name = "buffer" },
    -- { name = "nvim_lua", group_index = 2 },
    { name = "path" },
  },
}

return M
