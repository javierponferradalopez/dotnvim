return {

  "williamboman/mason.nvim",
  cmd = "Mason",
  opts = {
    ensure_installed = {
      --- JS ----
      "prettierd",         -- Formatter
      "biome",            -- Server & Formatter & Linter
      "eslint-lsp",       -- Server
      "vtsls",            -- Server
      "js-debug-adapter", -- DAP

      --- JSON ----
      "json-lsp", -- Server

      --- LUA ----
      "lua-language-server", -- Server
      "stylua",              -- Formatter


      --- BASH ----
      "shfmt", -- Formatter

      --- MARKDOWN ----
      "marksman",          -- Server
      "markdown-toc",      -- Formatter
      "markdownlint-cli2", -- Linter & Formatter
    },
  }
}
