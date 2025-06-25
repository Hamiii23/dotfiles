return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
        keymap = {
            preset = 'default',
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<C-space>'] = { "show" },
            ['<CR>'] = { 'select_and_accept', 'fallback' },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },

        completion = {
            documentation = { auto_show = true }
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        fuzzy = {
            implementation = "prefer_rust_with_warning"
        }
    },
    opts_extend = { "sources.default" }
}
