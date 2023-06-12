require("core.mappings")
require("core.plugins")
require'lspconfig'.clangd.setup{}
vim.wo.number = true
vim.api.nvim_set_option('smarttab', true)
