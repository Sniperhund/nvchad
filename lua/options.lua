require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

o.guifont = "JetBrainsMono NF:h10"

o.cindent = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
    config = config or {}
    config.focusable = false
    return vim.lsp.handlers.textDocument_signatureHelp(err, result, ctx, config)
end
    
