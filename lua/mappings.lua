require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("t", "<ESC>", "<C-\\><C-n>")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
