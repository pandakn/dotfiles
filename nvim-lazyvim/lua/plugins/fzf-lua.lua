return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<leader><space>",
      function()
        require("fzf-lua").files({
          prompt = "Find All Files (Excluding node_modules)> ",
          cmd = [[rg --files --hidden --no-ignore --glob '!**/.git/*' --glob '!**/node_modules/*']],
        })
        -- require("telescope.builtin").find_files({
        --   find_command = {
        --     "rg",
        --     "--files",
        --     "--hidden",
        --     "--no-ignore",
        --     "--glob",
        --     "!**/.git/*",
        --     "--glob",
        --     "!**/node_modules/*",
        --   },
        --   prompt_title = "Find All Files (Excluding node_modules)",
        -- })
      end,
      desc = "Find All Files (Excluding node_modules)",
    },
    {
      "<leader>fC",
      function()
        require("fzf-lua").files({
          prompt = "Find .env Files> ",
          cwd = vim.fn.getcwd(),
          cmd = [[rg --files --hidden -g '**/.env*']],
        })
        -- require("telescope.builtin").find_files({
        --   prompt_title = "Find .env Files",
        --   cwd = vim.fn.getcwd(),
        --   hidden = true,
        --   find_command = { "rg", "--files", "--hidden", "-g", "**/.env*" },
        -- })
      end,
      desc = "Find .env Files",
    },
    { "<leader>/", require("fzf-lua").live_grep_glob, desc = "Rg" },
  },
}
