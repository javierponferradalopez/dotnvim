local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      tag = "v13.9.1", -- This is necessary because LazyVim removes telescope and other plugins in versions 14.x onwards
      import = "lazyvim.plugins",
    },

    -- UI
    { import = "lazyvim.plugins.extras.ui.alpha" },

    -- Copilot
    { import = "lazyvim.plugins.extras.ai.copilot" },

    -- Linters
    { import = "lazyvim.plugins.extras.linting.eslint" },

    -- Formatters
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.formatting.biome" },

    -- Language servers
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.markdown" },

    -- Custom plugins
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = "*",
  },
  install = {},
  checker = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
