require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("t", "<ESC>", "<C-\\><C-n>")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
vim.keymap.set("n", "<space>s", function()
    vim.diagnostic.open_float(0, { scope = "line" })
end, { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
