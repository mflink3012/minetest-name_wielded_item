# Minetest-Mod: name\_wielded\_item

## What is this?

This is a small mod for minetest, which shows the description (or name) of the wielded item on the HUD.

## How to install?

Locate the mods-folder of your minetest(-server)-installation.

Click the *clone or download*-button in GitHub-Repository and download the ZIP-file to the mods-folder by clicking *Download ZIP* or if you have git installed call the following in your mods-folder:
	
	git clone https://github.com/mflink3012/name_wielded_item.git

Now you can select this mod in you minetest-client for singleplayer (e.g. for testing). If you want to use it on your minetest-server you have to edit the world's corresponding ``world.mt`` (inside the specific world-folder) and add

	load_mod_name_wielded_item = true

to its end.

## Which dependencies?

None.

## How to use?

1. Just look on your hub and see the description of the currently wielded item.

On default settings, it is right above the hotbar:

![Screenshot](screenshot.png)

You can override the configuration of this mod easily by adding ``settings.lua`` to the mod's folder. Just copy the settings you want to change from [settings.default.lua](settings.default.lua) to ``settings.lua``.

For example:

	settings.style.color = 0x0c0c0c
	settings.style.scale = { x = 200, y = 60 }

Or use the presets defined in [settings.default.lua](settings.default.lua).

See also the shipped ``settings.lua-example``.

## Known issues?

See the ``issues``-tab in GitHub-Repository.

## Tested with?

minetest 0.4.15

## What license?

GPL 3.0 (See the [LICENSE](LICENSE)-file shipped or <https://www.gnu.org/licenses/gpl-3.0.txt> for details.)