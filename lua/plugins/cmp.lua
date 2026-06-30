local cmp = require 'cmp'

cmp.setup({
  completion = {
    keyword_length = 1,
    keyword_pattern = "*",
  },
  mapping = {
    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
    ['<Esc>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
  },
  sources = {
    { name = 'nvim_lsp' },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})


