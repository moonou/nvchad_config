local present, null_ls = pcall(require, "null-ls")

if not present then
  print "null-ls not found"
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt,
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- prisma
  -- b.formatting.prismaFmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
