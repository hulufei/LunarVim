local status_ok, error = pcall(vim.cmd, "luafile " .. CONFIG_PATH .. "/lua/lv-user/init.lua")
if not status_ok and string.find(error, "No such file or directory") == nil then
  print "something is wrong with your lv-user/init.lua"
  print(error)
end

O.default_options.timeoutlen = 300
O.default_options.relativenumber = true
O.default_options.hlsearch = true
O.default_options.wrap = true
O.lsp.document_highlight = false

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = "all"
O.treesitter.ignore_install = { "haskell" }

-- rust
O.lang.rust.active = true
O.lang.rust.rust_tools.active = true
-- javascript
O.lang.tsserver.linter = nil

O.plugin.telescope.defaults.path_display = { "absolute" }

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
local colors = require("colors")["summerfruit-light"]
-- https://github.com/chriskempson/base16/blob/master/styling.md
O.plugin.galaxyline.colors.alt_bg = colors.base01

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
vim.api.nvim_set_keymap(
  "n",
  ",A",
  "<cmd>lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')})<cr>",
  -- "<cmd>lua require('telescope.builtin').live_grep({default_text = vim.fn.expand('<cword>')})<cr>",
  {}
)

-- Tweak terminal
vim.api.nvim_set_keymap("n", ",t", ":terminal<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-N>:bd!<cr>", { noremap = true, silent = true })

-- nvim-lsp-ts-utils related
vim.api.nvim_set_keymap("n", "gs", ":TSLspOrganize<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gq", ":TSLspFixCurrent<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gf", ":TSLspRenameFile<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "ga", ":TSLspImportAll<CR>", { silent = true })

function CopyExpandFilePath(v)
  local path = vim.fn.expand(v)
  vim.fn.setreg("*", path)
  print("Copied " .. path .. " to clipboard")
end
O.user_which_key["y"] = {
  name = "Copy Path",
  p = { "<cmd>lua CopyExpandFilePath('%:p')<CR>", "Copy current buffer path" },
  d = { "<cmd>lua CopyExpandFilePath('%:p:h')<CR>", "Copy current buffer parent path" },
  f = { "<cmd>lua CopyExpandFilePath('%:t')<CR>", "Copy current buffer filename" },
}
O.user_which_key["C"] = { "<cmd>bdelete!<CR>", "Close Buffer!" }

vim.cmd [[
nnoremap ; :

" Don’t reset cursor to start of line when moving around.
set nostartofline

set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

au BufRead,BufNewFile *.bean set filetype=beancount
" Enter insert mode on terminal open
au TermOpen term://* startinsert

set showbreak=↪
set lcs=tab:▸\ ,eol:¬,nbsp:_
" Shortcut to rapidly toggle `set list`
nmap ,l :set list!<CR>

" vertical line ruler
map ,ch :call SetColorColumn()<CR>
function! SetColorColumn()
  let col_num = virtcol(".")
  let cc_list = split(&cc, ',')
  if count(cc_list, string(col_num)) <= 0
    execute "set cc+=".col_num
  else
    execute "set cc-=".col_num
  endif
endfunction

let jsx = { 'extends': 'jsx' }
let g:user_emmet_settings = { 'typescript': jsx, 'javascript': jsx }
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

## Toggle help window

1. Inside help window, just :q
2. Outside help window, <C-w>o or :on[ly] Make the current window the only one on the screen.

## Terminal Usage

- Just use tmux, and CTRL-D to exit
- Or if use :terminal, tnoremap :bd! to exist quickly
--]]
