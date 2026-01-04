local wezterm = require 'wezterm'
local M = {}

local process_icons = {
    ['pwsh.exe'] = wezterm.nerdfonts.md_powershell,
    ['powershell.exe'] = wezterm.nerdfonts.md_powershell,
    ['cmd.exe'] = wezterm.nerdfonts.md_console_line,
    ['wsl.exe'] = wezterm.nerdfonts.dev_linux,
    ['node.exe'] = wezterm.nerdfonts.mdi_nodejs,
    ['python.exe'] = wezterm.nerdfonts.mdi_python,
    ['git.exe'] = wezterm.nerdfonts.mdi_git,
}

function M.apply(config)
    config.use_fancy_tab_bar = true
    config.tab_bar_at_bottom = false
    config.tab_max_width = 35
    config.hide_tab_bar_if_only_one_tab = false

    config.window_decorations = 'RESIZE'
    config.integrated_title_button_style = "Windows"
    config.integrated_title_button_color = "auto"
    config.integrated_title_button_alignment = "Right"

    wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
        local pane = tab.active_pane
        local process_name = pane.foreground_process_name:match("([^/\\]+)$") or ""
        local icon = process_icons[process_name] or wezterm.nerdfonts.md_terminal
        local title = pane.title:gsub(".*[/\\]", "") -- 只取路径最后一部分

        -- 颜色定义
        local active_bg = '#89b4fa'
        local active_fg = '#11111b'
        local inactive_bg = '#313244'
        local inactive_fg = '#cdd6f4'

        local bg = tab.is_active and active_bg or inactive_bg
        local fg = tab.is_active and active_fg or inactive_fg
        local close_color = tab.is_active and '#f38ba8' or '#9399b2' -- X 的颜色

        return {
            { Background = { Color = bg } },
            { Foreground = { Color = fg } },
            { Text = ' ' .. icon .. ' ' .. title .. ' ' },

        }
    end)
end

return M
