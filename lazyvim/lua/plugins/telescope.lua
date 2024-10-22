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
    require("telescope").setup({
      defaults = {
        layout_strategy = "vertical", -- Cambia el diseño a vertical
        layout_config = {
          height = 0.9, -- Ajusta la altura de la ventana
          width = 0.8, -- Ajusta el ancho de la ventana
          preview_height = 0.5, -- Tamaño del previsualizador
          preview_cutoff = 1, -- Forza la aparición del previsualizador aunque haya muchas referencias
        },
        scroll_strategy = "cycle",
      },
    })
    require("telescope").load_extension("file_browser")
  end,
}
