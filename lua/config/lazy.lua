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
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim",                                    import = "lazyvim.plugins" },

    -- UI
    { import = "lazyvim.plugins.extras.ui.alpha" },

    -- Copilot
    { import = "lazyvim.plugins.extras.ai.copilot" },

    -- Telescope instead of fzf-lua
    { import = "lazyvim.plugins.extras.editor.telescope" },

    -- Managing Projects
    { import = "lazyvim.plugins.extras.util.project" },

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
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- This strategy will ensure that we do not break anything
    version = false,
  },
  install = {},
  checker = { enabled = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
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
