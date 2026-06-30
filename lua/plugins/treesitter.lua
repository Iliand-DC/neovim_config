vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'odin', 'py', 'c', 'cpp', },
  callback = function() vim.treesitter.start() end,
})
