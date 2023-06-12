vim.g.mapleader = "§" -- easy to reach leader key
vim.keymap.set("n", "-", vim.cmd.Ex) -- need nvim 0.8+
vim.keymap.set("n", "<c-m>", ":ProjectRun<CR>") -- need nvim 0.8+
-- make <c-b> run the command ":ProjectRun"
