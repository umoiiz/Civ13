/client/var/showed_mentorhelp_popup = FALSE

/client/verb/mentorhelp()
	set category = "Help!"
	set name = "Mentorhelp"

	if (say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class = 'red'>语音目前已被管理员禁用.</span>")
		return

	//handle muting and automuting
	if (prefs.muted & MUTE_MENTORHELP) // todo: add this
		to_chat(src, "<font color='red'>错误: 导师私信: 你无法发送导师求助 (已被禁言).</font>")
		return

	if (!showed_mentorhelp_popup)
		WWalert(src, "Before asking for help, please click each of the buttons at the top right of your screen.", "Mentorhelp")
		showed_mentorhelp_popup = TRUE

	mentorhelped = TRUE //Determines if they get the message to reply by clicking the name.

	var/msg = input(src, "What do you need help with? Type nothing to cancel.") as text

	if (handle_spam_prevention(msg,MUTE_MENTORHELP))
		return

	//clean the input msg
	if (!msg)
		return
	msg = sanitize(msg)
	if (!msg)
		return

	if (!mob) //this doesn't happen
		return

	to_chat(src, "<font color=green>私信至-<b>导师 </b>: [msg]</font>")
	if (config.discordurl)
		to_chat(src, "<i>如果没有导师在线, 请在discord中<a href = '[config.discordurl]'>@Mentor</a>.</i>")

	discord_mentorhelp_log(key_name(src),msg)

	var/mentormsg = "<b><font color=green>Request for Help:</font>[get_options_bar(mob, 4, FALSE, TRUE, FALSE)]:</b> [msg]</font>"
	var/adminmsg = "(MENTORHELP) [mentormsg]"

	for (var/client/X in admins)
		if ((R_MENTOR & X.holder.rights) && !((R_ADMIN|R_MOD) & X.holder.rights))
			if (X.is_preference_enabled(/datum/client_preference/holder/play_adminhelp_ping))
				X << 'sound/items/bikehorn.ogg'
			X << mentormsg

		else if ((R_ADMIN|R_MOD) & X.holder.rights)
			if (X.is_preference_enabled(/datum/client_preference/holder/play_adminhelp_ping))
				X << 'sound/items/bikehorn.ogg'
			X << adminmsg

	return

