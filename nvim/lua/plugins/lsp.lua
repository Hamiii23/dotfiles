return {
    "neovim/nvim-lspconfig",
    dependencies = {
        'saghen/blink.cmp',
        {
            "folke/lazydev.nvim",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
        })

        lspconfig.ts_ls.setup({
            capabilities = capabilities
        })

        lspconfig.clangd.setup({
            capabilities = capabilities
        })

        lspconfig.tailwindcss.setup({
            capabilities = capabilities,
            filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
        })

        vim.diagnostic.config({
            virtual_text = true,
            underline = true,
            update_in_insert = false,
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('my-lsp-attach', { clear = true }),
            callback = function(args)
                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                if not client then return end

                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf, desc = 'Go to definition' })
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf, desc = 'Go to references' })
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf, desc = 'Hover documentation' })
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = args.buf, desc = 'Rename symbol' })
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = args.buf, desc = 'Code actions' })

                -- Set up format on save if client supports formatting
                if client.supports_method('textDocument/formatting') then
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = vim.api.nvim_create_augroup('my-lsp-format', { clear = false }),
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({
                                bufnr = args.buf,
                                id = client.id,
                                timeout_ms = 1000
                            })
                        end,
                    })
                end
            end,
        })
    end
}
