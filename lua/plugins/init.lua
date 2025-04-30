return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "vyfor/cord.nvim",
        build = ":Cord update",
        lazy = false,
    },

    {
        "wakatime/vim-wakatime",
        lazy = false,
    },

    {
        "windwp/nvim-ts-autotag",
        lazy = false,
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function ()
            require("nvim-ts-autotag").setup()
        end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "html", "css", "scss", "vue", "cpp", "c", "typescript", "javascript"
            },
            sync_install = true,
        }
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = false
    }
}
