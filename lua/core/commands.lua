vim.api.nvim_create_user_command('ParseJson', "%!jq '.'", {})
vim.api.nvim_create_user_command('DecodeJson', '%s/\\"/"/g', {})
