return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    'sharkdp/fd',
    'BurntSushi/ripgrep',
  },
  config = function()
    local actions = require 'telescope.actions'
    require('telescope').setup {
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
      defaults = {
        -- layout_strategy = 'vertical',
        -- layout_config = {
        --   vertical = {
        --     width = 0.9,
        --     height = 0.9,
        --     prompt_position = 'top',
        --     mirror = false,
        --   },
        -- },
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            -- width = 0.9,
            height = 0.9,
            -- prompt_position = 'top',
            -- mirror = false,
          },
        },
        -- wrap_results = true,
        sorting_strategy = 'ascending',
        file_ignore_patterns = {
          'node_modules',
          'vendor',
          '^adminrebuild',
          '^admin/',
          'v/1.*',
          'v/0.*',
          -- '.git*',
        },
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = actions.delete_buffer,
          },
          n = {
            ['<C-d>'] = actions.delete_buffer,
          },
        },
      },
      pickers = {
        buffers = {
          show_all_biffers = true,
          sort_lastused = true,
          theme = 'dropdown',
          previewer = false,
          mappings = {
            n = {
              ['d'] = 'delete_buffer',
            },
          },
        },
      },
    }
    pcall(require('telescope').load_extension, 'fzf')

    local function find_git_root()
      -- Use the current buffer's path as the starting point for the git search
      local current_file = vim.api.nvim_buf_get_name(0)
      local current_dir
      local cwd = vim.fn.getcwd()
      -- If the buffer is not associated with a file, return nil
      if current_file == '' then
        current_dir = cwd
      else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ':h')
      end

      -- Find the Git root directory from the current file's path
      local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
      if vim.v.shell_error ~= 0 then
        print 'Not a git repository. Searching on current working directory'
        return cwd
      end
      return git_root
    end

    -- Custom live_grep function to search in git root
    local function live_grep_git_root()
      local git_root = find_git_root()
      if git_root then
        require('telescope.builtin').live_grep {
          search_dirs = { git_root },
        }
      end
    end

    vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})
    vim.api.nvim_create_autocmd('User', {
      pattern = 'TelescopePreviewerLoaded',
      callback = function(args)
        vim.wo.wrap = true
        vim.wo.number = true
      end,
    })
  end,
}
