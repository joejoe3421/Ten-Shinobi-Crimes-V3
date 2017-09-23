obj/summoneffect
	icon='summoningeffect.dmi'
	density=0
	//pixel_y = -12
	//pixel_x = 16
	New()
		..()
		spawn(20)
			if(src)
				del src
obj/summoncircle
	icon='summoncircle.dmi'
	icon_state=""
	density=0
	layer=TURF_LAYER+0.001
	//pixel_y = -12
	//pixel_x = 16
	New()
		..()
		spawn(20)
			if(src)
				del src
mob/proc/Summoneffect()
	spawn(1)
		var/obj/summoneffect/U = new()
		var/obj/summoneffect/D = new()
		var/obj/summoneffect/L = new()
		var/obj/summoneffect/R = new()
		var/obj/summoneffect/NW = new()
		var/obj/summoneffect/NE = new()
		var/obj/summoneffect/SE = new()
		var/obj/summoneffect/SW = new()
		var/obj/summoncircle/SC = new()
		flick("beastman",src)
		sleep(4)
		src.icon_state="beastman"
		SC.loc=src.loc
		//flick("summon",SC)
		spawn(4)
			src.icon_state=""
		U.loc=src.loc
		step(U,NORTH)
		D.loc=src.loc
		step(D,SOUTH)
		L.loc=src.loc
		step(L,WEST)
		R.loc=src.loc
		step(R,EAST)
		NW.loc=src.loc
		step(NW,NORTHWEST)
		NE.loc=src.loc
		step(NE,NORTHEAST)
		SE.loc=src.loc
		step(SE,SOUTHEAST)
		SW.loc=src.loc
		step(SW,SOUTHWEST)
		sleep(50)
		if(U)
			del(U)
		if(D)
			del(D)
		if(L)
			del(L)
		if(R)
			del(R)
		if(NW)
			del(NW)
		if(NE)
			del(NE)
		if(SE)
			del(SE)
		if(SW)
			del(SW)
		if(SC)
			del(SC)




mob
	summon
		summon=1
		koamm=1
		Clam
			name="Clam"
			icon='XGhost.dmi'
			icon_state=""
			density=1
			Frozen=1
			health=100
			layer=MOB_LAYER+0.001
			//pixel_y = -12
			//pixel_x = -32
			New()
				..()
				spawn(20)
					var/mob/O = src.owner
					if(O)
						while(O&&src)
							O.clamgen=1
							O.ingenjutsu=1
							sleep(30)
				spawn(50)
					while(src)
						src.pixel_y = rand(-1600,1600)
						src.pixel_x = rand(-1600,1600)
						sleep(rand(100,250))
				spawn(rand(1200,1800))//2-3 minutes
					if(src)
						del src
		Del()
			view(src)<<"[src] dissapears."
			src.density=0
			var/mob/O = src.owner
			O<<"The [src] has left."
			O.clamgen=0
			O.ingenjutsu=0
			//flick("leave",src)
			sleep(5)
			..()




mob
	var
		summonlist=list()
		tmp/summon=0
		tmp/clamgen=0



obj
	skill
		summon//this is the line the must only contain one verb after it untill the next jutsu
			verb
				summon()//var/M in usr.summonlist)
					set category = "Skills"
					set name = "Contract Summon"
					var/summons = list()
					for(var/C in usr.summonlist)
						summons += C
					var/M = input("Summon what?","Summon") in list("Cancel") + summons// + list("Cancel")
					if(M=="Cancel")
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal(300,9))
						usr.Summoneffect()
						if(M=="Clam")
							var/summoned=0
							for(var/mob/summon/Clam/T in world)
								if(T&&T.owner==usr)
									summoned=1
									break
							if(summoned>0)
								usr<<"You already have this summoned."
								return
							else
								sleep(2)
								usr<<"You summon aGiant clam and it casts a genjutsu on those around you."
								usr.summonclam()
								src.cooldown=300
						//var/obj/smoke/B=new()
						//B.loc=locate(A.x,A.y,A.z)
						//view(A)<< sound('Smoke.wav',0,0,1)
					else
						usr<<"You failed the jutsu."




mob
	proc
		summonclam()
			var/mob/summon/Clam/SC = new()
			//SC.loc=src.loc
			src.Frozen=1
			spawn(10)
				src.Frozen=0
			flick("groundjutsu",src)
			//sleep(4)
			src.icon_state="groundjutsuse"
			SC.loc=src.loc
			//flick("come",SC)
			SC.health+=(src.gen*2.3)
			SC.owner=src
			spawn(4)
				src.icon_state=""