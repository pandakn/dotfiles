return {
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("dap")
    end,
    keys = {
      { "<leader>dL", "<cmd>Telescope dap list_breakpoints<cr>", desc = "DAP: List Breakpoints" },
    },
  },
}
