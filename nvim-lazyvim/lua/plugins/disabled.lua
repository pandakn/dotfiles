return {
  --   {
  --     "folke/persistence.nvim",
  --     event = "BufReadPre",
  --     opts = { options = vim.opt.sessionoptions:get() },
  --     -- stylua: ignore
  --     keys = {
  --       { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
  --       { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
  --       { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  --     },
  --     enabled = false,
  --   },
  -- Disable nvim-snippets to use lua-snip instead
  {
    {
      "garymjr/nvim-snippets",
      opts = {
        friendly_snippets = true,
      },
      dependencies = { "rafamadriz/friendly-snippets" },
      enabled = false,
    },
  },
}
