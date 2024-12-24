_G.open_terminal_in_project = function()
  local actions = require("telescope.actions")
  local state = require("telescope.actions.state")
  local telescope = require("telescope")

  telescope.extensions.projects.projects({
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local entry = state.get_selected_entry()
        actions.close(prompt_bufnr)
        -- Change to the selected project's directory
        vim.cmd("cd " .. entry.value)
        -- Open a terminal
        vim.cmd("terminal")
      end)
      return true
    end,
  })
end

return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    -- Update the header with a custom logo
    local logo = [[
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⢿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠋⣁⣴⣶⣿⣿⣿⣿⣿⣿⣿⣷⣶⠌⠉⣉⣤⣶⣶⣶⣶⣶⣤⣈⠙⢿⣿⣿
⣿⣿⣿⣿⣿⠿⠛⢉⣡⣤⣶⣶⣶⣦⣤⣬⣉⣉⠉⠤⢤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⣠⣾⠟⠉⠀⢀⣶⡄⠀⠙⢿⣷⣄⠹⣿
⣿⣿⡿⠋⣡⣴⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⢉⣀⣤⣤⣤⣤⣈⣉⠛⠿⣿⣿⣿⣿⣿⣿⣿⠃⣰⣿⠃⠀⠀⠀⣾⣿⠃⠀⣸⠀⠹⣿⡆⠹
⠟⢁⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⠟⢁⣤⣾⠟⠛⠉⠉⣩⣉⠉⠻⢷⣦⡈⢻⣿⣿⡿⠿⠋⠀⣿⡇⠀⠀⠀⣼⣿⠇⠀⣴⠃⠀⠀⢹⣿⠀
⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⣠⣿⡟⠁⠀⠀⠀⣸⣿⠏⠀⣰⠀⠻⣿⡄⠉⣡⡤⠶⠦⠀⣿⡇⠀⠀⣼⣿⡟⠀⣼⠃⠀⠀⠀⢸⣿⠀
⠿⠟⠋⠉⠉⠉⠉⠉⠛⠉⠁⢰⣿⡟⠀⠀⠀⠀⣴⣿⡟⠀⣰⠃⠀⠀⢹⣿⠀⣠⣤⣴⣦⡄⢻⣷⠀⢠⣿⡟⠀⣼⠃⠀⠀⠀⢀⣾⡟⠀
⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠂⣾⣿⡇⠀⠀⠀⣸⣿⡟⠀⢠⡏⠀⠀⠀⢸⣿⠆⠙⢿⣿⣿⣿⡄⠻⣷⣌⠛⠀⣰⠏⠀⠀⠀⣠⣾⡿⠃⣠
⣤⣤⣄⣈⣉⠉⠛⠛⠻⢿⡆⢹⣿⡇⠀⠀⣰⣿⠏⠀⢀⡞⠀⠀⠀⠀⢸⡿⠀⢠⣶⣤⣤⣤⣴⣦⡉⠻⢷⣦⣤⣤⣤⣴⣿⠿⠋⣀⣾⣿
⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣁⠘⣿⣷⡀⠰⣿⠏⠀⢀⡞⠀⠀⠀⠀⣠⡿⠃⢀⣾⣿⣿⣿⣿⣿⣿⣿⣷⣄⣀⣉⣉⣁⣀⣀⣰⢾⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡈⠻⣿⣦⣈⠀⠀⠚⠁⠀⢀⣠⡾⠟⢀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠠⠸⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠉⠛⠛⠷⠶⠖⠚⠛⠉⣀⣴⣿⣿⣿⣿⣿⠿⠛⠛⠋⠉⠉⠉⠉⣉⣉⣀⣀⣠⣤⣶⡄⠠⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣶⣶⣾⣿⣿⣿⠟⠛⠋⠉⠀⠀⠀⣀⣀⣀⡀⠉⠙⠛⠛⠛⠛⠋⠉⠁⠀⢰⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠉⣁⣀⣠⣤⣤⣶⣾⣿⠟⠀⠀⢿⣿⣿⣿⣷⣦⡀⠐⢶⣾⣿⠿⠋⠀⣾⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⢰⣿⣿⣿⣿⣻⣿⣯⣽⣶⣿⠿⠟⠀⠀⣀⣀⠙⢿⣿⣿⡄⢠⣤⣤⣶⡆⣴⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⣀⣈⡉⠉⠉⠉⣉⣉⣉⣀⣤⣴⣶⣶⣿⣿⣿⣇⠘⣿⣿⣇⠀⣿⣿⣿⠇⣿⢿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠀⠻⠛⠛⠀⠈⣉⣀⣀⣤⡀⢨⣩
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⣠⣤⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣧⠀⢹
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠟⠛⠁⢠⣶⡄⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⢸
⠉⠛⠛⠛⠛⠛⠿⠿⠿⠿⠿⠿⠿⠿⠛⠛⠛⠛⠛⠛⠋⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠘⠃⠙⢷⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠈
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⢀⣤⣶⣶⣤⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣷⣿⣿⣿⣿⣿⡇⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠠


          [ @javierponferradalopez 🤌 ]
    ]]
    opts.section.header.val = vim.split(logo, "\n", { trimempty = true })

    opts.section.buttons.val = {
      opts.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
      opts.button("p", "  Projects", ":Telescope projects<CR>"),
      opts.button("t", "  Terminal", ":lua open_terminal_in_project()<CR>"), -- Terminal in Project
      opts.button("c", "  Config", ":e $MYVIMRC <CR>"),
      opts.button("q", "  Quit", ":qa<CR>"),
    }

    -- Update the footer section (Hide by setting to an empty table)
    opts.section.footer.val = {}

    -- Return the updated options
    return opts
  end,
}
