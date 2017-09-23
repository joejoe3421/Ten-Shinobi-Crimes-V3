mob
	var
		dancemastery=0
		bonemastery=0

mob
	teacher
		Kaguyateacher
			//human = 1
			density=1
			//NPC = 1
			name="Tsuko Kaguya"
			icon='Guy.dmi'
			clan="Kaguya"
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				.=..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='PainbodyH.dmi'
					var/Shirt='Shirt.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(200,200,200)
					Shirt+=rgb(0,0,0)
					src.icon=Base
					src.overlays+='Boxers.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+=Shirt
					src.overlays+='pants.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+='SoundJounin.dmi'
					src.overlays+=Hair
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr.clan==src.clan)
					if(usr.dancemastery>=0)
						cl+="Bone Bullets"
					if(usr.dancemastery>=0&&usr.CC>=40)
						cl+="Bone Membrane"
					if(usr.bonemastery>=10)
						cl+="Willow Dance"
					if(usr.dancemastery>=12&&"Willow Dance" in usr.jutsus)
						cl+="Willow: Swift"//slashes with bones 3 times in front
					if(usr.dancemastery>=40&&usr.bonemastery>=30&&"Willow Dance" in usr.jutsus)
						cl+="Camellia Dance"
					if(usr.dancemastery>=15&&usr.bonemastery>=40&&"Camellia Dance" in usr.jutsus)
						cl+="Larch Dance"
					if(usr.dancemastery>=16&&"Larch Dance" in usr.jutsus)
						cl+="Larch: Fire"//fires out ribcage bones all directions
					if(usr.dancemastery>=60&&usr.bonemastery>=80&&"Larch Dance" in usr.jutsus)
						cl+="Clematis Dance"
					if(usr.dancemastery>=60&&"Clematis Dance" in usr.jutsus)
						cl+="Clematis: Flower"
					if(usr.dancemastery>=100&&usr.bonemastery>=100&&usr.kills>=30)
						cl+="Bracken Dance"
				oview(src)<<"[src] Says: Not everyone knows how to dance, that is."
				sleep(3)
				if(usr.clan==src.clan)
					oview(src)<<"[src] Says: Oh, you're of the Kaguya Clan?"
					var/T = input("What to learn?","[src]") in list("Nothing") + cl
					if(T=="Nothing")
						return
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
						return
					if(T=="Bone Bullets")
						usr.contents += new /obj/skill/boneone
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else if(T=="Bone Membrane")
						usr.contents += new /obj/skill/bonetwo
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else if(T=="Tsuuga")
						usr.contents += new /obj/skill/tsuuga
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else
						oview(src)<<"[src] Says: That dance I can not yet teach."
























obj
	skill
		boneone
			verb
				bm()
					set category = "Skills"
					set name = "Bone Bullets"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+200
					if(usr.handseal(300,0))
						spawn(1)
							if(usr.bonemastery<100)
								if(prob(10))
									usr.bonemastery+=0.3
							if(usr.dancemastery<100)
								if(prob(6))
									usr.dancemastery+=0.5
							src.levelgain(1,src.level,usr,"Bone Bullets")
						var/obj/jutsu/bonebullets/A=new()
						if(src.level<1)
							A.power=usr.tai*1.2
						else
							A.power=usr.tai*1.8
						A.owner=usr;A.loc=usr.loc
						A.dir=usr.dir;walk(A,A.dir)
		bonetwo
			verb
				bo()
					set category = "Skills"
					set name = "Bone Harden"
					if(usr.boneharden)
						usr<<"You release the bone membrane."
						usr.boneharden=0
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(0,0))
						if(usr.boneharden)
							usr<<"You release the bone membrane."
							usr.boneharden=0
							return
						else
							spawn(1)
								if(usr.bonemastery<100)
									if(prob(10))
										usr.bonemastery+=0.7
							usr.boneharden=1
							usr<<"You form a layer of bone under your skin."
							spawn(10)
								while(usr&&usr.boneharden>0)
									usr.chakra-=(usr.Mchakra*0.025)+50
									if(usr.chakra<=0)
										usr.boneharden=0
										usr<<"You ran out of chakra to keep your bone armor active."
									sleep(rand(7,25))
								usr.boneharden=0




obj
	jutsu
		bonebullets
			icon='Icons/Jutsus/KaguyaTechniques.dmi'
			icon_state = "Bullets"
			density=1
			movedelay=0.5
			New()
				..()
				spawn(45)
					del(src)
			Bump(A)
				..()
				if(ismob(A))
					var/mob/M=A
					var/mob/O=src.owner
					M.weapondamage(src.power,1,O)
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/))
					del(src)