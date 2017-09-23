
mob
	teacher
		fuutonteacher
			//human = 1
			density=1
			//NPC = 1
			name="Fuuton Teacher"
			icon='Guy.dmi'
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='SpikedPonytailH.dmi'
					var/Shirt='cvest.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(0,0,0)
					Shirt+=rgb(128,064,0)
					src.icon=Base
					src.overlays+='Boxers.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+='pants.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+='RockJounin.dmi'
					src.overlays+=Shirt
					src.overlays+='headband.dmi'
					src.overlays+=Hair
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr.element=="Fuuton"||usr.hasfuuton)
					if(usr.fuutonknowledge>=0)
						cl+="Wind Wave"
					if(usr.fuutonknowledge>=15)
						cl+="Wind Cutter"
					if(usr.fuutonknowledge>=50)
						cl+="Concentrated Wind"
					if(usr.fuutonknowledge>=75)
						cl+="Wind Raging Cutter"
				oview(src)<<"[src] Says: You here to learn something?"
				var/T = input("What to learn?","Fuuton") in list("Nothing") + cl
				if(T=="Nothing")
					return
				if(T=="Wind Wave")
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
					else
						usr.contents += new /obj/skill/fuuton1
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
				else if(T=="Wind Cutter")
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
					else
						usr.contents += new /obj/skill/fuuton2
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
				else if(T=="Concentrated Wind")
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
					else
						usr.contents += new /obj/skill/fuuton3
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
				else if(T=="Wind Raging Cutter")
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
					else
						usr.contents += new /obj/skill/fuuton4
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
				else
					oview(src)<<"[src] Says: Sorry, I cant teach you that at this time."





















mob
	var
		fuutonknowledge=0
mob
	proc
		fincrease(number)
			if(src.fuutonknowledge<5001)
				if(prob(15))
					src.fuutonknowledge+=rand(1,number)
				else
					src.fuutonknowledge+=0.5




obj
	skill
		fuuton1
			verb
				windwave()
					set category = "Skills"
					set name = "Wind Wave"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+100
					if(usr.handseal(125,0))
						spawn(1)
							usr.fincrease(1)
						var/obj/jutsu/wind1/A=new()
						if(src.level<1)
							A.power=((usr.nin*0.80)+(usr.fuutonknowledge*0.20))
						else
							A.power=((usr.nin*0.80)+(usr.fuutonknowledge*0.20))*2
						A.owner=usr;A.loc=usr.loc
						A.dir=usr.dir;walk(A,A.dir)
		fuuton2
			verb
				windcutter()
					set category = "Skills"
					set name = "Wind Cutter"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+250
					if(usr.handseal(125,3))
						spawn(1)
							usr.fincrease(1)
						var/obj/jutsu/wind2/A=new()
						A.power=((usr.nin*1.30)+(usr.fuutonknowledge*0.20))
						A.owner=usr;A.loc=usr.loc
						A.dir=usr.dir;walk(A,A.dir)
		fuuton3
			verb
				cwind()
					set category = "Skills"
					set name = "Concentrated Wind"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(300,4))
						spawn(1)
							usr.fincrease(1.3)
						var/obj/jutsu/wind3/A=new()
						A.power=((usr.nin*1.1)+(usr.fuutonknowledge*0.40))
						A.owner=usr;A.loc=usr.loc
						A.dir=usr.dir;walk(A,A.dir)
		fuuton4
			verb
				cwind()
					set category = "Skills"
					set name = "Wind Raging Cutter"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+450
					if(usr.handseal(450,7))
						spawn(1)
							usr.fincrease(1.3)
							src.levelgain(6,src.level,usr,"Wind Raging Cutter")
						var/number=src.level
						if(number<=1)
							number=1
						while(number>0)
							var/obj/jutsu/wind2/A=new()
							A.power=((usr.nin*1.1)+(usr.fuutonknowledge*0.40))
							A.owner=usr;A.loc=usr.loc
							A.dir=usr.dir;walk(A,A.dir)
							number-=1
							sleep(3)







obj
	jutsu
		wind1
			icon='Icons/Jutsus/FuutonTechniques.dmi'
			icon_state="Reppushou"
			density=1
			layer=MOB_LAYER+1
			movedelay=1.4
			New()
				..()
				spawn(60)
					del(src)
			Bump(A)
				..()
				if(ismob(A))
					var/mob/M = A
					var/mob/O = src.owner
					var/damage=src.power;M.nindamage(damage,0,O,"fuuton")
					src.loc=M.loc
					if(prob(65))
						M.stepback2(1,src.dir)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/))
					del(src)
		wind2
			icon='Icons/Jutsus/FuutonTechniques.dmi'
			icon_state="MultiVacuumSphere"
			density=1
			layer=MOB_LAYER+1
			movedelay=0.6
			New()
				..()
				spawn(60)
					del(src)
			Bump(A)
				..()
				if(ismob(A))
					var/mob/M = A
					var/mob/O = src.owner
					var/damage=src.power;M.nindamage(damage,1,O,"fuuton")
					src.loc=M.loc
					if(prob(23))
						M.stepback2(1,src.dir)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/))
					del(src)
		wind3
			icon='Icons/Jutsus/FuutonTechniques.dmi'
			icon_state="KazeDangan(Projectile)"
			density=1
			layer=MOB_LAYER+1
			movedelay=1.2
			New()
				..()
				spawn(60)
					del(src)
			Bump(A)
				..()
				if(ismob(A))
					var/mob/M = A
					var/mob/O = src.owner
					var/damage=src.power;M.nindamage(damage,1,O,"fuuton")
					src.density=0
					if(prob(90))
						M.stepback2(2,src.dir)
					del src
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/))
					del(src)