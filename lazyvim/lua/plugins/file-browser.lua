-- This plugin will be used to manage the project's files
return {
  "nvim-telescope/telescope-file-browser.nvim",
  keys = {
    {
      "<leader>fM",
      ":Telescope file_browser path=%:p:h=%:p:h<cr>",
      desc = "Manage files",
    },
  },
}
