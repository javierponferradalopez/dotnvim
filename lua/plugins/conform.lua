return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ stop_after_first = true, timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  init = function()
    LazyVim.on_very_lazy(function()
      LazyVim.format.register({
        name = "conform.nvim",
        priority = 100,
        primary = true,
        format = function(buf)
          require("conform").format({ bufnr = buf })
        end,
        sources = function(buf)
          local ret = require("conform").list_formatters(buf)
          return vim.tbl_map(function(v)
            return v.name
          end, ret)
        end,
      })
    end)
  end,
  opts = function()
    ---@type conform.setupOpts
    local opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
        stop_after_first = true,
      },
      formatters = {
        biome = {
          command = "biome",
          args = { "check", "--write", "--stdin-file-path", "$FILENAME" },
          stdin = true,
          cwd = require("conform.util").root_file({ "biome.json", "biome.config.js", "biome.config.ts" }),
          require_cwd = true,
        },
        prettier = {
          cwd = require("conform.util").root_file({ ".prettierrc", ".prettierrc.json", ".prettierrc.js",
            ".prettierrc.mjs", ".prettierrc.cjs",
            "prettier.config.js", "prettier.config.cjs", "prettier.config.mjs" }),
          require_cwd = true,
        },
        eslint_d = {
          cwd = require("conform.util").root_file({ ".eslintrc.js", ".eslintrc.mjs", ".eslintrc.cjs", ".eslintrc.json",
            "eslint.config.js", "eslint.config.mjs", "eslint.config.cjs", "eslint.config.ts"
          }),
          require_cwd = true,
        }
      },
      formatters_by_ft = {
        javascript = { "prettier", "eslint_d", "biome" },
        typescript = { "prettier", "eslint_d", "biome" },
      },
    }

    return opts
  end,
}
