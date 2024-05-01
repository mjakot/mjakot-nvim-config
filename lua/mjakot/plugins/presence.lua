local M = {
  'andweeb/presence.nvim',
  config = function()
    require('presence').setup {
      auto_update = true,
      main_image = 'neovim',
      neovim_image_text = 'What the sigma',
      debounce_timeout = 5,
      enable_line_number = false,
      log_level = nil,
      buttons = false,
      show_time = true,
      blacklist = {},
      file_assets = {},
      editing_text = 'hell nawh',
      file_explorer_text = 'bro respect my privacy',
      git_commit_text = 'hell nah',
      plugin_manager_text = 'huh',
      reading_text = 'sigma',
      workspace_text = 'gyatt',
      line_number_text = nil,
    }
  end,
}

return { M }
