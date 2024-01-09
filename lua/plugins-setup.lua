vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    import = 'plugins',
  },
  -- 'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'nvim-lua/plenary.nvim',
  'lewis6991/gitsigns.nvim',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-buffer',
  'ntpeters/vim-better-whitespace',
  'nvim-tree/nvim-web-devicons',
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',
}, {})
