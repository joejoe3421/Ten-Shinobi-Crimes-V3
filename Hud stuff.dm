obj/hud
	layer=MOB_LAYER+6
	icon='hud.dmi'
	health
		name="Health"
		icon_state=""
		screen_loc="1,13"
		//M.client.screen+=src
	chakra
		name="Chakra"
		icon_state=""
		screen_loc="3,13"
		//src.client.screen+=src
	struggle
		name="Struggle Meter"
		icon_state=""
		screen_loc="5,13"
		//src.client.screen+=src
obj/hud2
	layer=MOB_LAYER+5
	icon='hud2.dmi'
	say
		layer=MOB_LAYER+5
		name="Say"
		icon_state="say"
		screen_loc="2,1"
		//M.client.screen+=src
		Click()
			var/howto=input("How do you want to say?") as text
			usr.Say(howto)
	ooc
		layer=MOB_LAYER+5
		name="OOC"
		icon_state="ooc"
		screen_loc="1,1"
		Click()
			var/howto=input("How do you want to say?") as text
			usr.OOC(howto)
	whisper
		layer=MOB_LAYER+5
		name="Whisper"
		icon_state="whisper"
		screen_loc="3,1"
		Click()
			var/ty=list()
			for(var/mob/Y in world)
				if(Y.client)
					ty+=Y
			var/mob/M = input("Who do you want to whisper?","Whisper") in ty + list("Cancel")
			if(M=="Cancel")
				return
			var/howto=input("What do you want to say to [M]?") as text
			usr.Whisper(M, howto)


mob/proc
	HudRefresh()
		for(var/obj/hud/H in src.client.screen)
			if(istype(H,/obj/hud/health))
				if(src.health>=src.Mhealth)
					H.icon_state="hpfull"
				else if(src.health>=round((src.Mhealth*9)/10))
					H.icon_state="hp10"
				else if(src.health>=round((src.Mhealth*8)/10))
					H.icon_state="hp9"
				else if(src.health>=round((src.Mhealth*7)/10))
					H.icon_state="hp8"
				else if(src.health>=round((src.Mhealth*6)/10))
					H.icon_state="hp7"
				else if(src.health>=round((src.Mhealth*5)/10))
					H.icon_state="hp6"
				else if(src.health>=round((src.Mhealth*4)/10))
					H.icon_state="hp5"
				else if(src.health>=round((src.Mhealth*3)/10))
					H.icon_state="hp4"
				else if(src.health>=round((src.Mhealth*2)/10))
					H.icon_state="hp3"
				else if(src.health>=round((src.Mhealth*1)/10))
					H.icon_state="hp2"
				else
					H.icon_state="hp1"
				//H.layer=9999999999999999999999999999999999999999999999999999999999999
			if(istype(H,/obj/hud/chakra))
				if(src.chakra>=src.Mchakra)
					H.icon_state="chafull"
				else if(src.chakra>=round((src.Mchakra*9)/10))
					H.icon_state="cha10"
				else if(src.chakra>=round((src.Mchakra*8)/10))
					H.icon_state="cha9"
				else if(src.chakra>=round((src.Mchakra*7)/10))
					H.icon_state="cha8"
				else if(src.chakra>=round((src.Mchakra*6)/10))
					H.icon_state="cha7"
				else if(src.chakra>=round((src.Mchakra*5)/10))
					H.icon_state="cha6"
				else if(src.chakra>=round((src.Mchakra*4)/10))
					H.icon_state="cha5"
				else if(src.chakra>=round((src.Mchakra*3)/10))
					H.icon_state="cha4"
				else if(src.chakra>=round((src.Mchakra*2)/10))
					H.icon_state="cha3"
				else if(src.chakra>=round((src.Mchakra*1)/10))
					H.icon_state="cha2"
				else
					H.icon_state="cha1"
				//H.layer=9999999999999999999999999999999999999999999999999999999999999
			if(istype(H,/obj/hud/struggle))
				if(src.ko>=2)
					if(src.struggle>=src.koamm)
						H.icon_state="100"
					else if(src.struggle>=round((src.koamm*9)/10))
						H.icon_state="90"
					else if(src.struggle>=round((src.koamm*8)/10))
						H.icon_state="80"
					else if(src.struggle>=round((src.koamm*7)/10))
						H.icon_state="70"
					else if(src.struggle>=round((src.koamm*6)/10))
						H.icon_state="60"
					else if(src.struggle>=round((src.koamm*5)/10))
						H.icon_state="50"
					else if(src.struggle>=round((src.koamm*4)/10))
						H.icon_state="40"
					else if(src.struggle>=round((src.koamm*3)/10))
						H.icon_state="30"
					else if(src.struggle>=round((src.koamm*2)/10))
						H.icon_state="20"
					else if(src.struggle>=round((src.koamm*1)/10))
						H.icon_state="10"
					else
						H.icon_state="nostruggle"
				else
					H.icon_state="nostruggle"