mob
	var
		tmp/absorbing=0





obj
	skill
		absorb//this is the line the must only contain one verb after it untill the next jutsu
			verb
				absorb()
					set category = "Skills"
					set name = "Absorption"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					if(usr.absorbing)
						src.cooldown=world.time+20
						usr.absorbing=0
						usr.Frozen=0
						usr<<"You stop absorbing."
						usr.icon_state=""
						usr.overlays-='absorbtion.dmi'
						usr.overlays-='absorbtion.dmi'
						usr.overlays-='absorbtion.dmi'
						return
					src.cooldown=world.time+50
					if(usr.handseal(20,0))
						usr.Frozen=1
						usr.absorbing=1
						usr<<"You prepare to absorb."
						usr.icon_state="Power"
						usr.overlays+='absorbtion.dmi'
					else
						usr<<"You failed the jutsu."