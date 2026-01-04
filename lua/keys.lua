local wezterm = require 'wezterm'
local M = {}

function M.apply(config)
    -- 设置 Leader 键 (类似 Tmux，先按 Ctrl+a 触发后续动作)
    -- 这样可以有效避免快捷键冲突
    config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

    config.keys = {
        -- --- 分屏操作 ---
        -- 水平分屏：Leader + |
        {
            key = '|',
            mods = 'LEADER|SHIFT',
            action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
        },
        -- 垂直分屏：Leader + -
        {
            key = '-',
            mods = 'LEADER',
            action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' }),
        },

        -- --- 窗格导航 (类似 Vim 的 hjkl) ---
        -- Alt + hjkl 在分屏间切换
        { key = 'h', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
        { key = 'l', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
        { key = 'k', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
        { key = 'j', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },

        -- --- 快速缩放窗格 ---
        -- Leader + z 切换全屏化当前窗格
        { key = 'z', mods = 'LEADER', action = wezterm.action.TogglePaneZoomState },

        -- --- 常用命令 ---
        -- 让 Alt + Enter 切换全屏
        { key = 'Enter', mods = 'ALT', action = wezterm.action.ToggleFullScreen },

        -- 快速重载配置 (虽然自动重载，但手动触发更保险)
        { key = 'r', mods = 'LEADER', action = wezterm.action.ReloadConfiguration },
        {
            key = 'p',
            mods = 'LEADER',
            action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|LAUNCH_MENU_ITEMS' },
        },
    }
end

return M
