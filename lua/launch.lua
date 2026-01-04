local wezterm = require 'wezterm'
local M = {}

function M.apply(config)
    -- 定义启动菜单
    config.launch_menu = {
        {
            label = 'PowerShell Core',
            args = { 'pwsh.exe', '-NoLogo' },
        },
        {
            label = 'Windows PowerShell',
            args = { 'powershell.exe', '-NoLogo' },
        },
        {
            label = 'Command Prompt',
            args = { 'cmd.exe' },
        },
        {
            label = 'Git Bash',
            args = { 'C:/Program Files/Git/bin/bash.exe', '--login' },
        },
    }

    -- 自动检测 WSL
    -- 如果你安装了 WSL，它会自动出现在默认列表里，
    -- 但如果你想手动添加特定发行版：
    table.insert(config.launch_menu, {
        label = 'WSL (Ubuntu)',
        args = { 'wsl.exe', '~' },
    })

    -- 默认 Shell 设置 (这里设置为新版的 PowerShell)
    config.default_prog = { 'pwsh.exe', '-NoLogo' }
end

return M
