local options = {
    formatters_by_ft = {
        lua = false,
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },

        c = false,
        cpp = false,
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = false,
    },
}

return options
