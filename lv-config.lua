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
O.colorscheme = "base16-solarized-light"
O.auto_close_tree = 0
O.wrap_lines = false
O.timeoutlen = 300
O.document_highlight = true
O.leader_key = " "
O.ignore_case = true
O.smart_case = true
O.lushmode = false
O.transparent_window = false

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

O.lang.clang.diagnostics.virtual_text = true
O.lang.clang.diagnostics.signs = true
O.lang.clang.diagnostics.underline = true

-- python
-- add things like O.python.linter.flake8.exec_path
-- O.python.linter = 'flake8'
O.lang.python.isort = true
O.lang.python.diagnostics.virtual_text = true
O.lang.python.diagnostics.signs = true
O.lang.python.diagnostics.underline = true
O.lang.python.analysis.type_checking = "off"
O.lang.python.analysis.auto_search_paths = true
O.lang.python.analysis.use_library_code_types = true

-- javascript
O.lang.tsserver.linter = nil

-- php
O.lang.php.environment.php_version = "7.4"
O.lang.php.diagnostics.signs = true
O.lang.php.diagnostics.underline = true
O.lang.php.filetypes = { "php", "phtml" }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- O.user_autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}

O.plugin.ts_autotag.active = true
O.lang.tailwindcss.active = true
O.hl_search = true

-- Additional Plugins
-- O.custom_plugins = {{"windwp/nvim-ts-autotag"}}
O.custom_plugins = {
	{ "RRethy/nvim-base16" },
	{ "mattn/emmet-vim" },
	{ "tpope/vim-surround" },
	-- ]n and [n jump to conflict section is awesome
	{ "tpope/vim-unimpaired" },
}

vim.cmd([[
function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

nnoremap ; :

" Don’t reset cursor to start of line when moving around.
set nostartofline

set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]])
