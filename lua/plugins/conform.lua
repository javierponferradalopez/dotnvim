return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
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
        async = false,
        quiet = false,
        stop_after_first = true,
      },
      formatters = {
        biome = {
          command = "biome",
          args = { "check", "--write", "--stdin-file-path", "$FILENAME" },
          stdin = true,
          require_cwd = true,
        },
        prettierd = {
          require_cwd = true,
        },
      },
      formatters_by_ft = {
        javascript = { "prettierd", "biome" },
        typescript = { "prettierd", "biome" },
      },
    }

    return opts
  end,
}
