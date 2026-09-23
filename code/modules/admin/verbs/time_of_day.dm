/client/proc/change_time_of_day()
	set category = "Debug"
	set name = "Change Time of Day"
	if (!processes.time_of_day || !processes.time_of_day.fires_at_gamestates.Find(ticker.current_state))
		to_chat(src, "<span class = 'warning'>你现在无法更改一天中的时间.</span>")
		return
	if (!check_rights(R_ADMIN))
		to_chat(src, "<span class = 'danger'>你没有权限.</span>")
		return
	to_chat(src, "<span class = 'warning'>正在更新光照,请稍候...</span>")
	progress_time_of_day(caller_ref = src, force = TRUE)

/client/proc/toggle_time_of_day()
	set category = "Debug"
	set name = "Toggle Time of Day"
	if (config.daynight_on)
		config.daynight_on = FALSE
		to_chat(src, "<span class = 'good'>一天中的时间现已<b>禁用.</span>")
		message_admins("[key_name(src)] disabled time of day change.", key_name(src))
	else
		config.daynight_on = TRUE
		to_chat(src, "<span class = 'good'>一天中的时间现已<b>启用.</span>")
		message_admins("[key_name(src)] enabled time of day change.", key_name(src))
		
/client/proc/change_wind_dir()
	set category = "Debug"
	set name = "Change Wind Direction (USE VAR EDIT!)"

	if (!check_rights(R_ADMIN))
		to_chat(src, "<span class = 'danger'>你没有权限.</span>")
		return
	var/oldwind = map.winddirection
	map.winddirection = pick("North", "South", "East", "West")
	switch (map.windspeedvar)
		if (0)
			map.windspeed = "calm"
			map.winddesc = "No wind."
		if (1)
			map.windspeed = "a light breeze"
			map.winddesc = "A light [map.winddirection]ern breeze."
		if (2)
			map.windspeed = "a moderate breeze"
			map.winddesc = "A moderate [map.winddirection]ern breeze."
		if (3)
			map.windspeed = "a strong breeze"
			map.winddesc = "A strong [map.winddirection]ern breeze."
		if (4)
			map.windspeed = "a gale"
			map.winddesc = "A [map.winddirection]ern gale."

	if (map.winddirection != oldwind)
		to_chat(world, "<big>风向改变了. 现在从<b>[map.winddirection]</b>吹来.</big>")

/client/proc/change_wind_spd()
	set category = "Debug"
	set name = "Change Wind Speed (USE VAR EDIT!)"

	if (!check_rights(R_ADMIN))
		to_chat(src, "<span class = 'danger'>你没有权限.</span>")
		return

	var/oldspeed = map.windspeedvar
	map.windspeedvar += pick(-1,0,1)
	if (map.windspeedvar > 4)
		map.windspeedvar = 4
	if (map.windspeedvar < 0)
		map.windspeedvar = 0

	switch (map.windspeedvar)
		if (0)
			map.windspeed = "calm"
			map.winddesc = "No wind."
		if (1)
			map.windspeed = "a light breeze"
			map.winddesc = "A light [map.winddirection]ern breeze."
		if (2)
			map.windspeed = "a moderate breeze"
			map.winddesc = "A moderate [map.winddirection]ern breeze."
		if (3)
			map.windspeed = "a strong breeze"
			map.winddesc = "A strong [map.winddirection]ern breeze."
		if (4)
			map.windspeed = "a gale"
			map.winddesc = "A [map.winddirection]ern gale."

	if (map.windspeedvar != oldspeed)
		to_chat(world, "<big>风力改变了. 现在为<b>[map.windspeed]</b>.</big>")
