/datum/admins/proc/loadmap()
	set category = "Debug"
	set desc = "SAAAVE!"
	set name = "Load Map (EXPERIMENTAL!)"
	var/mapfile = file("map_saves/map.txt")
	if (!fexists(mapfile))
		to_chat(usr, "存档文件不存在或已损坏!")
		return
	var/loaded_metadata = file2text(mapfile)
	var/list/parsed_metadata = splittext(loaded_metadata, "\n")
	if (map.ID != parsed_metadata[1])
		to_chat(usr, "地图不同!当前地图是<b>[map.ID]</b>,而存档地图是<b>[parsed_metadata[1]]</b>.")
		to_chat(usr, "请先在地图正确的情况下开始一局,然后再加载.")
		return
	var/inp = WWinput(usr, "Are you sure you want to load the saved map?", "Load Map", "No", list("Yes","No"))
	if (inp == "No")
		return
	if(!check_rights(R_SERVER))
		return

	if(!ticker)
		alert("Unable to load the world as it is not set up.")
		return
	ticker.loadmap()
    
/datum/admins/proc/savemap()
	set category = "Debug"
	set desc = "SAAAVE!"
	set name = "Save Map (EXPERIMENTAL!)"
	var/inp = WWinput(usr, "Are you sure you want to save the map?", "Load Map", "No", list("Yes","No"))
	if (inp == "No")
		return
	if(!check_rights(R_SERVER))
		return

	if(!ticker)
		alert("Unable to start the game as it is not set up.")
		return
	spawn(0)
		ticker.savemap()
		