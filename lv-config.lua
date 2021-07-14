O.default_options.timeoutlen = 300
O.default_options.relativenumber = true
O.default_options.hlsearch = true
O.default_options.wrap = true
O.lsp.document_highlight = false

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = "all"
O.treesitter.ignore_install = { "haskell" }

-- javascript
O.lang.tsserver.linter = nil
O.lang.tsserver.formatter.args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) }

-- rust
O.lang.rust.active = true
O.lang.rust.rust_tools.active = true

O.user_plugins = {
  { "RRethy/nvim-base16" },
  { "mattn/emmet-vim" },
  { "tpope/vim-surround" },
  -- ]n and [n jump to conflict section is awesome
  { "tpope/vim-unimpaired" },
  { "kevinhwang91/nvim-bqf" },
}

require "lsp.tailwindcss-ls"

O.colorscheme = "base16-summerfruit-light"

-- Go to previously opened buffer, which is more ergonomic
vim.api.nvim_set_keymap("n", "<S-TAB>", ":b#<CR>", { noremap = true, silent = true })
-- Use the tab key match bracket pairs. It's a hell of a lot easier to type <tab> than <%>
vim.api.nvim_set_keymap("n", "<TAB>", "%", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<TAB>", "%", { noremap = true, silent = true })

-- [overrides]
-- jj is enough
vim.api.nvim_set_keymap("i", "jk", "jk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "kj", "kj", { noremap = true, silent = true })
-- <C-q> not my taste
vim.api.nvim_set_keymap("", ",q", ":call QuickFixToggle()<CR>", { noremap = true, silent = true })

-- nvim-lsp-ts-utils related
vim.api.nvim_set_keymap("n", "gs", ":TSLspOrganize<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gq", ":TSLspFixCurrent<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gf", ":TSLspRenameFile<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "ga", ":TSLspImportAll<CR>", { silent = true })

vim.cmd [[
nnoremap ; :

" Don’t reset cursor to start of line when moving around.
set nostartofline

set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

au BufRead,BufNewFile *.bean set filetype=beancount

set showbreak=↪
set lcs=tab:▸\ ,eol:¬,nbsp:_
" Shortcut to rapidly toggle `set list`
nmap ,l :set list!<CR>
]]

--[[
# Tips and Tricks

## Search and replace in quickfix window

- `:cdo s/from/to`
- `:cfdo update`
- Even `:cfdo undo`

Combile with nvim-bqf's ability to filter items of quickfix list can be powerful.
Simply as `<tab>` to sign item, `zn` to create new list for signed items.
See https://github.com/kevinhwang91/nvim-bqf#function-table for more info.
--]]
