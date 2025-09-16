require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("t", "<ESC>", "<C-\\><C-n>")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
vim.keymap.set("n", "<space>s", function()
    vim.diagnostic.open_float(0, { scope = "line" })
end, { noremap = true, silent = true })
map("n", "<space>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP Code action" })

-- Normal mode: discard deletes/changes
vim.keymap.set("n", "d", '"_d', { noremap = true })
vim.keymap.set("n", "c", '"_c', { noremap = true })

-- Normal mode: <leader> versions keep normal yank behavior
vim.keymap.set("n", "<leader>d", "d", { noremap = true })
vim.keymap.set("n", "<leader>c", "c", { noremap = true })

-- Visual mode: discard deletes/changes
vim.keymap.set("v", "d", '"_d', { noremap = true })
vim.keymap.set("v", "c", '"_c', { noremap = true })

-- Visual mode: <leader> versions keep normal yank behavior
vim.keymap.set("v", "<leader>d", "d", { noremap = true })
vim.keymap.set("v", "<leader>c", "c", { noremap = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
