mob
	var
		tmp/hbolder=0
		sizemastery=0




mob
	teacher
		Akimichiteacher
			//human = 1
			density=1
			//NPC = 1
			name="Cho Akimichi"
			icon='Guy.dmi'
			clan="Akimichi"
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				.=..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='MadaraH.dmi'
					var/Shirt='Shirt.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(150,0,0)
					Shirt+=rgb(0,0,0)
					src.icon=Base
					src.overlays-='Boxers.dmi'
					src.overlays+='Boxers.dmi'
					src.overlays-='FemaleEyes.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays-='Eyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+=Shirt
					src.overlays-='pants.dmi'
					src.overlays+='pants.dmi'
					src.overlays-='Cloths.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+='LeafJounin.dmi'
					src.overlays-=Hair
					src.overlays+=Hair
					src.overlays-='headband.dmi'
					src.overlays+='headband.dmi'
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr.clan==src.clan)
					if(usr.sizemastery>=0)
						cl+="Human Bolder"
					if(usr.sizemastery>=10)
						cl+="Partcial Expansion"
					if(usr.sizemastery>=25)
						cl+="Spikey Human Bolder"
					if(usr.sizemastery>=50)
						cl+="Giant Expasion"
					if(usr.sizemastery>=75&&"Giant Expansion" in usr.jutsus)
						cl+="Giant Human Bolder"
				oview(src)<<"[src] Says: Hm, I'm hungry."
				sleep(3)
				if(usr.clan==src.clan)
					oview(src)<<"[src] Says: Ah, I see you're an Akimichi aswell! Well what would you like to learn?"
					var/T = input("What to learn?","[src]") in list("Nothing") + cl
					if(T=="Nothing")
						return
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
						return
					if(T=="Human Bolder")
						usr.contents += new /obj/skill/hbolder
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else if(T=="Spikey Human Bolder")
						usr.contents += new /obj/skill/hbolder2
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else
						oview(src)<<"[src] Says: Sorry I'm too hungry to teach that jutsu right now."















obj
	skill
		hbolder
			verb
				bm()
					set category = "Skills"
					set name = "Human Bolder"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(usr.Mchakra*0.05,2))
						spawn(1)
							if(usr.sizemastery<100)
								if(prob(40))
									usr.sizemastery+=0.5
						usr.stomachamm-=10
						usr.hbolder=1
						usr.overlays-='Icons/Jutsus/AkimichiTechniques.dmi';usr.overlays+='Icons/Jutsus/AkimichiTechniques.dmi'
						usr.movedelay=usr.speed1
						sleep(150)
						usr.hbolder=0
						usr.overlays-='Icons/Jutsus/AkimichiTechniques.dmi';usr.overlays-='Icons/Jutsus/AkimichiTechniques.dmi'
						usr.movedelay=usr.savedspeed


		hbolder2
			verb
				bm()
					set category = "Skills"
					set name = "Spiky-Human Bolder"
					if(usr.hbolder==0||usr.hbolder>1)
						usr<<"You need to be in human bolder form first."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+700
					if(usr.handseal(usr.Mchakra*0.02,0))
						spawn(1)
							if(usr.sizemastery<100)
								if(prob(80))
									usr.sizemastery+=0.2
						usr.stomachamm-=15
						usr.hbolder=2
						usr<<"You enter spiky human bolder mode."