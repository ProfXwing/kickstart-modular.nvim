local dark_theme = 'catppuccin-macchiato'
local light_theme = 'catppuccin-latte'

local function isDarkTheme()
  local is_dark = false
  if vim.fn.has 'mac' == 1 then
    local handle = io.popen 'defaults read -g AppleInterfaceStyle 2>/dev/null'
    if handle then
      local result = handle:read '*a'
      handle:close()
      if result:match 'Dark' then
        is_dark = true
      end
    end
  else
    is_dark = true
  end

  return is_dark
end

local function updateTheme()
  local is_dark = isDarkTheme()
  if is_dark then
    vim.cmd.colorscheme(dark_theme)
  else
    vim.cmd.colorscheme(light_theme)
  end
end

return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'catppuccin/nvim',
  enabled = true,
  name = 'catppuccin',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    updateTheme()

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
  config = function()
    vim.api.nvim_create_user_command('UpdateTheme', updateTheme, { nargs = 0 })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
