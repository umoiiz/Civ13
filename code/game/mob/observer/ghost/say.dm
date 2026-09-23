/mob/observer/ghost/say(var/message)
	message = sanitize(message)

	if (!message)
		return

	log_say("Ghost/[key] : [message]")

	if (client)
		if (client.prefs.muted & MUTE_DEADCHAT)
			to_chat(src, "<span class = 'red'>你无法在死亡聊天中说话 (已禁言).</span>")
			return

		if (client.handle_spam_prevention(message,MUTE_DEADCHAT))
			return
		if (client && client.quickBan_isbanned("OOC"))
			to_chat(src, "<span class = 'danger'>你被禁止使用OOC.</span>")
			return
	. = say_dead(message)


/mob/observer/ghost/emote(var/act, var/type, var/message)
	if (!message)
		return

	if (act != "me")
		return

	log_emote("Ghost/[key] : [message]")

	if (client)
		if (client.prefs.muted & MUTE_DEADCHAT)
			to_chat(src, "<span class = 'red'>你无法在死亡聊天中做表情 (已禁言).</span>")
			return

		if (client.handle_spam_prevention(message, MUTE_DEADCHAT))
			return

	. = emote_dead(message)
