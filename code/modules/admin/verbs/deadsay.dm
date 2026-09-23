/client/proc/dsay(msg as text)
	set category = "Special"
	set name = "Dsay" //Gave this shit a shorter name so you only have to time out "dsay" rather than "dead say" to use it --NeoFite
	set hidden = TRUE
	if (!holder)
		to_chat(src, "只有管理员可以使用此命令.")
		return
	if (!mob)
		return
	if (prefs.muted & MUTE_DEADCHAT)
		to_chat(src, "<span class='warning'>你无法发送DSAY消息 (已被禁言).</span>")
		return

	if (!is_preference_enabled(/datum/client_preference/show_dsay))
		to_chat(src, "<span class='warning'>你已屏蔽死亡聊天.</span>")
		return

	if (handle_spam_prevention(msg,MUTE_DEADCHAT))
		return

	if (quickBan_isbanned("OOC"))
		to_chat(src, "<span class = 'danger'>你已被禁止使用OOC.</span>")
		return

	var/stafftype = uppertext(holder.rank)

	msg = sanitize(msg)
	log_admin("DSAY: [key_name(src)] : [msg]")

	if (!msg)
		return

	say_dead_direct("<span class='name'>[stafftype]([holder.fakekey ? holder.fakekey : key])</span> says, <span class='message'>\"[msg]\"</span>")


