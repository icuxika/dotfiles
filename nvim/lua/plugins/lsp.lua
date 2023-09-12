require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "clangd", "cmake" },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {
  capabilities = capabilities,
}

lspconfig.clangd.setup {
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--all-scopes-completion",
    "--background-index",
    "--clang-tidy"
  }
}

lspconfig.cmake.setup {
  capabilities = capabilities,
  cmd = {"cmake-language-server"},
  filetypes = {"cmake"},
  init_options = {
    buildDirectory = "out/build/default"
  },
}

local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
})
