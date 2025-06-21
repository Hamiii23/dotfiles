return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    styles = {
      input = {
        keys = {
          n_esc = { "<C-c>", { "cmp_close", "cancel" }, mode = "n", expr = true },
          i_esc = { "<C-c>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
        },
      }
    },
    input = {
      enabled = true,
    },
    picker = {
      enabled = true,
      matchers = {
        frecency = true,
        cwd_bonus = false,
      },
      formatters = {
        file = {
          filename_first = false,
          filename_only = false,
          icon_width = 2,
        },
      },
      layout = {
        preset = "telescope",
        cycle = false,
      },
    },
  },
  keys = {
    { "<leader>lg", function() require("snacks").lazygit() end,                                        desc = "Lazygit" },
    { "<leader>gl", function() require("snacks").lazygit.log() end,                                    desc = "Lazygit Logs" },
    { "<leader>gb", function() require("snacks").picker.git_branches({ layout = "select" }) end,       desc = "Pick and Switch Git Branches" },
    { "<leader>rN", function() require("snacks").rename.rename_file() end,                             desc = "Fast Rename Current File" },
    { "<leader>bd", function() require("snacks").bufdelete() end,                                      desc = "Delete or Close Buffer  (Confirm)" },

    { "<leader>ff", function() require("snacks").picker.files() end,                                   desc = "Find Files (Snacks Picker)" },
    { "<leader>fc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>fg", function() require("snacks").picker.grep() end,                                    desc = "Grep word" },
    { "<leader>fw", function() require("snacks").picker.grep_word() end,                               desc = "Search Visual selection or Word",  mode = { "n", "x" } },
    { "<leader>fk", function() require("snacks").picker.keymaps({ layout = "ivy" }) end,               desc = "Search Keymaps (Snacks Picker)" },
    { "<leader>fh", function() require("snacks").picker.help() end,                                    desc = "Help Pages" },
  }
}
