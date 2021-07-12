--[[
O is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
O.format_on_save = true
O.auto_complete = true
O.colorscheme = "base16-summerfruit-light"
O.auto_close_tree = 0
O.wrap_lines = false
O.timeoutlen = 300
O.leader_key = " "
O.ignore_case = true
O.smart_case = true

-- TODO User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
O.plugin.dashboard.active = true
O.plugin.colorizer.active = false
O.plugin.ts_playground.active = false
O.plugin.indent_line.active = false
O.plugin.zen.active = false

-- dashboard
-- O.dashboard.custom_header = {""}
-- O.dashboard.footer = {""}

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = "all"
O.treesitter.ignore_install = { "haskell" }
O.treesitter.highlight.enabled = true

-- python
-- O.python.linter = 'flake8'
O.lang.python.isort = true
O.lang.python.diagnostics.virtual_text = true
O.lang.python.analysis.use_library_code_types = true

-- javascript
O.lang.tsserver.linter = nil

-- Additional Plugins
-- O.custom_plugins = {{"windwp/nvim-ts-autotag"}}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- O.user_autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}

-- Additional Leader bindings for WhichKey
-- O.user_which_key = {
--   A = {
--     name = "+Custom Leader Keys",
--     a = { "<cmd>echo 'first custom command'<cr>", "Description for a" },
--     b = { "<cmd>echo 'second custom command'<cr>", "Description for b" },
--   },
-- }

O.plugin.ts_autotag.active = true
O.lang.rust.active = true
O.lang.rust.rust_tools.active = true
O.hl_search = true
-- spell check for dev is not ideal
O.spell = false
O.document_highlight = false
O.relative_number = true

require "lsp.tailwindcss-ls"

O.user_plugins = {
  { "RRethy/nvim-base16" },
  { "mattn/emmet-vim" },
  { "tpope/vim-surround" },
  -- ]n and [n jump to conflict section is awesome
  { "tpope/vim-unimpaired" },
}

-- Go to previously opened buffer, which is more ergonomic
vim.api.nvim_set_keymap("n", "<S-TAB>", ":b#<CR>", { noremap = true, silent = true })
-- Use the tab key match bracket pairs. It's a hell of a lot easier to type <tab> than <%>
vim.api.nvim_set_keymap("n", "<TAB>", "%", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<TAB>", "%", { noremap = true, silent = true })

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
