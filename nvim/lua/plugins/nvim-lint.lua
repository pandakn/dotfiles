return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- Event to trigger linters
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {

        ["*"] = { "cspell" },
      },
      cspell = {
        config = {
          config_file = vim.fn.expand("~/.config/nvim/cspell.json"),
        },
      },
    },
  },
}
