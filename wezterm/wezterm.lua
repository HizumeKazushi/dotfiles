local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 1. 別ファイルのキーバインドを一旦変数に入れる
local keybinds = require("keybinds")
config.keys = keybinds.keys
config.key_tables = keybinds.key_tables

-- 2. リーダーキーの設定
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

-- 3. 画面分割などの「追加分」を既存の keys リストに加える
-- (これで keybinds.lua の内容を消さずに済みます)
table.insert(config.keys, {
	key = "v",
	mods = "LEADER",
	action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
})
-- ついでに水平分割 (Leader + h) も追加しておくと便利です
table.insert(config.keys, {
	key = "h",
	mods = "LEADER",
	action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
})

-- 4. 基本設定
config.disable_default_key_bindings = true
config.automatically_reload_config = true
config.font_size = 12.0
config.use_ime = true
config.window_background_opacity = 0.75
config.macos_window_background_blur = 10
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}
config.window_background_gradient = {
	colors = { "#000000" },
}
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
	},
}

-- 5. タブの外観設定
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"
	local edge_background = "none"
	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#FFFFFF"
	end
	local edge_foreground = background
	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

return config
