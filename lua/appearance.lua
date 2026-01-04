local wezterm = require 'wezterm'
local M = {}

function M.apply(config)
    -- --- 1. 配色方案 ---
    config.color_scheme = 'Catppuccin Macchiato'

    -- --- 2. 字体设置 ---
    config.font = wezterm.font_with_fallback({
        'Ioskeley Mono',
        'HarmonyOS Sans SC',
    })
    config.font_size = 12.0
    config.line_height = 1.2

    -- --- 3. 颜色配置 ---
    config.colors = {
        selection_fg = '#1e1e2e',
        selection_bg = '#fab387',
        cursor_bg = '#5bc0de',
        cursor_fg = '#1e1e2e',
        cursor_border = '#5bc0de',
        tab_bar = {
                    background = '#181825', -- 标签栏底色，设为深色
                    active_tab = {
                        bg_color = '#89b4fa',
                        fg_color = '#11111b',
                    },
                    inactive_tab = {
                        bg_color = '#313244',
                        fg_color = '#cdd6f4',
                    },
                    inactive_tab_hover = {
                        bg_color = '#45475a',
                        fg_color = '#cdd6f4',
                    },
                    new_tab = {
                        bg_color = '#181825',
                        fg_color = '#cdd6f4',
                    },
                    new_tab_hover = {
                        bg_color = '#45475a',
                        fg_color = '#cdd6f4',
                    },
                },
    }

    -- --- 4. 背景与透明度 ---
    config.window_background_opacity = 0.92
    config.win32_system_backdrop = 'Acrylic'

    -- --- 5. 窗口布局 ---
    config.window_padding = {
        left = 18,
        right = 18,
        top = 18,
        bottom = 18,
    }
    config.window_decorations = "RESIZE"

    -- --- 6. 标签栏与光标行为 ---
    config.use_fancy_tab_bar = false
    config.hide_tab_bar_if_only_one_tab = false
    config.default_cursor_style = 'BlinkingBlock'
    config.cursor_blink_rate = 500


    -- --- 7. 修复：终端 Bell 行为 ---
    -- visual_bell 现在需要配置具体的淡入淡出效果
    config.visual_bell = {
      fade_in_function = 'Linear',
      fade_in_duration_ms = 75,
      fade_out_function = 'Linear',
      fade_out_duration_ms = 75,
    }
    config.audible_bell = 'Disabled'
end

return M
