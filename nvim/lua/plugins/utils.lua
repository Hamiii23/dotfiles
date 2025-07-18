return {
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    config = function()
      local autopairs = require("nvim-autopairs")

      autopairs.setup({
        check_ts = true,
        ts_config = {
          lua = { "string" },
          javascript = { "template_string" },
          java = false,
        },
      })
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  }
}
