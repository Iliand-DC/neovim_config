vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'odin', 'python', 'c', 'cpp', 'jinja', 'commonlisp', 'xml'},
  callback = function() vim.treesitter.start() end,
})
