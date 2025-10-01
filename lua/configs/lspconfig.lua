-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "clangd", "asm_lsp", "cmake", "pylsp", "somesass_ls", "emmet_language_server", "tailwindcss", "glsl_analyzer", "rust_analyzer" }
local nvlsp = require "nvchad.configs.lspconfig"

local function custom_on_attach(client, bufnr)
    nvlsp.on_attach(client, bufnr)

    local opts = { buffer = bufnr, desc = "LSP Code Action" }
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
end

local mason_registry = require("mason-registry")
mason_registry.refresh()

local function ensure_mason(pkg)
  if not mason_registry.has_package(pkg) then
    vim.notify("mason: unknown package " .. pkg, vim.log.levels.ERROR)
    return
  end
  local p = mason_registry.get_package(pkg)
  if not p:is_installed() then
    vim.notify("Installing " .. pkg .. " via mason …")
    p:install()
  end
end

ensure_mason("vue-language-server")
ensure_mason("typescript-language-server")
ensure_mason("typescript")

local mason_root = vim.fn.stdpath("data") .. "/mason/packages"
local vue_ls_path = mason_root
  .. "/vue-language-server/node_modules/@vue/language-server"

vim.lsp.enable(servers)

vim.lsp.config("ts_ls", {
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_ls_path,
                languages = { "vue" },
            },
        },
    },
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
})
vim.lsp.enable("ts_ls")

vim.lsp.config("vue_ls", {
    filetypes = { "vue" },
    root_markers = { "vue.config.js", "vue.config.ts", "nuxt.config.js", "nuxt.config.ts" },
    init_options = {
        vue = { hybridMode = false },
        typescript = {
            tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
        },
    },
    settings = {
        typescript = {
            inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                parameterTypes = {
                    enabled = true,
                    suppressWhenArgumentMatchesName = true,
                },
                variableTypes = { enabled = true },
            },
        },
    },
})
vim.lsp.enable("vue_ls")


