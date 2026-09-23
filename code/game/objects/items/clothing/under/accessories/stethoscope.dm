/obj/item/clothing/accessory/stethoscope
	name = "听诊器"
	desc = "一种用于听诊人体声音的医疗器具."
	icon_state = "stethoscope"

/obj/item/clothing/accessory/stethoscope/attack(mob/living/human/M, mob/living/human/user)
	if (ishuman(M) && isliving(user))
		if (user.a_intent == I_HELP)
			var/body_part = parse_zone(user.targeted_organ)
			if (body_part)
				var/their = "their"
				switch(M.gender)
					if (MALE)	their = "his"
					if (FEMALE)	their = "her"
				var/sound = "heartbeat"
				var/sound_strength = "cannot hear"
				var/heartbeat = FALSE
				var/heartrate = "is asystolic."
				if (M.species && M.species.has_organ["heart"])
					heartbeat = TRUE
				if (M.stat == DEAD || (M.status_flags&FAKEDEATH))
					sound_strength = "cannot hear"
					sound = "anything"
				else
					switch(body_part)
						if ("chest")
							sound_strength = "hear"
							sound = "no heartbeat"
							if (heartbeat)
								var/obj/item/organ/heart/heart = M.internal_organs_by_name["heart"]
								if (heart.is_bruised() || M.getOxyLoss() > 50)
									sound = "[pick("odd noises in","a weak")] heartbeat"
								else if (heart.pulse == PULSE_THREADY)
									sound = "a thready heartbeat"
								else
									sound = "a regular heartbeat"
								if (heart.pulse == PULSE_NONE)
									heartrate = "is asystolic."
								if (heart.pulse == PULSE_SLOW)
									heartrate = "is in bradycardia with [M.get_pulse(GETPULSE_TOOL)] beats per minute."
								if (heart.pulse == PULSE_NORM)
									heartrate = "has a normal heartrate with [M.get_pulse(GETPULSE_TOOL)] beats per minute."
								if (heart.pulse == PULSE_FAST)
									heartrate = "is in moderate tachycardia with [M.get_pulse(GETPULSE_TOOL)] beats per minute."
								if (heart.pulse == PULSE_2FAST)
									heartrate = "is in extreme tachycardia with [M.get_pulse(GETPULSE_TOOL)] beats per minute."
								if (heart.pulse == PULSE_THREADY)
									heartrate = "has a thready pulse with [M.get_pulse(GETPULSE_TOOL)] beats per minute. That's a sign of a hypovolemic shock (extreme blood loss)!"
							var/obj/item/organ/heart/L = M.internal_organs_by_name["lungs"]
							if (!L || M.losebreath)
								sound += " and no respiration"
							else if (M.is_lung_ruptured() || M.getOxyLoss() > 50)
								sound += " and [pick("wheezing","gurgling")] sounds"
							else
								sound += " and healthy respiration"
						if ("eyes","mouth")
							sound_strength = "cannot hear"
							sound = "anything"
						else
							if (heartbeat)
								sound_strength = "hear a weak"
								sound = "pulse"
				user.visible_message("[user]将[src]贴在[M]的[body_part]上,专注地听着.", "你将[src]贴在[their][body_part]上.你[sound_strength][sound].[M][heartrate]")
				return
	return ..(M,user)