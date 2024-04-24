local M = {
  'andweeb/presence.nvim',
  config = function()
    require('presence').setup {
      auto_update = true,
      main_image = 'neovim',
      neovim_image_text = 'What the sigma',
      debounce_timeout = 10,
      enable_line_number = false,
      log_level = nil,
      buttons = false,
      show_time = true,
      blacklist = {},
      file_assets = {},
      editing_text = nil,
      file_explorer_text = nil,
      git_commit_text = nil,
      plugin_manager_text = nil,
      reading_text = nil,
      workspace_text = nil,
      line_number_text = nil,
    }
  end,
}

return { M }
