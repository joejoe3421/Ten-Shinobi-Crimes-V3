mob
	var
		rinnepoten=0//rinnegan potential
		rinnegan=0
		rinneganu=0
		tmp/rinnegangen=0
		deva=0
		preta=0
		naraka=0
		animalp=0
		humanp=0
		asura=0
		Oicon








mob
	proc
		rinnehit()
			if(src.rinnegangen==0)
				src.rinnegangen=1
				spawn(22)
					src.rinnegangen=0
				src.sight |= BLIND
				src.sight |= (SEE_SELF)
				var/image/I=image('Rinnegan.dmi',src)
				src<<I
				src.stun+=rand(1,2)
				sleep(18)
				//src.Frozen=0
				del I
				src.sight&=~(SEE_SELF|BLIND)
				//src.rinnegangen=0









mob
	proc
		rinneactivate()
			if(src.rinnegan)
				return
			src<<"You collapse under a powerful pressence."
			src.AwardMedal("Rinnegan!")
			src.sight |= BLIND
			src.sight |= (SEE_SELF)
			src.icon_state="dead"
			var/image/I=image('Rinnegan.dmi',src,"rinnegan")
			src<<I
			spawn(50)
				del I
			src.Frozen=1
			sleep(100)
			if(src.clan=="Uchiha")
				src.deva=1
				src.preta=1
				src.animalp=1
				src.humanp=1
				src.naraka=1
			else
				var/pathnow=pick("Deva","Human","Naraka","Asura","Animal","Preta")
				src<<"You gained the [pathnow] path's abilitys."
				if(pathnow=="Deva")
					src.deva=1
				if(pathnow=="Preta")
					src.preta=1
				if(pathnow=="Asura")
					src.asura=1
				if(pathnow=="Naraka")
					src.naraka=1
				if(pathnow=="Animal")
					src.animalp=1
				if(pathnow=="Human")
					src.humanp=1
			//src.dying=0
			src.contents += new /obj/skill/chakrarod
			src.jutsus+="chakrarod"
			if(src.deva)
				src.contents += new /obj/skill/push
				src.jutsus+="push"
				src.jutsus+="pull"
			if(src.naraka)
				src.contents += new /obj/skill/naraka
				src.jutsus+="judgement"
			if(src.preta)
				src.contents += new /obj/skill/absorb
				src.jutsus+="absorb"
			if(src.animalp)
				src.contents += new /obj/skill/summon
				src.jutsus+="summon"
			if(src.humanp)
				src.contents += new /obj/skill/soulstrike
				src.jutsus+="soul strike"
			if(src.asura)
				src.contents += new /obj/skill/asura
				src.jutsus+="missle"
			src.health=src.Mhealth
			src.Mchakra+=rand(700,1200)
			//src.deathtimer=0
			src.icon_state=""
			//src.Frozen = 0
			//src.ko = 0
			src.icon_state=""
			view(src,6)<<"You notice a difference in [src]'s eyes!"
			//src.overlays+='Rinnegano.dmi'
			src.Oicon=usr.icon
			//src.icon = 'rinnegan eyes.dmi'
			src.haskaton=1
			src.hassuiton=1
			src.hasdoton=1
			src.hasraiton=1
			src.hasfuuton=1
			///--------------------------------------------either pick path or have one randomly choosen
			src.rinnegan=1
			//usr.verbs+= /mob/rinnegan/verb/SummonPaths
			spawn(20)
				//src.overlays-='Rinnegano.dmi'
				src.ko=0
				src.Frozen = 0
				src.sight&=~(SEE_SELF|BLIND)














mob
	var
		weaponoverlays
		weapon=""






obj
	skill
		chakrarod//this is the line the must only contain one verb after it untill the next jutsu
			verb
				userod()
					set category = "Skills"
					set name = "Chakra Receiver"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+20
					if(usr.handseal(20,0))
						if(usr.weapon!="")
							usr.weapon=""
							usr.overlays-=usr.weaponoverlays
							usr.overlays-=usr.weaponoverlays
							usr.overlays-=usr.weaponoverlays
							usr<<"You remove your weapon."
							usr.weaponoverlays=null
						else
							usr.overlays+='NA.dmi'
							usr.weaponoverlays+='NA.dmi'
							usr.weapon="Chakra Rod"
							usr<<"You create a chakra rod from your hand."





obj
	skill
		chakrarod2//this is the line the must only contain one verb after it untill the next jutsu
			verb
				throwrod()
					set category = "Skills"
					set name = "Throw Chakra Receiver"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(50,3))
						usr<<"Not yet implimented."

















/*mob/NPC/Boss
	name="Boss(NPC)"
	icon='Guy.dmi'
	icon_state=""
	village="Missing"
	//rank="Missing-Nin"

mob/proc/SummonAsuraRealm()
	if(src.knockedout)
		return
	else
		if(src.AsuraRealmSummoned)
			for(var/mob/NPC/Boss/C in world)
				if(C.AsuraRealmSummoned)
					//var/obj/SmokeCloud/S=new()
					//S.loc=locate(C.x,C.y,C.z)
					//del(C)
					src.AsuraRealmSummoned=0
					return
		src.icon_state="handseal"
		var/mob/NPC/Boss/A=new()
		A.name=src.name
		A.owner=src
		//A.Pedestrian=0
		//A.NeedsFace=0
		//A.part1p=1
		//A.tempmix3=1
		A.icon=null
		A.overlays=null
		sleep(1)
		A.icon=src.icon
		A.overlays=src.overlays
		//A.overlays+='kakashi mask.dmi'
		//A.overlays-=src.hair
		A.chakra=10000
		//var/icon/C='KakashiH.dmi'
		//C+=rgb(src.rhair,src.ghair,src.bhair)
		A.overlays+=C
		sleep(10)
		//var/obj/SmokeCloud/S=new()
		S.loc=locate(src.x,src.y,src.z)
		A.loc=src.loc
		A.AsuraRealmSummoned=1
		if(src.target)
			A.target=src.target
		while(A)
			src.AsuraRealmSummoned=1
			sleep(100)*/
/*
mob
	var
		list/Paths[6]
		PathNum
		owner=""
		tmp
			InPath = 0
			InCont = 0
			amControlling = 0
			whoIControl = 0
mob/rinnegan
	verb
		ControlPath()
			set name = "Path Control"
			set category = "Doujutsu"
			var/PathList = list()
			for(var/mob/npc/PathBody/C in usr.Paths)
				if(C.loc != usr)
					PathList += C
			var/mob/M = input("Which Path Would You Like To Control?","Six Paths") in PathList + list("None")
			if(M=="None")
				src.verbs -= typesof(/mob/paths/verb)
				src.verbs -= typesof(/mob/deva/verb)
				src.verbs -= typesof(/mob/preta/verb)
				src.verbs -= typesof(/mob/naraka/verb)
				src.verbs -= typesof(/mob/animal/verb)
				src.verbs -= typesof(/mob/human/verb)
				src.verbs -= typesof(/mob/asura/verb)
				usr.InPath = 0
				usr.client.perspective = EYE_PERSPECTIVE
				usr.client.eye = usr
				usr.amControlling = 0
				usr.whoIControl = 0
				for(var/mob/npc/PathBody/C in usr.Paths)
					C.InCont = 0
			else
				usr.InPath = 1
				M.InCont = 1
				usr.amControlling = 1
				usr.whoIControl = M
				M.owner = usr
				usr.client.perspective = EYE_PERSPECTIVE
				usr.client.eye = M
				//usr.verbs += typesof(/mob/Nagato/PathsAttacks/verb)
				usr.verbs += typesof(/mob/paths/verb)
				if(M.deva)
					usr.verbs += typesof(/mob/deva/verb)
					//usr.verbs += typesof(/mob/Nagato/Deva/verb)
				if(M.preta)
					usr.verbs += typesof(/mob/preta/verb)
				if(M.naraka)
					src.verbs += typesof(/mob/naraka/verb)
				if(M.humanp)
					src.verbs += typesof(/mob/human/verb)
				if(M.animalp)
					src.verbs += typesof(/mob/animal/verb)
				if(M.asura)
					src.verbs += typesof(/mob/asura/verb)
					//usr.verbs -= typesof(/mob/Nagato/Deva/verb)
			//		usr.verbs -= typesof(/mob/Nagato/Naraka/verb)
				for(var/mob/npc/PathBody/C in usr.Paths)
					if(C!=M)
						C.InCont = 0
		Pathjutsu()
			set name = "Path Jutsu"
			set category = "Doujutsu"
			usr.verbs += typesof(/mob/paths/verb)
			usr.verbs += typesof(/mob/deva/verb)
			usr.verbs += typesof(/mob/preta/verb)
			src.verbs += typesof(/mob/naraka/verb)
			src.verbs += typesof(/mob/animal/verb)
			src.verbs += typesof(/mob/human/verb)
			src.verbs += typesof(/mob/asura/verb)
			src<<"Use this jutsu if your paths are far away and you need them to have their jutsu."
			src<<"In order for this to work you must not be in control of any path before you use this."
		DestroyPath()
			set name = "Path Destroy"
			set category = "Doujutsu"
			var/PathList = list()
			for(var/C in usr.Paths)
				PathList += C
			var/mob/T = input("Which Path Would You Like To Destroy?","Six Paths") in PathList + list("Cancel")
			if(T=="Cancel")
				return
			else
				switch(alert("Are You Sure?",,"Yes","No"))
					if("Yes")
						usr.Paths[T.PathNum] = null
						del T
		SummonPath()
			set name = "Path Summon"
			set category = "Doujutsu"
			var/PathList = list()
			for(var/C in usr.Paths)
				PathList += C
			var/mob/T = input("Which Path Would You Like To Summon?","Six Paths") in PathList + list("Cancel")
			if(T=="Cancel")
				return
			else
				T.loc = usr.loc
				usr.chakra-=150
		UnSummonPath()
			set name = "Store Path"
			set category = "Doujutsu"
			var/PathList = list()
			for(var/mob/npc/PathBody/C in world)
				if(C.owner==usr)
					PathList += C
			var/mob/M = input("Which Path Would You Like To Unsummon?","Six Paths") in PathList + list("Cancel")
			if(M=="Cancel")
				return
			else
				usr.amControlling = 0
				usr.whoIControl = 0
				M.loc = usr
				usr.Paths[M.PathNum]=M
				usr.InPath = 0
				usr.client.perspective = EYE_PERSPECTIVE
				usr.client.eye = usr
				M.InCont = 0
		CreatePath()
			set name = "Path Create"
			set category = "Doujutsu"
			var/PathList = list()
			for(var/C in usr.Paths)
				PathList += C
			var/T = input("Paths Available","Six Paths") in list("New") + PathList + list("Cancel")
			if(T=="New")
				usr.chakra-=200
				switch(input("Create A New Path")in list("Deva","Naraka","Preta","Animal","Human","Asura"))
					if("Deva")
						if(!usr.Paths[1])
							var/mob/npc/PathBody/M = new(locate(usr.x,usr.y-1,usr.z))
							var/obj/smoke/K=new();K.loc=usr.loc
							M.name = "Deva Path [usr.name]"
							M.deva=1
							M.PathNum = 1
							M.NewPath(usr)
					if("Naraka")
						if(!usr.Paths[2])
							var/mob/npc/PathBody/M = new(locate(usr.x,usr.y-1,usr.z))
							var/obj/smoke/K=new();K.loc=usr.loc
							M.name = "Naraka Path [usr.name]"
							M.naraka=1
							M.PathNum = 2
							M.NewPath(usr)
					if("Preta")
						if(!usr.Paths[3])
							var/mob/npc/PathBody/M = new(locate(usr.x,usr.y-1,usr.z))
							var/obj/smoke/K=new();K.loc=usr.loc
							M.name = "Preta Path [usr.name]"
							M.preta=1
							M.PathNum = 3
							M.NewPath(usr)
					if("Animal")
						if(!usr.Paths[4])
							var/mob/npc/PathBody/M = new(locate(usr.x,usr.y-1,usr.z))
							var/obj/smoke/K=new();K.loc=usr.loc
							M.name = "Animal Path [usr.name]"
							M.animalp=1
							M.PathNum = 4
							M.NewPath(usr)
					if("Human")
						if(!usr.Paths[5])
							var/mob/npc/PathBody/M = new(locate(usr.x,usr.y-1,usr.z))
							var/obj/smoke/K=new();K.loc=usr.loc
							M.name = "Human Path [usr.name]"
							M.humanp=1
							M.PathNum = 5
							M.NewPath(usr)
					if("Asura")
						if(!usr.Paths[6])
							var/mob/npc/PathBody/M = new(locate(usr.x,usr.y-1,usr.z))
							var/obj/smoke/K=new();K.loc=M.loc
							M.name = "Asura Path [usr.name]"
							M.asura=1
							M.PathNum = 6
							M.NewPath(usr)
mob/paths
	verb
		PathAttack()
			set category = "Skills"
			set name = "Path Attack"
			for(var/mob/npc/PathBody/P in world)
				if(P.owner==usr && P.InCont)
					for(var/mob/M in get_step(P,P.dir))
						if(P.combo>=P.combolimit)
							P<<"combo limit"
							return
						if(P.combo==0)
							P<<"Combo start"
							spawn(1.5)
								P<<"Counter began"
								while(P.combo)
									var/combonumber=P.combo
									sleep(5)
									if(P.combo==combonumber)
										P<<"combonumber = [combonumber], combo = [P.combo]"
										P.combo=0
										P<<"Counter reset"
						P.combo+=1
						P.canattack=0
						spawn(P.attackdelay)
							P.canattack=1
							if(P.attackdelay>2)
								if(prob(3))
									P.attackdelay-=0.01
						P<<"Combo +1([P.combo])"
						if(P.combo==1)
							flick("punchr",P)
						if(P.combo==2)
							flick("punchl",P)
						if(P.combo==3)
							flick("kick",P)
						if(prob(40))
							spawn() P.voice("a")
						for(var/mob/M in get_step(P,P.dir))
							M.dir=get_dir(P,M)
							M.damage(P.tai,0)
							break



mob/human
	verb
		soulsteal()
			set name="Human Soul Steal"
			set category="Paths"
			for(var/mob/npc/PathBody/P in world)
				if(P.PathNum==5 && P.owner==usr&&P.InCont)
					for(var/mob/M in get_step(P,P.dir))
						var/time = rand(150,200)
						M<<"Something feels wrong, move!"
						P.owner<<"You begin to pull out [M]'s Soul, don't move [P] for [time/10] seconds."
						sleep(time)
						if(M in get_step(P,P.dir))
							M.wounds = 200
							M.health = -3000
							spawn(2)
								M.Death(P.owner)
							M<<"You feel your essence slip away as you fade into the darkness."
							P.owner<<"[P] has finished taking [M]'s soul."
							spawn(1)
								P.owner<<"[M] is of the [M.clan] Clan"
								P.owner<<"[M] belongs to [M.village] Village"
								P.owner<<"[M] has [M.health]/[M.Mhealth] Health"
								P.owner<<"[M] has [M.chakra]/[M.Mchakra] Chakra"
								P.owner<<"[M] has [M.Mtai] Max Strength"
								P.owner<<"[M] has [M.Mnin] Max Power"
								P.owner<<"[M] has [M.Mgen] Max Illusion"
								P.owner<<"[M] has [M.exp] exp and needs [M.Mexp] to get a skill point."
								P.owner<<"[M] is [M.age] years old([M] will age in [agetimer] Seconds)"
								P.owner<<"[M] has [M.statp] Skill Points."





mob/naraka
	verb
		koh(mob/H in view(6))
			set category = "Paths"
			set name = "Naraka King of Hell Heal"
			for(var/mob/npc/PathBody/M in world)
				if(M.PathNum==2 && M.owner==usr&&M.InCont)
					usr.chakra-=1000
					var/obj/s/soul/K = new()
					K.loc = M.loc
					K.target=H
					spawn(1)
						while(K)
							step_to(K,H)
							sleep(1)
		koh2()
			set category = "Paths"
			set name = "Naraka King of Hell Area Heal"
			for(var/mob/npc/PathBody/M in world)
				if(M.PathNum==2 && M.owner==usr&&M.InCont)
					usr.chakra-=3000
					for(var/mob/H in view(M))
						spawn(1)
							var/obj/s/soul/K = new()
							K.loc = M.loc
							K.target=H
							spawn(1)
								while(K)
									step_to(K,H)
									sleep(1)
		koh1()
			set name="Naraka King of Hell"
			set category="Paths"
			//set background = 1
			for(var/mob/npc/PathBody/M in world)
				if(M.PathNum==2 && M.owner==usr&&M.InCont)
					for(var/mob/P in get_step(M,M.dir))
						P.Frozen=1
						M.loc= locate(P.x,P.y+1,P.z)
						M.dir = SOUTH
						view(M)<<"[M]: Know pain!"
						M.owner<<"If you move [M] [P] will be released."
						M.icon_state="punch"
						if(M.chakra<10)
							P.Frozen=0
							M.owner<<"[P] is free'd."
							M.icon_state=""
						while(!P.ko&&P.Frozen&&P in get_step(M,M.dir))
							M.chakra-=rand(60,200)
							if(M.chakra<10)
								P.Frozen=0
								M.owner<<"[P] is free'd."
								M.icon_state=""
							P.health-=M.gen/2
							P.chakra-=M.gen/3
							P.wounds+=rand(0.1,1)
							P.Death(M.owner)
							sleep(10)
						P.Frozen = 0
						M.owner<<"[P] escaped your grasp!?"



mob/asura
	verb
		missle()
			set category = "Paths"
			set name = "Asura Missle Lunch"
			for(var/mob/npc/PathBody/M in world)
				if(M.PathNum==6 && M.owner==usr&&M.InCont)
					view(M)<<"[M] opens up his catridges and lets out a missile!"
					usr.chakra-=3000
					var/obj/skill/missle1/A=new()
					A.owner=M.owner;A.loc=M.loc
					A.dir=M.dir;walk(A,A.dir)
		missle2()
			set category = "Paths"
			set name = "Asura Missles"
			for(var/mob/npc/PathBody/M in world)
				if(M.PathNum==6 && M.owner==usr&&M.InCont)
					view(M)<<"[M] opens up his catridges and lets out Missiles!"
					usr.chakra-=1500
					M.firing=1
					spawn(50)
						M.firing=0
					while(M.firing)
						var/obj/skill/missle1/A=new()
						A.owner=M.owner;A.loc=M.loc
						A.dir=M.dir;walk(A,A.dir)
						sleep(10)
		rocket()
			set category = "Paths"
			set name = "Asura Rocket Fist"
			for(var/mob/npc/PathBody/M in world)
				if(M.PathNum==6 && M.owner==usr&&M.InCont)
					view(M)<<"[M] aims their fist then fires it out!"
					usr.chakra-=5000
					var/obj/skill/missle2/A=new()
					A.owner=M.owner;A.loc=M.loc
					A.dir=M.dir;walk(A,A.dir)




mob/proc/AsuraRealmMissle()
	src.icon_state="power"
	view(src)<<"[src] opens up his catridges and lets out Missiles!"
	var/X=1
	spawn(50)
		X=0
		src.icon_state=""
	while(X)
		var/obj/skill/missle1/A=new()
		A.owner=src;A.loc=src.loc
		A.dir=src.dir;walk(A,A.dir)
		if(src.target)
			walk_towards(A,src.target)
		sleep(10)

obj/skill
	missle1
		icon='missles.dmi'
		icon_state="Missile"
		density=1
		New()
			spawn(25)
				del(src)
		Bump(A)
			if(ismob(A))
				//var/mob/M = A
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
		Del()
			var/obj/Explosion/K=new()
			K.loc=src.loc
			K.owner=src.owner
			..()



obj/skill
	missle2
		icon='missles.dmi'
		icon_state="RocketPunch"
		density=1
		New()
			spawn(25)
				del(src)
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O=src.owner
				M.health-=M.Mhealth*0.15
				M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
		Del()
			var/obj/Explosion/K=new()
			K.loc=src.loc
			K.owner=src.owner
			..()




obj
	Explosion
		icon='Explosion(1).dmi'
		icon_state="ExplodeMiddle"
		//JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		New()
			..()
			overlays+=/obj/Explosion/A
			overlays+=/obj/Explosion/B
			overlays+=/obj/Explosion/C
			overlays+=/obj/Explosion/D
			overlays+=/obj/Explosion/E
			overlays+=/obj/Explosion/F
			overlays+=/obj/Explosion/G
			overlays+=/obj/Explosion/H
			spawn()
				sleep(1)
				spawn(1)
					var/z=rand(2,5)
					while(z>0)
						var/obj/s=new/obj/Ashes2
						s.loc=src.loc
						z--
						sleep(1)
				for(var/mob/M in oview(1,src))
					spawn()
						if(M)
							var/damage=M.Mhealth*0.12
							view(M)<<"<font color=red>[M] has been hit by the explosion!</font>"
							M.health -= damage
							M.Death(M)

			spawn(5)
				del(src)
		A
			icon_state="ExplodeTopLeft"
			pixel_x = -32
			pixel_y = 32
			layer=MOB_LAYER+1
		B
			icon_state="ExplodeTopMiddle"
			pixel_y = 32
			layer=MOB_LAYER+1
		C
			icon_state="ExplodeTopRight"
			pixel_x = 32
			pixel_y = 32
			layer=MOB_LAYER+1
		D
			icon_state="ExplodeMiddleLeft"
			pixel_x = -32
			layer=MOB_LAYER+1
		E
			icon_state="ExplodeMiddleRight"
			pixel_x = 32
			layer=MOB_LAYER+1
		F
			icon_state="ExplodeBottomLeft"
			pixel_x = -32
			pixel_y = -32
			layer=MOB_LAYER+1
		G
			icon_state="ExplodeBottomMiddle"
			pixel_y = -32
			layer=MOB_LAYER+1
		H
			icon_state="ExplodeBottomRight"
			pixel_x = 32
			pixel_y = -32
			layer=MOB_LAYER+1

obj
	Explosionsmall
		icon='Explosion(1).dmi'
		icon_state="Explode"
		//JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		New()
			..()
			spawn()
				sleep(1)
				spawn(1)
					var/z=rand(1,2)
					while(z>0)
						var/obj/s=new/obj/Ashes2
						s.loc=src.loc
						z--
						sleep(1)
				for(var/mob/M in oview(1,src))
					spawn()
						if(M)
							var/damage=M.Mhealth*0.06
							view(M)<<"<font color=red>[M] has been hit by the explosion!</font>"
							M.health -= damage
							M.Death(M)

			spawn(5)
				del(src)









mob/preta
	verb
		EnergyAbsorb()
			set category = "Paths"
			set name = "Preta Ninjutsu Absorb"
			for(var/mob/npc/PathBody/M in world)
				if(M.PathNum==3 && M.owner==usr&&M.InCont)
					if(usr.chakra <= 10)
						usr<<"You dont have enough Chakra!"
						return
					else
						if(M.eaon)
							M.eaon=0
							usr<<"[M] Stops absorbing."
							M.Frozen=0
							return
						else
							M.eaon=1
							usr<<"[M] Starts absorbing."
							M.Frozen=1
							spawn(1)
								M.EA()
							return


mob/animal
	verb
		Summonpaths()
			set category = "Paths"
			set name = "Summon All Paths"
			for(var/mob/npc/PathBody/M in world)
				if(M.PathNum==4 && M.owner==usr&&M.InCont)
					M.owner<<"[M] Summoned all the dispatched paths."
					usr.chakra-=500
					for(var/mob/npc/PathBody/N in world)
						if(N!=M&&N.owner==M.owner)
							var/obj/smoke/K=new();K.loc=N.loc
							N.loc=locate(M.x+N.PathNum-4,M.y,M.z)
							var/obj/smoke/T=new();T.loc=N.loc
							N.dir = SOUTH



mob
	var
		tmp/eaon=0 //energy absorb on

mob
	proc
		EA()
			spawn(1)
				//if(src.icon_state=="5")
					//src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part1;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part2;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part3;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part4;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part6;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part7;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part8;src.overlays+=/obj/Jutsu/Uchiha/Susanoo/Part9
				while(src.chakra>=10&&src.eaon)
					src.chakra-=rand(10,100)
					if(src.chakra<10)
						src.eaon=0
						src.owner<<"[src] Doesn't have enough chakra to keep absorbing."
						src.Frozen=0
						return
					for(var/obj/skill/A in oview(1,src))
						if(A.owner!=src.owner)
							src.chakra+=A.damage
							src.owner<<"[src] Absorbed [A].([A.damage])"
							del(A)
							src.owner<<"[src] now has [src.chakra]/[src.Mchakra] chakra."
							if(src.chakra>src.Mchakra*1.5)
								src.chakra=src.Mchakra*1.5
					for(var/mob/A in oview(1,src))
						if(A!=src.owner&&src.chakra<src.Mchakra*1.5)
							src.chakra+=A.Mchakra*0.12
							A.chakra-=A.Mchakra*0.12
							src.owner<<"[src] has absorbed [A.Mchakra*0.12] chakra from [A]."
							//spawn(1)
								//A.sandcover()
							A.Death(A)
					sleep(10)






mob/deva
	verb
		ChibakuTensei()
			set name="Deva Chibaku Tensei"
			set category="Paths"
			if(usr.chakra <= 1)//was 4500
				return
			else
				usr.chakra -= 4500//was 4500
				for(var/mob/npc/PathBody/P in world)
					if(P.PathNum==1 && P.owner==usr && P.InCont)
						if(!P.Chibaku)
							var/obj/skill/Chibaku/K = new()
							K.loc = P.loc
							walk(K,P.dir,6)
							K.owner = P
							P.Chibaku = 1
						else
							for(var/obj/skill/Chibaku/O in world)
								if(O.owner == P)
									walk(O,0)
									O.ChibakuPull(P)




obj
	var
		target=""

obj/s
	soul
		icon = 'Effects.dmi'
		icon_state="soul"
		density = 1
		Bump(A)
			if(ismob(A))
				if(A!=src.target)
					src.density=0
					sleep(1)
					src.density=1
					return
				A:health=A:Mhealth
				A:chakra=A:Mchakra
				A:wounds=0
				A:invisibility=0
				A:see_invisible=0
				A:dead=0
				oview(A)<<"[A] Has been ressurected by a soul!"
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					src.density=0
					sleep(1)
					src.density=1
			if(istype(A,/obj/))
				src.density=0
				sleep(1)
				src.density=1
				del(src)

obj/skill
	Chibaku
		icon = 'Effects.dmi'
		icon_state="kamui"
		density = 0
		New()
			..()
			spawn()
				while(src)
					for(var/mob/A in view(2,src))
						if(A!=src.owner)
							A.health-=A.Mhealth*0.05
							//spawn(1)
								//A.sandcover()
							A.Death(A)
					sleep(10)
		Bump(A)
			if(ismob(A))
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
			//if(istype(A,/obj/Kamui))
				//usr.random=rand(1,3)
				//if(usr.random==1||usr.random==3)
					//del(src)
				//else
					//return
		Del()
			var/mob/npc/PathBody/M = src.owner
			if(M) M.Chibaku = 0
			for(var/mob/Q in view(src))
				Q.Tensei = 0
			..()





mob
	var
		Tensei=0

obj
	var
		cbm=1



obj/proc
	ChibakuPull(mob/M)
		for(var/i=0,i<120,i++)
			for(var/V in view(src))
				if(ismob(V))
					var/mob/A = V
					if(A!=M)
						A.Tensei = 1
						walk_towards(A,src)
				if(istype(V,/obj/skill/))
					var/obj/B = V
					if(B.cbm)
						walk_towards(B,src)
			sleep(2)//was 5
		for(var/mob/Q in view(src))
			Q.Tensei = 0
		del(src)

mob
	proc
		NewPath(mob/usr)
			src.icon = usr
			src.overlays = usr.overlays
			//src.loc = usr.loc
			src.owner = usr
			src.step_size=usr.step_size
			if(src.preta)
				src.name = "Preta Path [usr.name]"
				src.icon = 'rinnegan eyes base2.dmi'
				src.Mhealth = usr.Mhealth/4
				src.health = src.Mhealth
				src.Mchakra=usr.Mchakra*3
				src.rush=usr.rush/4
				src.Mtai = usr.Mtai/2
				src.Mnin = usr.Mnin/5
				src.Mgen = usr.Mgen/5
			if(src.deva)
				src.name = "Deva Path [usr.name]"
				src.icon = 'rinnegan eyes base1.dmi'
				src.Mhealth = usr.Mhealth
				src.health = src.Mhealth
				src.Mchakra=usr.Mchakra
				src.rush=usr.rush*0.75
				src.Mtai = usr.Mtai*1.2
				src.Mnin = usr.Mnin*1.05
				src.Mgen = usr.Mgen*0.70
			if(src.humanp)
				src.name = "Human Path [usr.name]"
				src.icon = 'rinnegan eyes base5.dmi'
				src.Mhealth = usr.Mhealth*0.90
				src.health = src.Mhealth
				src.Mchakra=usr.Mchakra*1.2
				src.rush=usr.rush
				src.Mtai = usr.Mtai*1.2
				src.Mnin = usr.Mnin*1.12
				src.Mgen = usr.Mgen*1.2
			if(src.animalp)
				src.name = "Animal Path [usr.name]"
				src.icon = 'rinnegan eyes base3.dmi'
				src.Mhealth = usr.Mhealth/2
				src.health = src.Mhealth
				src.Mchakra=usr.Mchakra*1.5
				src.rush=usr.rush/2
				src.Mtai = usr.Mtai*0.90
				src.Mnin = usr.Mnin*1.2
				src.Mgen = usr.Mgen/6
			if(src.asura)
				src.name = "Asura Path [usr.name]"
				src.icon = 'rinnegan eyes.dmi'
				src.Mhealth = usr.Mhealth*0.73
				src.health = src.Mhealth
				src.Mchakra=usr.Mchakra*3
				src.rush=usr.rush/3
				src.Mtai = usr.Mtai*0.85
				src.Mnin = usr.Mnin*1.7
				src.Mgen = usr.Mgen/8
			if(src.naraka)
				src.name = "Naraka Path [usr.name]"
				src.icon = 'rinnegan eyes base4.dmi'
				src.Mhealth = usr.Mhealth*4
				src.health = src.Mhealth
				src.Mchakra=usr.Mchakra*2
				src.rush=usr.rush/2
				src.Mtai = usr.Mtai/3
				src.Mnin = usr.Mnin/6
				src.Mgen = usr.Mgen*1.4
			src.village=usr.village
			src.chakra=src.Mchakra
			src.tai = src.Mtai
			src.nin = src.Mnin
			src.gen = src.Mgen
			usr.Paths[src.PathNum]=src
*/
