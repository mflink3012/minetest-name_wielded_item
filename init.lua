local modName = minetest.get_current_modname();

local name_wielded_item = {
  update_time = 0.25,
  dtime = 0,
  hud_to_player = {}
}

function name_wielded_item.add(player)
    local index_text = player:hud_add({
        hud_elem_type = "text",
        position  = {x = 0.5, y = 1.0},
        offset    = {x = 100, y = -70},
        text      = "",
        alignment = 0,
        scale     = { x = 100, y = 30},
        number    = 0xcfcfcf,
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
  minetest.log("action", "[mod/" .. modName .. "] loaded.")
end