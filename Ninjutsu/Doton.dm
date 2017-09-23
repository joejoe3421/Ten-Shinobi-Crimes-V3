

mob
	teacher
		dotonteacher
			//human = 1
			density=1
			//NPC = 1
			name="Doton Teacher"
			icon='Guy.dmi'
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='MadaraH.dmi'
					var/Shirt='Shirt.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(150,150,150)
					Shirt+=rgb(0,0,0)
					src.icon=Base
					src.overlays-='Boxers.dmi'
					src.overlays+='Boxers.dmi'
					src.overlays-='FemaleEyes.dmi'
					src.overlays+='FemaleEyes.dmi'
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
				if(usr.element=="Doton"||usr.hasdoton)
					if(usr.dotonknowledge>=0)
						cl+="Rock Throw"
					if(usr.dotonknowledge>=30)
						cl+="Rock Wall"
					if(usr.dotonknowledge>=80)
						cl+="Earth Prison"
				oview(src)<<"[src] Says: You here to learn something?"
				var/T = input("What to learn?","Doton") in list("Nothing") + cl
				if(T=="Nothing")
					return
				if(T in usr.jutsus)
					oview(src)<<"[src] Says: You already know this technique."
					return
				if(T=="Rock Throw")
					usr.contents += new /obj/skill/dotonrock
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Rock Wall")
					usr.contents += new /obj/skill/dotonwall
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Earth Prison")
					usr.contents += new /obj/skill/dotonbind
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else
					oview(src)<<"[src] Says: Sorry, I cant teach you that at this time."













mob
	var
		dotonknowledge=0
mob
	proc
		dincrease(number)
			if(src.dotonknowledge<5001)
				if(prob(7))
					src.dotonknowledge+=rand(1,number)
				else
					src.dotonknowledge+=0.5
obj
	skill
		dotonrock
			verb
				rockthrow()
					set category = "Skills"
					set name = "Rock Throw"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal(75,0))
						spawn(1)
							usr.dincrease(1)
							usr.alldamage(50,usr)
						var/obj/jutsu/smallrock/A=new()
						A.power=(usr.dotonknowledge*0.19)+(usr.tai*0.30);A.owner=usr
						if(usr.dotonknowledge>=200)
							A.icon_state="rock2"
							A.power*=2.2
						flick("beastman",usr)
						A.loc=usr.loc
						A.dir=usr.dir
						flick("Attack2",usr)
						walk(A,A.dir)

obj
	skill
		dotonwall
			verb
				rockwall()
					set category = "Skills"
					set name = "Earth Wall"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+220
					if(usr.handseal(150,3))
						spawn(1)
							usr.dincrease(1)
						var/mob/npc/dotonwall/A=new()
						A.health+=usr.dotonknowledge*2;A.owner=usr
						A.loc=usr.loc
						usr.Frozen=1
						flick("beastman",usr)
						A.dir=usr.dir
						sleep(1)
						step(A,usr.dir)
						A.Frozen=1
						usr.Frozen=0
		dotonbind
			verb
				earthb()
					set category = "Skills"
					set name = "Doton Binding"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+600
					if(usr.handseal(300,5))
						spawn(1)
							usr.dincrease(1)
						if(usr.target&&usr.target in view(usr))
							var/mob/M = usr.target
							usr<<"You cause earth to form around [M]!";var/obj/jutsu/rockprison/A=new();A.icon_state="bind";A.loc=M.loc;A.owner=usr;sleep(6);A.icon_state="DoBind"
						else
							usr<<"You need a target in your view!"

















mob
	npc
		dotonwall
			icon='Icons/Jutsus/DotonTechniques.dmi'
			icon_state="Wall"
			density=1
			//moving=1
			health=50
			opacity=1
			delonko=1
			layer=MOB_LAYER+1
			New()
				.=..()
				spawn()
					flick("Rise",src);sleep(1)
					spawn(5)
						src.icon_state="Wall"
						src.moving=1
						src.Frozen=0
				spawn(300)
					if(src)
						del(src)



obj
	jutsu
		smallrock
			icon='Icons/Jutsus/DotonTechniques.dmi'
			icon_state="rock"
			density=1
			layer=MOB_LAYER+1
			movedelay=1.8
			New()
				..()
				spawn(30)
					del(src)
			Bump(A)
				..()
				if(ismob(A))
					var/mob/M = A
					var/mob/O = src.owner
					var/damage=src.power*1.4;M.nindamage(damage*0.40,0,O);M.taidamage(damage*0.60,0,O)
					step_rand(M)
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/))
					del(src)
		rockprison
			icon='Icons/Jutsus/DotonTechniques.dmi'
			density=1
			icon_state = ""
			dir=NORTH
			layer = 5
			var/tmp/CapturePerson
			New()
				..()
				spawn(3)
					for(var/mob/M in src.loc)
						M<<"You've been binded by the earth!"
						src.CapturePerson=M
						M.bind+=1
						break
				spawn(120)
					del(src)
			Del()
				var/mob/M=src.CapturePerson
				if(M)
					M.bind-=1
					view(M)<<"[M] was free'd from the earth bind!."
				..()