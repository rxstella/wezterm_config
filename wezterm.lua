local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local appearance = require 'lua.appearance'
local status = require 'lua.status'
local keys = require 'lua.keys'
local launch = require 'lua.launch'
local tabbar = require 'lua.tabbar' -- 1. 引入

appearance.apply(config)
status.apply()
keys.apply(config)
launch.apply(config)
tabbar.apply(config) -- 2. 应用

return config
