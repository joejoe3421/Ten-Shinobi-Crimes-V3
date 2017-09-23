mob
	var
		raitonknowledge=0
		tmp/raitonarmor=0
		tmp/rtornado=0
mob
	proc
		rincrease(number)
			if(src.raitonknowledge<5001)
				if(prob(5))
					src.raitonknowledge+=rand(1,number)
				else
					src.raitonknowledge+=0.5



mob
	teacher
		raitonteacher
			//human = 1
			density=1
			//NPC = 1
			name="Raiton Teacher"
			icon='Guy.dmi'
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='ThreadsH.dmi'
					var/Shirt='Shirt.dmi'
					Base+=rgb(100,35,0)
					Hair+=rgb(200,200,200)
					Shirt+=rgb(0,0,0)
					src.icon=Base
					src.overlays-='Boxers.dmi'
					src.overlays+='Boxers.dmi'
					src.overlays-='MaleEyes.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays-='Eyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+=Shirt
					src.overlays-='pants.dmi'
					src.overlays+='pants.dmi'
					src.overlays-='Cloths.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays-=Hair
					src.overlays+=Hair
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr.element=="Raiton"||usr.hasraiton)
					if(usr.raitonknowledge>=0)
						cl+="Raiton Ball"
					if(usr.raitonknowledge>=10)
						cl+="Raiton Current"
					if(usr.raitonknowledge>=60&&"Raiton Current" in usr.jutsus)
						cl+="Raiton Tornado"
					if(usr.raitonknowledge>=100&&"Raiton Current" in usr.jutsus)
						cl+="Raiton Armor"
					if(usr.raitonknowledge>=300&&usr.CC>=90&&"Raiton Armor" in usr.jutsus)
						cl+="Raiton Clone"
					if(usr.raitonknowledge>=120)
						cl+="Raiton Cutter"
					if(usr.raitonknowledge>=270)
						cl+="Raiton Dragon"
					if(usr.raitonknowledge>=500&&"Raiton Cutter" in usr.jutsus&&"Raiton Dragon" in usr.jutsus)
						cl+="Raiton Gian"
				oview(src)<<"[src] Says: You want something?"
				var/T = input("What to learn?","[src]") in list("Nothing") + cl
				if(T=="Nothing")
					return
				if(T in usr.jutsus)
					oview(src)<<"[src] Says: You already know this technique."
					return
				if(T=="Raiton Ball")
					usr.contents += new /obj/skill/raitonball
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Raiton Tornado")
					usr.contents += new /obj/skill/raitontornado
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Raiton Armor")
					usr.contents += new /obj/skill/raitonarmor
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Raiton Clone")
					usr.contents += new /obj/skill/raitonclone
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Raiton Current")
					usr.contents += new /obj/skill/raitoncurrent
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else
					oview(src)<<"[src] Says: Sorry, I cant teach you that at this time."

















obj
	skill
		raitonball
			verb
				raitonball()
					set category = "Skills"
					set name = "Raiton Ball"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal(50,0))
						spawn(1)
							usr.rincrease(1.5)
						var/obj/jutsu/raitonball/A=new()
						A.power=((usr.nin*1.2)+(usr.raitonknowledge*0.10))
						var/size=0
						if(usr.raitonknowledge>=150)
							size+=1
							A.icon_state="Raikyuu"
							A.power*=1.2
						if(usr.raitonknowledge>=350)
							size+=1
							A.icon_state="RaikyuuKai"
							A.power*=1.4
						A.level=size
						A.owner=usr;A.loc=usr.loc
						A.dir=usr.dir;walk(A,A.dir)
		raitoncurrent
			verb
				raitoncurr()
					set category = "Skills"
					set name = "Raiton-Current"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(150,0))
						spawn(1)
							usr.rincrease(2)
							src.levelgain(4,src.level)
						usr.Frozen=1
						usr.icon_state="Power"
						spawn(20)
							usr.Frozen=0
						var/size=src.level
						if(size<1)
							size=1
						if(size>=3)
							size=3
						for(var/turf/T in getcircle(usr,size))
							if(T.density==0)
								var/obj/jutsu/aftershock/A=new()
								A.power=((usr.nin*0.40)+(usr.raitonknowledge*0.05))
								A.owner=usr;A.loc=locate(T.x,T.y,T.z)
								if(A.loc==usr.loc)
									step_rand(A)
		raitontornado
			verb
				rtornado()
					set category = "Skills"
					set name = "Raiton-Tornado"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+250
					if(usr.handseal(300,5))
						spawn(1)
							usr.rincrease(1)
						usr.Frozen=1
						usr<<"You begin to spin!";usr.rtornado=1;usr.movedelay=usr.speed1
						usr.dir=NORTH;sleep(1);usr.dir=EAST;sleep(1);usr.dir=SOUTH;sleep(1);usr.dir=WEST;sleep(1);usr.dir=NORTH;sleep(1);usr.dir=EAST;sleep(1);usr.dir=SOUTH;sleep(1);usr.dir=WEST;sleep(1)
						usr.Frozen=0
						usr.overlays-='Garou.dmi';usr.overlays+='Garou.dmi'
						spawn(100)
							usr.rtornado=0;usr.overlays-='Garou.dmi';usr.movedelay=usr.savedspeed
		chidorinagashi
			verb
				raitoncurr()
					set category = "Skills"
					set name = "Chidori-Nagashi"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(150,0))
						spawn(1)
							usr.rincrease(1.5)
							src.levelgain(4,src.level)
						usr.Frozen=1
						usr.icon_state="Power"
						spawn(20)
							usr.Frozen=0
						var/size=src.level
						if(size<1)
							size=1
						if(size>=4)
							size=4
						for(var/turf/T in getcircle(usr,size))
							if(T.density==0)
								var/obj/jutsu/aftershock/A=new()
								A.power=((usr.nin*0.80)+(usr.raitonknowledge*0.08))
								A.owner=usr;A.loc=locate(T.x,T.y,T.z)
								if(A.loc==usr.loc)
									step_rand(A)
		raitonarmor
			verb
				rarmor()
					set category = "Skills"
					set name = "Raiton-Armor"
					if(usr.raitonarmor)
						usr<<"You release the raiton armor."
						usr.raitonarmor=0
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+450
					if(usr.handseal(100,5))
						spawn(1)
							usr.rincrease(1)
						if(usr.raitonarmor)
							usr<<"You release the raiton armor."
							usr.raitonarmor=0
						else
							usr<<"You generate your chakra around you to absorb some raiton techniques."
							usr.raitonarmor=1
							usr.overlays-='Icons/Jutsus/RaiArmor.dmi';usr.overlays+='Icons/Jutsus/RaiArmor.dmi'
							spawn(10)
								while(usr&&usr.raitonarmor>0)
									usr.chakra-=(usr.Mchakra*0.009)+30
									if(usr.chakra<=0)
										usr.raitonarmor=0
										usr<<"You ran out of chakra to keep your raiton armor active."
									sleep(rand(7,25))
								usr.raitonarmor=0
								usr.overlays-='Icons/Jutsus/RaiArmor.dmi';usr.overlays-='Icons/Jutsus/RaiArmor.dmi'








obj
	jutsu
		raitonball
			icon='Icons/Jutsus/RaitonTechniques.dmi'
			icon_state="Raikyuu1"
			density=1
			layer=MOB_LAYER+1
			movedelay=0.9
			New()
				..()
				spawn(30)
					del(src)
			Bump(A)
				..()
				if(ismob(A))
					var/mob/M = A
					var/mob/O = src.owner
					var/damage=src.power*0.7;M.nindamage(damage,0,O,"raiton")
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/))
					del(src)
			Del()
				var/mob/O = src.owner
				var/size=src.level
				if(size<1)
					size=1
				for(var/turf/T in getcircle(src,size))
					if(!T.density)
						var/obj/jutsu/aftershock/A=new();A.owner=O;A.power=(src.power*0.30);A.loc=T
				..()
		aftershock
			icon='Icons/Jutsus/RaitonTechniques.dmi'
			icon_state="Nagashi"
			density=0
			layer=MOB_LAYER+1
			New()
				..()
				spawn(rand(25,30))
					if(src)
						del(src)
				spawn(1)
					var/mob/O = src.owner
					while(src)
						spawn(1)
							for(var/mob/M in view(0,src))
								if(M.ko<=0)
									M.nindamage(src.power,0,O,"raiton")
									//M.stun+=1
						sleep(10)