return {
  { "nvim-neotest/neotest-plenary" },
  { "haydenmeade/neotest-jest" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        "neotest-plenary",
        "neotest-jest",
      },
      output = { open_on_run = true },
    },
  },
}
