local wezterm = require 'wezterm'
local M = {}

function M.apply()
    -- 注意：所有的 window 操作必须在这个事件回调函数内部
    wezterm.on('update-status', function(window, pane)
        -- 1. 获取时间
        local date = wezterm.strftime('%H:%M:%S')

        -- 2. 获取当前路径 (CWD)
        local cwd_uri = pane:get_current_working_dir()
        local cwd = ""
        if cwd_uri then
            cwd = cwd_uri.file_path
            -- 简单的路径缩减：只显示最后一部分（可选）
            cwd = cwd:match("([^/\\]+[/\\]?)$") or cwd
        end

        -- 3. 设置状态栏内容
        window:set_right_status(wezterm.format({
            { Foreground = { Color = '#7aa2f7' } },
            { Text = '   ' .. cwd .. ' ' },
            { Foreground = { Color = '#e0af68' } },
            { Text = '   ' .. date .. ' ' },
        }))
    end)
end

return M
