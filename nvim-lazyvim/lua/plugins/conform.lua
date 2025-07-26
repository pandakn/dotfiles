--- Get project name from current working directory
local project_name = vim.fn.fnamemodify(vim.loop.cwd(), ":t")

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      sh = { "shfmt" },
      -- javascript = { "eslint_d", "prettier" },
      -- typescript = { "eslint_d", "prettier" },
      -- javascriptreact = { "eslint_d", "prettier" },
      -- typescriptreact = { "eslint_d", "prettier" },

      -- -- if project is `skinx-webiste` then disable prettier
      -- javascript = project_name == "skinx-website" and { "injected" } or { "prettier" },
      -- typescript = project_name == "skinx-website" and { "injected" } or { "prettier" },
      -- javascriptreact = project_name == "skinx-website" and { "injected" } or { "prettier" },
      -- typescriptreact = project_name == "skinx-website" and { "injected" } or { "prettier" },
    },
    -- TODO: SEEMS TO NOT BE NEEDED
    -- formatters = {
    --   injected = { options = { ignore_errors = true } },
    --
    --   eslint = {
    --     command = "eslint",
    --     args = { "--fix" },
    --     condition = function(ctx)
    --       return vim.fs.find({ ".eslintrc", ".eslintrc.json", ".eslintrc.js" }, { path = ctx.filename, upward = true })[1]
    --         ~= nil
    --     end,
    --   },
    -- },
  },
}
