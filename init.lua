local mod_name = minetest.get_current_modname()

local default_settings_file = minetest.get_modpath(mod_name).."/settings.default.lua"
dofile(default_settings_file)

assert(settings ~= nil, "No settings defined!")
assert(settings.update_time ~= nil, "No settings.update_time set!")
assert(settings.style.position ~= nil, "No settings.style.position set!")
assert(settings.style.offset ~= nil, "No settings.style.offset set!")
assert(settings.style.alignment ~= nil, "No settings.style.alignment set!")
assert(settings.style.scale ~= nil, "No settings.style.scale set!")
assert(settings.style.color ~= nil, "No settings.style.color set!")

local name_wielded_item = {
  update_time = settings.update_time,
  dtime = 0,
  hud_to_player = {},
  style = settings.style,
}

function name_wielded_item.add(player)
    local index_text = player:hud_add({
        hud_elem_type = "text",
        position  = name_wielded_item.style.position,
        offset    = name_wielded_item.style.offset,
        text      = "",
        alignment = name_wielded_item.style.alignment,
        scale     = name_wielded_item.style.scale,
        number    = name_wielded_item.style.color,
    })
    local player_name = player:get_player_name()

    name_wielded_item.hud_to_player[player_name] = {
      index_text = index_text
    }
end

function name_wielded_item.remove(player)
    local player_name = player:get_player_name()

    if name_wielded_item.hud_to_player[player_name] ~= nil then
      player:hud_remove(name_wielded_item.hud_to_player[player_name].index_text)
      name_wielded_item.hud_to_player[player_name] = nil
    end
end

function name_wielded_item.update(player)
  local wielded_item = player:get_wielded_item()
  local player_name = player:get_player_name()
  
  if wielded_item ~= nil then
    local wielded_item_name = wielded_item:get_name()

    if wielded_item:get_definition().description ~= nil then
      wielded_item_name = wielded_item:get_definition().description 
    end

    if name_wielded_item.hud_to_player[player_name] ~= nil then
      player:hud_change(name_wielded_item.hud_to_player[player_name].index_text, "text", wielded_item_name)
    else
      name_wielded_item.add(player)
    end
  else
    player:hud_change(name_wielded_item.hud_to_player[player_name].index_text, "text", "")
  end
end

function name_wielded_item.on_globalstep(dtime)
  name_wielded_item.dtime = name_wielded_item.dtime + dtime
  if name_wielded_item.dtime > name_wielded_item.update_time then
    for _,player in ipairs(minetest.get_connected_players()) do
      name_wielded_item.update(player)
    end

    name_wielded_item.dtime = 0
  end
end

function name_wielded_item.on_joinplayer(player)
  name_wielded_item.add(player)
end

function name_wielded_item.on_leaveplayer(player)
  name_wielded_item.remove(player)
end

minetest.register_on_joinplayer(name_wielded_item.on_joinplayer)
minetest.register_on_leaveplayer(name_wielded_item.on_leaveplayer)
minetest.register_globalstep(name_wielded_item.on_globalstep)

if minetest.setting_get("log_mods") then
  minetest.log("action", "[mod/" .. mod_name .. "] loaded.")
end