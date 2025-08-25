-- load defaults i.e lua_lsp
local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tailwindcss", "eslint", "prismals", "mdx_analyzer", "pylsp", "kulala_ls" }

local ooo = function(client, bufnr)
  nvlsp.on_attach(client, bufnr)
  -- map HERE
  vim.keymap.set("n", "<leader>ca", require("actions-preview").code_actions, { buffer = bufnr })
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = ooo,
    capabilities = nvlsp.capabilities,
    on_init = nvlsp.on_init,
  }
end

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = lspconfig.util.root_pattern "package.json",
  single_file_support = false,
}

lspconfig.denols.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { maxLineLength = 200 },
        flake8 = { maxLineLength = 200 },
      },
    },
  },
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
