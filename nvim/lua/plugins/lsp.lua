return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        lspconfig.lua_ls.setup ({ capabilitie = capabilities})
        lspconfig.ts_ls.setup ({ capabilitie = capabilities})
        lspconfig.nixd.setup ({ capabilitie = capabilities})
        lspconfig.clangd.setup ({ capabilitie = capabilities})

        local signs = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = "󰠠 ",
            [vim.diagnostic.severity.INFO]  = " ",
        }
        vim.diagnostic.config({
            virtual_text = true,  -- Inline text (e.g., under code)
            signs = {
                text = signs
            },         -- Show signs in the gutter (W, E, etc.)
            underline = true,     -- Underline issues in the code
            update_in_insert = false,  -- Avoid showing diagnostics while typing
            severity_sort = true,      -- Show more important issues first
        })
    end
}
