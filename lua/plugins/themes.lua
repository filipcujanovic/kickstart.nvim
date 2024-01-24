-- return {
--   'maxmx03/dracula.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     local dracula = require 'dracula'
--     dracula.setup()
--     vim.cmd.colorscheme 'dracula'
--   end,
-- }

return {
  'catppuccin/nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local catppuccin = require 'catppuccin'
    catppuccin.setup {
      transparent_background = true,
      -- show_end_of_buffer = true,
      term_colors = true,
    }
    vim.cmd.colorscheme 'catppuccin-frappe'
  end,
}
