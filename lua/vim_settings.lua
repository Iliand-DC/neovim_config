local Plug = vim.fn['plug#']

vim.cmd [[
syntax on
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number relativenumber
set mouse=a
set belloff=all
set nobackup
set incsearch
set ignorecase
set showcmd set encoding=UTF-8
set cursorline

---Включаем распознавание типов файлов и типо-специфичные плагины:
filetype on
filetype plugin on

--- set cursorline
set complete=---"
set complete+=.
set complete+=k
set complete+=b
set complete+=t
--- Type jj to exit insert mode quickly.
inoremap jj <Esc>

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

---Колоночка, чтобы показывать плюсики для скрытия блоков кода:
set foldcolumn=1

---highlight ExtraWhitespace ctermbg=red guibg=red
---au ColorScheme * highlight ExtraWhitespace guibg=red
---au BufEnter * match ExtraWhitespace /\s\+$/
---au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
---au InsertLeave * match ExtraWhiteSpace /\s\+$/

--- Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

---set list listchars=trail:.,extends:>
autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()

---Переносим на другую строчку, разрываем строки
--- set wrap
--- set linebreak

if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
]]

vim.call('plug#begin(---~/.vim/plugged")')
  Plug('ku1ik/vim-monokai')
  Plug('neoclide/coc.nvim', {['branch'] = 'release'})
  Plug('junegunn/fzf', { ['do'] = function() vim.fn['fzf#install']() end })
  Plug('junegunn/fzf.vim')
  Plug('liuchengxu/vim-which-key')
  Plug('sainnhe/sonokai')
  Plug('tpope/vim-surround')
  Plug('pacokwon/onedarkhc.vim')
  Plug('kaicataldo/material.vim', { ['branch'] = 'main' })
  Plug('nanotech/jellybeans.vim')
  Plug('ayu-theme/ayu-vim')
  Plug('prabirshrestha/vim-lsp')
  Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
  Plug('nvim-neo-tree/neo-tree.nvim')
  Plug('folke/flash.nvim')
  Plug('akinsho/bufferline.nvim')
  Plug('nvimdev/galaxyline.nvim')
  Plug('MunifTanjim/nui.nvim')
  Plug('nvim-lua/plenary.nvim')
  Plug('nvim-tree/nvim-web-devicons')
  Plug('akinsho/horizon.nvim')
  Plug('NeogitOrg/neogit')
  Plug('tpope/vim-surround')
  Plug('navarasu/onedark.nvim')
  Plug('shaunsingh/nord.nvim')
  Plug('nvim-lualine/lualine.nvim')
  Plug('L3MON4D3/LuaSnip', {['tag'] = 'v2.*', ['do'] = 'make install_jsregexp'})
  Plug('neovim/nvim-lspconfig')
  Plug('rafamadriz/friendly-snippets')
  Plug('romgrk/doom-one.vim')
  Plug('iissnan/tangox')
  Plug('micke/vim-hybrid')
  Plug('akinsho/toggleterm.nvim', {['tag'] = '*'})

vim.call('plug#end')

vim.cmd[[
set noerrorbells
set novisualbell

let g:airline#extensions#keymap#enabled = 0 ---Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' ---Поддержка unicode

--- set background = "dark"
--- let g:material_terminal_italics = 1

let g:jellybeans_overrides = {
\    'background': { 'guibg': '1f1f36' },
\}
set termguicolors

let ayucolor="mirage"
colorscheme onedarkhc


let mapleader=" " set <leader> key to SPACE
nnoremap <SPACE> <Nop>

--- make double esc send empty command to clear something
nnoremap <silent> <ESC><ESC> :noh<CR>

--- vim-powered terminal in split window
map <Leader>t :term ++close<cr>
tmap <Leader>t <c-w>:term ++close<cr>

tnoremap <Esc> <C-\><C-n>

autocmd StdinReadPre * let s:std_in=1
--- " Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
--- Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

--- If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

nmap <C-s> :w<CR>
imap <C-s> <esc>:w<CR>

--- Use tab for trigger completion with characters ahead and navigate
--- NOTE: There's always complete item selected by default, you may want to enable
--- no select by `"suggest.noselect": true` in your configuration file
--- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
--- other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

--- Make <CR> to accept selected completion item or notify coc.nvim to format
--- <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

--- Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

--- Use `[g` and `]g` to navigate diagnostics
--- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

--- GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

--- Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

--- Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

--- Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

--- Formatting selected code
--- xmap <leader>f  <Plug>(coc-format-selected)
--- nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  --- Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

--- Applying code actions to the selected code block
--- Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

--- Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
--- Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
--- Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

--- Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

--- Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

--- Map function and class text objects
--- NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

--- Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : ---\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : ---\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? ---\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? ---\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : ---\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : ---\<C-b>"
endif

--- Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

--- Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

--- Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

--- Add (Neo)Vim's native statusline support
--- NOTE: Please see `:h coc-status` for integrations with external plugins that
--- provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

--- Mappings for CoCList
--- Show all diagnostics
---nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
---" Manage extensions
---nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
---" Show commands
---nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
---" Find symbol of current document
---nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
---" Search workspace symbols
---nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
---" Do default action for next item
---nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
---" Do default action for previous item
---nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
---" Resume latest coc list
---nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
---
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
set ttimeout
set ttyfast

set guicursor=
]]
