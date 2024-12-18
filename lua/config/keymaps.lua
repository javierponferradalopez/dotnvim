-- This file is automatically loaded by lazyvim.config.init
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- copy path current file
map(
  "n",
  "<leader>y",
  "\":let @+=expand('%:p')<CR>\"",
  { expr = true, silent = true, desc = "Copy path to current file" }
)

-- open a terminal
map("n", "<leader>t", ":vsplit | term<CR>", { desc = "Open a new terminal" })

-- unfocus terminal
map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })

-- jump multiple lines
map("n", "D", "<c-d>", { silent = true })
map("n", "U", "<c-u>", { silent = true })
