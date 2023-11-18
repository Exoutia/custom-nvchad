local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  b.formatting.eslint_d,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.formatting.isort,
  b.formatting.black,
  -- b.diagnostics.mypy,

  -- rust
  b.formatting.rustfmt,

  -- vale
  -- b.diagnostics.vale,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
