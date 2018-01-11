settings = {}

style_presets = {
  above_hotbar = {
      -- move 50% left, move 100% down
      position = { x = 0.5, y = 1.0 },
      -- center on x, move 100px up
      offset = { x = 0, y = -100 },
      -- center on x and y
      alignment = { x = 0, y = 0 },
      -- 100px width, 30px height
      scale = { x = 100, y = 30 },
      -- light grey, defined in hex with RRGGBB arrangement
      color = 0xcfcfcf,
  },
  right_bottom_corner = {
      -- move 100% left, move 100% down
      position = { x = 1.0, y = 1.0 },
      -- move 10px left, move 30px up
      offset = { x = -10, y = -30 },
      -- align to the left
      alignment = { x = -1, y = 0 },
      -- 100px width, 30px height
      scale = { x = 100, y = 30 },
      -- light grey, defined in hex with RRGGBB arrangement
      color = 0xcfcfcf,
  },
  left_bottom_corner = {
      -- move 0% left, move 100% down
      position = { x = 0.0, y = 1.0 },
      -- move 10px right, move 30px up
      offset = { x = 10, y = -30 },
      -- align to the right
      alignment = { x = 1, y = 0 },
      -- 100px width, 30px height
      scale = { x = 100, y = 30 },
      -- light grey, defined in hex with RRGGBB arrangement
      color = 0xcfcfcf,
  },

  -- details on the values can be read from https://rubenwardy.com/minetest_modding_book/en/chapters/hud.html
}

-- choosing style
settings.style = style_presets.above_hotbar

-- update every 250ms, the bigger this value is, the more it will lag on changes, the less it is, the more cpu is used
settings.update_time = 0.25 

-- [[ DO NOT CHANGE CODE BELOW ]] --

local function file_exists(name)
  local file = io.open(name, "r")

  if file ~= nil then
    io.close(file)
    return true
  end

  return false
end

local mod_name = minetest.get_current_modname()
local custom_settings_filename = minetest.get_modpath(mod_name).."/settings.lua"

if file_exists(custom_settings_filename) then
  minetest.log("info", "Loading custom settings ...")
  dofile(custom_settings_filename)
else
  minetest.log("warning", "WARNING! No custom settings found in "..custom_settings_filename..". Using defaults!")
end
