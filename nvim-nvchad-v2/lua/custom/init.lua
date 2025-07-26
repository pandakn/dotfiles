-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 200,
    })
  end
})

local option = vim.o
option.foldmethod = 'expr'
option.foldenable = false -- Enable folding by default
option.foldlevel = 99      -- Start with all folds open
option.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.relativenumber = true
