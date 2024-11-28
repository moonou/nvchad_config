local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tailwindcss", "eslint", "prismals", "mdx_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false
}


lspconfig.denols.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}
