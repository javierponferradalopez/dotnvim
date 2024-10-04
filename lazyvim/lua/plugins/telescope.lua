return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap
    { "<leader>sG", false },
    { "<leader>sg", false },
    { "<leader>fF", false },
    { "<leader>fg", false },
    { "<leader>ff", false },
    { "<leader><space>", false },

    -- change keymaps
    -- CWR
    { "<leader>fW", "<cmd>Telescope live_grep<cr>", desc = "Find with Grep (cwr)" },
    { "<leader>fF", "<cmd>Telescope find_files<cr>", desc = "Find files (cwr)" },

    -- ROOT DIR
    { "<leader>ff", "<cmd>Telescope git_files<cr>", desc = "Find files (Root dir)" },
  },
  config = function(opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("file_browser")
  end,
}
