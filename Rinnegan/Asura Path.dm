/*obj
	jutsu
		missle
			icon='missle.dmi'*///song, down with the sickness, and love lockdown





obj/jutsu
	missle1
		icon='missles.dmi'
		icon_state="Missile"
		density=1
		pixel_y = 14
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
			var/obj/jutsu/Explosionsmall/K=new()
			K.loc=src.loc
			K.owner=src.owner
			..()



obj/jutsu
	missle2
		icon='missles.dmi'
		icon_state="RocketPunch"
		density=1
		pixel_y = 14
		New()
			spawn(25)
				del(src)
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O=src.owner
				M.taidamage(O.tai*1.5,0,O)
				//M.Death(O)
				del(src)
			if(istype(A,/turf/))
				var/turf/T = A
				if(T.density)
					del(src)
			if(istype(A,/obj/))
				del(src)
		Del()
			var/obj/jutsu/Explosion/K=new()
			K.loc=src.loc
			K.owner=src.owner
			..()




obj/jutsu
	Explosion
		icon='Explosion(1).dmi'
		icon_state="ExplodeMiddle"
		//JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		New()
			..()
			overlays+=/obj/jutsu/Explosion/A
			overlays+=/obj/jutsu/Explosion/B
			overlays+=/obj/jutsu/Explosion/C
			overlays+=/obj/jutsu/Explosion/D
			overlays+=/obj/jutsu/Explosion/E
			overlays+=/obj/jutsu/Explosion/F
			overlays+=/obj/jutsu/Explosion/G
			overlays+=/obj/jutsu/Explosion/H
			spawn()
				sleep(1)
				spawn(1)
					var/z=rand(2,5)
					while(z>0)
						var/obj/s=new/obj/Ashes2
						s.loc=src.loc
						z--
						sleep(1)
				for(var/mob/M in view(1,src))
					spawn()
						if(M)
							var/mob/O=src.owner
							//M.taidamage(O.tai*1.5,0,O)
							//var/damage=M.Mhealth*0.06
							view(M)<<"<font color=red>[M] has been hit by the explosion!</font>"
							//M.nindamage(M.Mhealth*0.12,0,src.owner)
							M.nindamage(O.nin*0.30,0,O)//change this to power
							//M.Death(M)

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

obj/jutsu
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
				for(var/mob/M in view(1,src))
					spawn()
						if(M)
							var/mob/O=src.owner
							//M.taidamage(O.tai*1.5,0,O)
							//var/damage=M.Mhealth*0.06
							view(M)<<"<font color=red>[M] has been hit by the explosion!</font>"
							//M.nindamage(M.Mhealth*0.12,0,src.owner)
							M.nindamage(O.nin*0.15,0,O)//change this to power
							//M.Death(M)

			spawn(5)
				del(src)


obj/Ashes2
	icon='Dirt.dmi'
	name = "Ashes"
	density=0
	icon_state = "2"
	layer=5//was 2.011
	New()
		..()
		spawn(1)
			src.dir=pick(NORTH,NORTHEAST,NORTHWEST,EAST,WEST,SOUTH,SOUTHEAST,SOUTHWEST)
			while(src)
				//src.dir=pick(NORTH,NORTHEAST,NORTHWEST,EAST,WEST,SOUTH,SOUTHEAST,SOUTHWEST)
				step_rand(src,16)
				sleep(5)
		pixel_y = rand(-32,32)
		pixel_x = rand(-32,32)
		spawn(rand(50,100))
			//flick("Fade",src)
			sleep(15)
			del src

mob/proc/AsuraRealmMissle()
	flick("throw",src)
	src.icon_state="punchrS"
	view(src)<<"[src] opens up his catridges and lets out Missiles!"
	sleep(10)
	var/X=5
	while(X)
		var/obj/jutsu/missle1/A=new()
		A.owner=src;A.loc=src.loc
		A.dir=src.dir;walk(A,A.dir)
		if(src.target)
			if(prob(30))
				step_towards(A,src.target)
		X-=1
		sleep(10)
	src.icon_state=""

mob
	proc
		auramissles()
			//src.icon_state="throw"
			view(src)<<"[src] opens up his catridges and lets out missiles!"
			sleep(10)
			var/X=rand(3,5)
			var/steps=0
			while(X)
				spawn(1)
					flick("throw",src)
					var/obj/jutsu/missle1/A=new()
					A.owner=src;A.loc=src.loc
					A.dir=src.dir
					if(X==5)
						A.dir=turn(A.dir,45)
						step(A,A.dir)
						if(A)
							A.dir=src.dir
					if(X==4)
						A.dir=turn(A.dir,-45)
						step(A,A.dir)
						if(A)
							A.dir=src.dir
					if(X==3)
						A.dir=turn(A.dir,45)
					if(X==2)
						A.dir = turn(A.dir,-45)
					spawn(1)
						while(A)
							//A.dir=src.dir
							step(A,A.dir)
							steps+=1
							if(src.target)
								if(steps>=7&&prob(35))//was 30
									if(A)
										A.dir=get_dir(A,src.target)
							sleep(1.2)
				X-=1
				sleep(2)
			src.icon_state=""
		auramissle()
			//src.icon_state="throw"
			view(src)<<"[src] opens up his catridges and fires a missile!"
			sleep(5)
			var/X=1
			while(X)
				spawn(1)
					flick("throw",src)
					var/obj/jutsu/missle1/A=new()
					A.owner=src;A.loc=src.loc
					A.dir=src.dir
					var/steps=0
					spawn(1)
						while(A)
							//A.dir=src.dir
							step(A,A.dir)
							steps+=1
							if(src.target)
								if(steps>=5&&prob(45))//was 30
									if(A)
										A.dir=get_dir(A,src.target)
							sleep(1.2)
				X-=1
				sleep(10)
			if(src.ko==0)
				src.icon_state=""


obj
	skill
		asura
			verb
				missle()
					set category = "Skills"
					set name = "Fire Missle"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+100
					if(usr.handseal(600,0))
						usr.Frozen=1
						spawn(1)
							if(src.level<1)
								src.mastery+=(5-src.level)
								if(prob(10))
									usr<<"Your getting better with missles."
								if(src.mastery>=100)
									src.level+=1
									src.mastery-=100
									if(src.level==1)
										usr<<"You mastered missles and is able to fire off more."
										var/obj/skill/asura2/A=new()
										A.loc=usr
						usr.auramissle()
						usr.Frozen=0
						//usr.Summoneffect()
						//var/obj/smoke/B=new()
						//B.loc=locate(A.x,A.y,A.z)
						//view(A)<< sound('Smoke.wav',0,0,1)
					else
						usr<<"You failed the jutsu."
		asura2
			verb
				missles()
					set category = "Skills"
					set name = "Fire Missles"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(2000,0))
						usr.Frozen=1
						usr.auramissles()
						usr.Frozen=0
						//usr.Summoneffect()
						//var/obj/smoke/B=new()
						//B.loc=locate(A.x,A.y,A.z)
						//view(A)<< sound('Smoke.wav',0,0,1)
					else
						usr<<"You failed the jutsu."