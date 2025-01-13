return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
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
