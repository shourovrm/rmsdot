require("_options")
require("_plugins")
require("_lsp")
require("_treesitter")
require("_telescope")
require("_whichkey")
require("_null-ls")
require("_terminal")

-- vim.cmd("colorscheme walh-gruvbox")
vim.cmd("colorscheme murphy")

-- important to import after colorscheme
-- require("_statusline")
require('lualine').setup()

-- This clipboard command doesn't work, because the neovim is not compiled with clipboard
vim.o.clipboard = "unnamedplus"
