-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

vim.o.shellcmdflag = '-ic'

-- Make line numbers default
vim.wo.number = true

-- enable fold method
vim.o.foldmethod = 'indent'
vim.o.foldlevelstart = 20

-- Show absolute line number
vim.wo.relativenumber = true

-- highlight current line
vim.wo.cursorline = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Consider - as a part of the word
vim.opt.iskeyword:append '-'

-- Enable smart indent
vim.o.smartindent = true
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
