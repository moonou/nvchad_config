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
    { name = "copilot", group_index = 1 },
    -- { name = "luasnip", group_index = 2 },
    { name = "nvim_lsp", group_index = 1 },
    { name = "buffer", group_index = 1 },
    { name = "nvim_lua", group_index = 2 },
    { name = "path", group_index = 1 },
  },
}

return M
