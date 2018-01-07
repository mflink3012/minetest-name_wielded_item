# Minetest-Mod: name\_wielded\_item

## What is this?

This is a small mod for minetest, which shows the description (or name) of the wielded item on the HUD.

## How to install?

Locate the mods-folder of your minetest(-server)-installation.

Click the *clone or download*-button in GitHub-Repository and download the ZIP-file to the mods-folder by clicking *Download ZIP* or if you have git installed call the following in your mods-folder:
	
	git clone git@github.com:mflink3012/name_wielded_item.git

Now you can select this mod in you minetest-client for singleplayer (e.g. for testing). If you want to use it on your minetest-server you have to edit the world's corresponding ``world.mt`` (inside the specific world-folder) and add

	load_mod_name_wielded_item = true

to its end.

## Which dependencies?

See shipped ``depends.txt``.

## How to use?

1. Just look on the right-bottom-corner with an item in your hand to see its description/name.

![Screenshot](screenshot.png "Screenshot") 

## Known issues?

See the ``issues``-tab in GitHub-Repository.

## Tested with?

minetest 0.4.15

## What license?

GPL 3.0 (See the ``LICENSE``-file shipped or <https://www.gnu.org/licenses/gpl-3.0.txt> for details.)