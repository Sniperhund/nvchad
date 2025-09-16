-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "clangd", "asm_lsp", "cmake", "pylsp", "somesass_ls", "emmet_language_server", "tailwindcss", "glsl_analyzer", "rust_analyzer" }
local nvlsp = require "nvchad.configs.lspconfig"

local function custom_on_attach(client, bufnr)
    nvlsp.on_attach(client, bufnr)

    local opts = { buffer = bufnr, desc = "LSP Code Action" }
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
end

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = custom_on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end

lspconfig.ts_ls.setup {
    on_attach = custom_on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    opts = {
        preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
            importModuleSpecifierPreference = "relative",
        }
    }
}

