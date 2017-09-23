mob
	var
		tmp/insand=0



obj
	sand
		icon = 'sand block.dmi'
		density=0


obj/jutsu
	sand
		icon='Suna.dmi'
		icon_state="sand"
		//JutsuLevel=150
		layer=TURF_LAYER//+0.00001
		New()
			..()
			overlays+=/obj/jutsu/sand/A
			overlays+=/obj/jutsu/sand/B
			overlays+=/obj/jutsu/sand/C
			overlays+=/obj/jutsu/sand/D
			spawn(600)
				del(src)
		A
			icon_state=""
			pixel_x = -32
			layer=TURF_LAYER+0.00001
		B
			icon_state=""
			pixel_y = 32
			layer=TURF_LAYER+0.00001
		C
			icon_state=""
			pixel_x = 32
			layer=TURF_LAYER+0.00001
		D
			icon_state=""
			pixel_y = -32
			layer=TURF_LAYER+0.00001


obj/jutsu
	sandw
		icon='Suna.dmi'
		icon_state = "Wave"
		//Element="Suiton"
		density=1
		movedelay=0.8
		layer=MOB_LAYER+1
		var
			nin=10
			prestep=0
			laststep=0
		New()
			..()
			spawn(50)
				del(src)
		Move()
			src.laststep=src.loc
			..()
			//
			var/obj/jutsu/sand/U=new()
			U.loc=src.laststep
			//L.dir=src.dir
			U.owner=src.owner
		Bump(A)
			..()
			if(ismob(A))
				var/mob/M = A
				var/mob/O=src.owner
				spawn(1)
					M.nindamage(src.power,0,O)
				src.density=0
				spawn(3)
					src.density=1
				//M.Death(O)
				//del(src)
			if(istype(A,/turf/))
				del(src)
			if(istype(A,/obj/))
				del(src)


obj/jutsu
	sandcof
		icon='Suna.dmi'
		icon_state="KyuuTrail"
		density=1
		movedelay=1.3
		layer=MOB_LAYER+0.00001
		var
			prestep=0
			laststep=0
		New()
			..()
			spawn(50)
				if(src)
					if(src.caught)
						while(src.mastery)
							src.mastery-=1
							sleep(10)
						if(src.inuse)
							sleep(50)
					del(src)
		Bump(A)
			..()
			if(istype(A,/mob/))
				var/mob/M = A
				var/mob/O=src.owner
				if(M==O||M.ko==1)
					src.density=0
					spawn(3)
						src.density=1
					return
				if(M.insand==0)
					view(A) << "[M] was captured by the sand!!"
					src.density=0
					M.insand=1
					src.layer=MOB_LAYER+1
					src.loc=M.loc
					//flick("form",src)
					src.icon_state="KyuuCapture"
					src.loc=M.loc
					src.caught=1
					src.loc=A:loc
				else
					for(var/obj/jutsu/sandcof/T in view(1,src))
						src.loc=M.loc
						//view(T)<<"[T]'s power was [T.power]."
						//view(T)<<"[T]'s mastery was [T.mastery]."
						T.power+=src.power
						T.mastery+=src.mastery*0.50
						//view(T)<<"[T]'s power is now [T.power]."
						//view(T)<<"[T]'s mastery is now [T.mastery]."
						view(T)<<" The sand coffin was reinforced!"
						del src
			if(istype(A,/obj/))
				src.density=0
				sleep(1)
				src.density=1
			if(istype(A,/turf/))
				del(src)
		Move()
			src.laststep=src.loc
			..()
			var/obj/jutsu/kyuutrail/L=new()
			L.loc=src.laststep
			L.dir=src.dir
			L.owner=src.owner
		Del()
			var/obj/jutsu/sand/K=new()
			K.loc=src.loc
			for(var/mob/M in src.loc)
				if(M.insand)
					M.insand=0
			..()
	kyuutrail
		icon='Suna.dmi'
		icon_state="KyuuTrail"
		density=0
		New()
			spawn(15)
				if(src)
					del(src)

mob
	var
		sarmor=0
		css=0
		sandamm=0

obj/jutsu
	var
		caught=0
		inuse=0
	/*sandcol
		icon='sandtechs.dmi'
		icon_state="collect"
		density=1
		layer=MOB_LAYER+8
		New()
			spawn(220)
				if(src)
					del(src)
		Bump(A)
			if(ismob(A))
				A<<"You now have [A:sandamm] grains of sand."
				A:sandamm+=1
				del src*/
obj
	skill
		sand1
			verb
				sandsum()
					set category = "Skills"
					set name = "Sand Summon"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+350
					if(usr.handseal(400,1))
						src.levelgain(2,src.level)
						//var/obj/jutsu/sandw/A=new()
						var/r=src.level
						if(r<1)
							r=1
						if(r>2)
							r=2
						for(var/turf/T in getring(usr,r))
							if(T.density<=0)
								var/obj/jutsu/sand/U=new()
								U.loc=locate(T.x,T.y,T.z)
								U.owner=usr
		sand2
			verb
				sarmor()
					set category = "Skills"
					set name = "Sand Armor"
					if(usr.sandarmor)
						usr<<"You release the sand armor."
						usr.sandarmor=0
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal(400,1))
						if(usr.sandarmor)
							usr<<"You release the sand armor."
							usr.sandarmor=0
						else
							usr<<"You place sand over your entire being to soften the damage done to you, but will take chakra over time."
							usr.sandarmor=1
							spawn(10)
								while(usr&&usr.sandarmor>0)
									usr.chakra-=(usr.Mchakra*0.005)+10
									if(usr.chakra<=0)
										usr.sandarmor=0
										usr<<"You ran out of chakra to keep your sand armor active."
									sleep(rand(7,25))
								usr.sandarmor=0
		sand3
			verb
				sandcoffin()
					set category = "Skills"
					set name = "Sand Coffin"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+100
					if(usr.target&&usr.target in oview(5,usr))
						if(usr.handseal(400,1))
							var/list/T=list()
							var/X=0
							src.levelgain(7,src.level)
							for(var/obj/jutsu/sand/K in oview(2))
								T.Add(K)
								X++
							if(X>0)
								var/obj/H = pick(T)
								view(usr)<<"[usr]: Sand Coffin!"
								var/obj/jutsu/sandcof/K=new()
								K.loc=H.loc
								K.owner=usr
								var/r=src.level
								if(r<1)
									r=1
								if(r>=7)
									r=7
								K.power=(usr.nin*0.75)*r
								K.mastery=20
								del H
								walk_towards(K,usr.target,0,31)
							else
								usr<<"You need sand around you to do this."
								return
					else
						usr<<"You need a target or to get closer to yours."
						return
				sandcrush()
					set category = "Skills"
					set name = "Sand Burial"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+200
					if(usr.handseal(400,1))
					//var/found=0
						view(usr)<<"[usr]: Sand Burial!"
						for(var/obj/jutsu/sandcof/A in oview(usr))
							if(A.caught)
								//A.icon_state=""
								A.caught=0
								A.inuse=1
								sleep(30)
								flick("sousou",A)
								A.caught=0
								for(var/mob/M in view(0,A.loc))
									view(A)<<"<font color=red><small>[M] was damaged by Sand Burial for [A.power] damage.</font></small>"
									M.nindamage(A.power,1,usr)
									M.Frozen=0
								del A
		sand4
			verb
				sarmor()
					set category = "Skills"
					set name = "Sand Shield"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal(400,1))
						usr<<"Not yet implimented."
		sand5
			verb
				sarmor()
					set category = "Skills"
					set name = "Sand Tsunami"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal(400,1))
						usr<<"Not yet implimented."
		sand6
			verb
				sarmor()
					set category = "Skills"
					set name = "Giant Sand Burial"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal(400,1))
						usr<<"Not yet implimented."