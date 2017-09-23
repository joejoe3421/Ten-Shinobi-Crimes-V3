mob
	var
		beastmastery=0





mob
	teacher
		Inuzukateacher
			//human = 1
			density=1
			//NPC = 1
			name="Drago Inuzuka"
			icon='Guy.dmi'
			clan="Inuzuka"
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				.=..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='SpikeyH.dmi'
					var/Shirt='Shirt.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(0,0,0)
					Shirt+=rgb(0,0,0)
					src.icon=Base
					src.overlays+='Boxers.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+='pants.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+='LeafJounin.dmi'
					src.overlays+=Shirt
					src.overlays+=Hair
					src.overlays+='headband.dmi'
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr.clan==src.clan)
					if(usr)
						cl+="Beast Mode"
					if(usr.beastmastery>=10&&usr.CC>=40&&"Beast Mode" in usr.jutsus)
						cl+="Man Beast Claws"
					if(usr.beastmastery>=15&&usr.attackdelay<3.8&&"Beast Mode" in usr.jutsus)
						cl+="Tsuuga"
					if(usr.beastmastery>=30&&usr.ninknowledge>=50)
						cl+="Man Beast Clone"
					if(usr.beastmastery>=50&&"Man Beast Clone" in usr.jutsus)
						cl+="Gatsuuga"
					if(usr.beastmastery>=75&&usr.ninknowledge>=150&&"Man Beast Clone" in usr.jutsus)
						cl+="Giant Wolf"
					if(usr.beastmastery>=100&&"Giant Wolf" in usr.jutsus)
						cl+="Wolf Gatsuuga"
				oview(src)<<"[src] Says: Hm I smell something.."
				sleep(3)
				if(usr.clan==src.clan)
					oview(src)<<"[src] Says: Ah, you bare the sent of a Inuzuka! Well what would you like to learn?"
					var/T = input("What to learn?","[src]") in list("Nothing") + cl
					if(T=="Nothing")
						return
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
						return
					if(T=="Beast Mode")
						usr.contents += new /obj/skill/beastman
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else if(T=="Man Beast Claws")
						usr.contents += new /obj/skill/beastclaws
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
					else if(T=="Tsuuga")
						usr.contents += new /obj/skill/tsuuga
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else
						oview(src)<<"[src] Says: Hmmm.... i've recived word not to teach anyone that for the time being."





























mob
	var
		tmp
			shika=0
			intsu=0
			manbeastclaws=0

obj
	inutrail
		icon='Icons/Jutsus/Tsuuga.dmi'
		icon_state="mid"
		density=0
		layer=MOB_LAYER+1
		New()
			..()
			spawn(20)
				if(src)
					del src
		Del()
			src.icon_state="back"
			sleep(2)
			..()






obj
	skill
		beastman
			verb
				bm()
					set category = "Skills"
					set name = "Beast Mode"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+100
					if(usr.handseal(0,0))
						if(usr.shika)
							usr<<"You turn back to normal!"
							usr.shika=0
							usr.icon_state=""
							//src.Move_Delay=usr.Savedspeed
							return
						else
							usr.shika=1
							usr.icon_state="beastman"
							usr<<"Your senses are improved!"
							spawn(1)
								if(usr.beastmastery<100)
									while(usr&&usr.shika>=1)
										if(prob(1))
											usr.beastmastery+=pick(0.1,0.2,0.3,0.2)
										if(usr.beastmastery>=100)
											usr.beastmastery=100
											return
										sleep(rand(5,9))
		beastclaws
			verb
				bcs()
					set category = "Skills"
					set name = "Man Beast Claws"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(0,0))
						if(usr.manbeastclaws)
							usr.manbeastclaws=0
							usr<<"You release the chakra in your hands forming claws."
						else
							usr.icon_state="handseal";usr<<"You generate chakra to your hands, growing out your claws!"
							sleep(30);usr.icon_state=""
							usr.manbeastclaws=1
							while(usr.manbeastclaws)
								usr.chakra-=15
								sleep(10)
		tsuuga
			verb
				ts()
					set category = "Skills"
					set name = "Tsuuga"
					if(usr.shika==0)
						usr<<"You need to be in beast mode."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+450
					if(usr.handseal(300,0))
						usr.intsu=1
						usr.overlays-='Icons/Jutsus/Tsuuga.dmi'
						usr.overlays+='Icons/Jutsus/Tsuuga.dmi'
						usr.movedelay=usr.speed1
						sleep(150)
						usr.intsu=0
						usr.overlays-='Icons/Jutsus/Tsuuga.dmi'
						usr.movedelay=usr.savedspeed


