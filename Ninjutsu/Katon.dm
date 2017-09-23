







mob
	teacher
		katonteacher
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			name="Katon Teacher"
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='MadaraH.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(0,0,0)
					var/Shirt='cvest.dmi'
					Shirt+=rgb(61,100,60)
					src.icon=Base
					src.overlays+='Boxers.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+='pants.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+='LeafJounin.dmi'
					src.overlays+=Shirt
					src.overlays+=Hair
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr.element=="Katon"||usr.haskaton)
					if(usr.katonknowledge>=0)
						cl+="Pheonix Flower"
					if(usr.katonknowledge>=20)
						cl+="Fire Ball"
					if(usr.katonknowledge>=80)
						cl+="Grand Fire Ball"
					if(usr.katonknowledge>=150)
						cl+="Fire Dragon Flame Bullet"
					if(usr.katonknowledge>=200)
						cl+="Dragon Fire"
					if(usr.katonknowledge>=300)
						cl+="Great Dragon Fire"
					if(usr.katonknowledge>=500)
						cl+="Flame Clone"
					if(usr.katonknowledge>=750&&usr.element=="Katon"&&usr.haskaton>=1)
						cl+="Great Fire Annihilation"
				oview(src)<<"[src] Says: You here to learn something?"
				var/T = input("What to learn?","Katon") in list("Nothing") + cl
				if(T=="Nothing")
					return
				if(T in usr.jutsus)
					oview(src)<<"[src] Says: You already know this technique."
					return
				if(T=="Pheonix Flower")
					usr.contents += new /obj/skill/katon1
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Fire Ball")
					usr.contents += new /obj/skill/katon2
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Grand Fire Ball")
					usr.contents += new /obj/skill/katon3
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Fire Dragon Flame Bullet")
					usr.contents += new /obj/skill/flamebullet
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Dragon Fire")
					usr.contents += new /obj/skill/dragonfire
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else
					oview(src)<<"[src] Says: Sorry, I cant teach you that at this time."











mob
	var
		katonknowledge=0
mob
	proc
		kincrease(number)
			if(src.katonknowledge<5001)
				if(prob(9))
					src.katonknowledge+=rand(1,number)
				else
					src.katonknowledge+=0.5




obj
	var
		power=0
obj
	jutsu
		fire1
			icon='KatonTechniques.dmi'
			icon_state="5"
			layer=MOB_LAYER+10
			New()
				..()
				overlays+=/obj/jutsu/fire1/A;overlays+=/obj/jutsu/fire1/B;overlays+=/obj/jutsu/fire1/C;overlays+=/obj/jutsu/fire1/D;overlays+=/obj/jutsu/fire1/E;overlays+=/obj/jutsu/fire1/F;overlays+=/obj/jutsu/fire1/G;overlays+=/obj/jutsu/fire1/H
				spawn(2)
					if(src.power>1000)
						src.power=1000
					var/mob/O=src.owner
					while(src)
						for(var/mob/M in view(1,src))
							spawn(1)
								if(M)
									M.nindamage(src.power*0.15,0,O,"katon")
						sleep(rand(5,9))
				spawn(rand(50,70))
					del src
			A
				icon_state="1";pixel_x = -32;pixel_y = 32
			B
				icon_state="2";pixel_y = 32
			C
				icon_state="3";pixel_x = 32;pixel_y = 32
			D
				icon_state="4";pixel_x = -32
			E
				icon_state="6";pixel_x = 32
			F
				icon_state="7";pixel_x = -32;pixel_y = -32
			G
				icon_state="8";pixel_y = -32
			H
				icon_state="9";pixel_x = 32;pixel_y = -32
		fire2
			icon='KatonTechniques.dmi'
			icon_state="5"
			layer=MOB_LAYER+10
			New()
				..()
				overlays+=/obj/jutsu/fire1/A;overlays+=/obj/jutsu/fire1/B;overlays+=/obj/jutsu/fire1/C;overlays+=/obj/jutsu/fire1/D;overlays+=/obj/jutsu/fire1/E;overlays+=/obj/jutsu/fire1/F;overlays+=/obj/jutsu/fire1/G;overlays+=/obj/jutsu/fire1/H
				spawn(2)
					if(src.power>1000)
						src.power=1000
					var/mob/O=src.owner
					while(src)
						for(var/mob/M in view(1,src))
							spawn(1)
								if(M)
									M.nindamage(src.power*0.40,0,O,"katon")
						sleep(rand(6,15))
				spawn(rand(50,70))
					del src

obj/jutsu
	//icon='explode.dmi'
	//icon_state="1"
	//var/level=0
	//var/brightness=255 // Something I was toying with, just judges how dark the shadow is
	fire
		New()
			..() // This is just for effect, makes the grass around it lighter when it's created
			//var/mob/O=src.owner
			//var/mob/O = src.owner
			/*for(var/mob/T in world)
				if(T.client)
					T<<"[src] belongs to [src.owner]."
					src.owner=T
					T<<"[src] now belongs to [src.owner]."*/
			spawn(3)
				if(src:level>=0)
					for(var/turf/G in getcircle(src,src.level))
						if(prob(95))
							var/obj/jutsu/fire1/A=new()
							A.owner=src.owner;A.loc=locate(G.x,G.y,G.z)
							A.power=src.power
						else
							var/obj/jutsu/fire2/A=new()
							A.owner=src.owner;A.loc=locate(G.x,G.y,G.z)
							A.power=src.power

				/*if(src:level>=0)
					for(var/turf/G in view(src,0))
						var/obj/jutsu/fire1/A=new()
						A.owner=src.owner;A.loc=locate(G.x,G.y,G.z)
						A.power=src.power
				if(src:level>=1)
					for(var/turf/G in view(src,1))
						var/obj/jutsu/fire2/A=new()
						A.owner=src.owner;A.loc=locate(G.x,G.y,G.z)
						A.power=src.power
				if(src:level>=2)
					for(var/turf/G in view(src,2))
						var/obj/jutsu/fire1/A=new()
						A.owner=src.owner;A.loc=locate(G.x,G.y,G.z)
						A.power=src.power*0.95
				if(src:level>=3)
					for(var/turf/G in view(src,3))
						var/obj/jutsu/fire2/A=new()
						A.owner=src.owner;A.loc=locate(G.x,G.y,G.z)
						A.power=src.power*0.90
				if(src:level>=4)
					for(var/turf/G in view(src,4))
						var/obj/jutsu/fire1/A=new()
						A.owner=src.owner;A.loc=locate(G.x,G.y,G.z)
						A.power=src.power*0.80
				if(src:level>=5)
					for(var/turf/G in view(src,5))
						var/obj/jutsu/fire2/A=new()
						A.owner=src.owner;A.loc=locate(G.x,G.y,G.z)
						A.power=src.power*0.70
				if(src:level>=6)
					for(var/turf/G in view(src,6))
						var/obj/jutsu/fire1/A=new()
						A.owner=src.owner;A.loc=locate(G.x,G.y,G.z)
						A.power=src.power*0.60
				if(src:level>=7)
					for(var/turf/G in view(src,7))
						var/obj/jutsu/fire2/A=new()
						A.owner=src.owner;A.loc=locate(G.x,G.y,G.z)
						A.power=src.power*0.50
				if(src:level>=8)
					for(var/turf/G in view(src,8))
						var/obj/jutsu/fire1/A=new()
						A.owner=src.owner;A.loc=locate(G.x,G.y,G.z)
						A.power=src.power*0.40
				if(src:level>=9)
					for(var/turf/G in view(src,9))
						var/obj/jutsu/fire2/A=new()
						A.owner=src.owner;A.loc=locate(G.x,G.y,G.z)
						A.power=src.power*0.30
				if(src:level>=10)
					for(var/turf/G in view(src,10))
						var/obj/jutsu/fire1/A=new()
						A.owner=src.owner;A.loc=locate(G.x,G.y,G.z)
						A.power=src.power*0.20*/
				del src



////okay so need to find another way to make thing have the turf's locations becaus eapparently turf doesn't have locations


/*mob
	verb
		testexplode()
			if(src.pl>=50000)
				for(var/turf/G in getcircle(src,1))
					var/T1=new/obj/splodie(loc)
					T1:loc=locate(G.x,G.y,G.z)
					T1:owner=src
					T1:pl=src.pl
				//G.icon+=rgb(30,30,30)
				sleep(5)
			if(src.pl>=100000)
				for(var/turf/G in getcircle(src,2))
					var/T1=new/obj/splodie(loc)
					T1:loc=locate(G.x,G.y,G.z)
					T1:owner=src
					T1:pl=src.pl
				//G.icon+=rgb(30,30,30)
				sleep(5)
			if(src.pl>=250000)
				for(var/turf/G in getcircle(src,3))
					var/T1=new/obj/splodie(loc)
					T1:loc=locate(G.x,G.y,G.z)
					T1:owner=src
					T1:pl=src.pl
				//G.icon+=rgb(30,30,30)
				sleep(5)
			if(src.pl>=750000)
				for(var/turf/G in getcircle(src,4))
					var/T1=new/obj/splodie(loc)
					T1:loc=locate(G.x,G.y,G.z)
					T1:owner=src
					T1:pl=src.pl
				//G.icon+=rgb(30,30,30)
				sleep(5)
			if(src.pl>=5000000)
				for(var/turf/G in getcircle(src,5))
					var/T1=new/obj/splodie(loc)
					T1:loc=locate(G.x,G.y,G.z)
					T1:owner=src
					T1:pl=src.pl*/









obj/jutsu
	fireball2
		icon='KatonTechniques.dmi'
		icon_state="5"
		layer=MOB_LAYER+10
		New()
			..()
			overlays+=/obj/jutsu/fire1/A;overlays+=/obj/jutsu/fire1/B;overlays+=/obj/jutsu/fire1/C;overlays+=/obj/jutsu/fire1/D;overlays+=/obj/jutsu/fire1/E;overlays+=/obj/jutsu/fire1/F;overlays+=/obj/jutsu/fire1/G;overlays+=/obj/jutsu/fire1/H
			spawn(40)
				del(src)
		density=1
		movedelay=0.7
		//pixel_y = 14
		//var/mob/O=src:owner
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O=src.owner
				M.nindamage(src.power*1.5,0,O,"katon")
				del(src)
			if(istype(A,/turf/))
				del(src)
			if(istype(A,/obj/))
				del(src)
		Del()
			var/mob/O=src.owner
			var/thepower=src.power
			var/obj/jutsu/fire/K=new()
			K.level=src.level
			K.loc=src.loc
			K:owner=O
			K.power=thepower*0.32
			..()


obj/jutsu
	dragonfire
		icon='KatonTechniques.dmi'
		icon_state="bam"
		layer=MOB_LAYER+10
		New()
			..()
			spawn(40)
				del(src)
		density=1
		movedelay=0.7
		var/laststep=0
		//pixel_y = 14
		//var/mob/O=src:owner
		Move()
			src.laststep=src.loc
			..()
			var/obj/jutsu/dragonfiretrail/L=new()
			L.loc=src.laststep
			L.dir=src.dir
			L.owner=src.owner
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O=src.owner
				M.nindamage(src.power,0,O,"katon")
				del(src)
			if(istype(A,/turf/))
				del(src)
			if(istype(A,/obj/))
				del(src)
		Del()
			var/mob/O=src.owner
			var/thepower=src.power*0.42
			var/obj/jutsu/fire/K=new()
			K.level=src.level
			K.loc=src.loc
			K:owner=O
			K.power=thepower
			..()
	dragonfiretrail
		icon='KatonTechniques.dmi'
		icon_state="trail"
		layer=MOB_LAYER+9
		density=0
		New()
			..()
			spawn(22)
				if(src)
					flick("trail die",src)
					sleep(2)
					del src



obj/jutsu
	fireball
		icon='KatonTechniques.dmi'
		icon_state="housenka"
		density=1
		movedelay=0.6
		layer=MOB_LAYER
		//pixel_y = 14
		//var/mob/O=src:owner
		New()
			spawn(25)
				del(src)
		Bump(A)
			if(ismob(A))
				//var/mob/M = A
				//var/mob/O=src.owner
				//M.nindamage(src.power,0,O)
				//M.Death(O)
				del(src)
			if(istype(A,/turf/))
				del(src)
			if(istype(A,/obj/))
				del(src)
		Del()
			var/mob/O=src.owner
			var/thepower=src.power*0.25
			var/obj/jutsu/fire/K=new()
			K.level=src.level
			K.loc=src.loc
			K:owner=O
			K.power=thepower
			..()


obj
	skill
		katon1
			verb
				fireball()
					set category = "Skills"
					set name = "Pheonix Flower"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+70
					if(usr.handseal(75,2))
						var/i=src.level
						if(i<1)
							i=1
						if(i>6)
							i=6
						src.levelgain(14,src.level,usr,"Pheonix Flower Jutsu")
						spawn(1)
							usr.kincrease(1)
						while(i>0)
							var/obj/jutsu/fireball/A=new()
							A.power=((usr.nin*0.20)*src.level)
							A.owner=usr;A.loc=usr.loc
							A.dir=usr.dir//;walk(A,A.dir)
							if(i==5)
								A.dir=turn(A.dir,45)
								step(A,A.dir)
								if(A)
									A.dir=usr.dir
							if(i==4)
								A.dir=turn(A.dir,-45)
								step(A,A.dir)
								if(A)
									A.dir=usr.dir
							if(i==3)
								A.dir=turn(A.dir,45)
							if(i==2)
								A.dir = turn(A.dir,-45)
							//if(A.icon=='BKatonTechniques.dmi') A.RandomAlameProc("Blue",4,1,24,32,src.dir,3,5)
							if(A)
								walk(A,A.dir)
							i-=1
							sleep(1)
		katon2
			verb
				fireball2()
					set category = "Skills"
					set name = "Fire Ball Jutsu"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(200,5))
						spawn(1)
							usr.kincrease(2)
						src.levelgain(2,src.level,usr,"Fire Ball Jutsu")
						//var/mob/O=src.owner
						usr.icon_state="Jutsu"
						usr.overlays+='KatonTechniques.dmi'
						usr.Frozen=1
						spawn(30)
							usr.icon_state=""
							usr.overlays-='KatonTechniques.dmi'
							usr.overlays-='KatonTechniques.dmi'
							usr.overlays-='KatonTechniques.dmi'
							usr.Frozen=0
						var/obj/jutsu/fire/A=new()
						var/i=src.level
						if(i<0)
							i=0
						if(i>2)
							i=2
						A.level=i
						A.loc=src.loc
						A:owner=usr
						A.power=((usr.nin*0.15)*src.level)+(usr.katonknowledge*0.05)
						if(A.power<1)
							A.power=1
						if(i==0)
							if(usr.dir==NORTH)
								A.loc=locate(usr.x,usr.y+2,usr.z)
							if(usr.dir==SOUTH)
								A.loc=locate(usr.x,usr.y-2,usr.z)
							if(usr.dir==EAST)
								A.loc=locate(usr.x+2,usr.y,usr.z)
							if(usr.dir==WEST)
								A.loc=locate(usr.x-2,usr.y,usr.z)
						if(i==1)
							if(usr.dir==NORTH)
								A.loc=locate(usr.x,usr.y+3,usr.z)
							if(usr.dir==SOUTH)
								A.loc=locate(usr.x,usr.y-3,usr.z)
							if(usr.dir==EAST)
								A.loc=locate(usr.x+3,usr.y,usr.z)
							if(usr.dir==WEST)
								A.loc=locate(usr.x-3,usr.y,usr.z)
						if(i==2)
							if(usr.dir==NORTH)
								A.loc=locate(usr.x,usr.y+(2*i),usr.z)
							if(usr.dir==SOUTH)
								A.loc=locate(usr.x,usr.y-(2*i),usr.z)
							if(usr.dir==EAST)
								A.loc=locate(usr.x+(2*i),usr.y,usr.z)
							if(usr.dir==WEST)
								A.loc=locate(usr.x-(2*i),usr.y,usr.z)
						A.dir=usr.dir
		katon3
			verb
				Gfireball()
					set category = "Skills"
					set name = "Grand Fire Ball"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(400,7))
						spawn(1)
							usr.kincrease(1.5)
						src.levelgain(4,src.level,usr,"Grand Fire Ball Jutsu")
						var/obj/jutsu/fireball2/A=new()
						var/size=src.level
						if(size>3)
							size=3
						A.level=size
						A.power=((usr.nin*0.40)+(usr.katonknowledge*0.10))*size
						if(A.power<=1)
							A.power=1
						A.owner=usr;A.loc=usr.loc
						A.dir=usr.dir;walk(A,A.dir)
		flamebullet
			verb
				FDFB()
					set category = "Skills"
					set name = "Fire Dragon Flame Bullet"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+450
					if(usr.handseal(40,10))
						spawn(1)
							usr.kincrease(2.5)
						usr.icon_state="Jutsu"
						usr.overlays+='KatonTechniques.dmi'
						usr.Frozen=1
						spawn(20)
							usr.icon_state=""
							usr.overlays-='KatonTechniques.dmi'
							usr.overlays-='KatonTechniques.dmi'
							usr.overlays-='KatonTechniques.dmi'
							usr.Frozen=0
						src.levelgain(4,src.level,usr,"Fire Dragon Flame Bullet Jutsu")
						var/obj/jutsu/dragonfire/A=new()
						var/size=src.level
						if(size<1)
							size=1
						if(size>3)
							size=3
						A.level=size
						A.power=((usr.nin*0.60)+(usr.katonknowledge*0.15))*size
						if(A.power<=1)
							A.power=1
						A.owner=usr;A.loc=usr.loc
						A.dir=usr.dir;walk(A,A.dir)
		dragonfire
			verb
				dragonfire()
					set category = "Skills"
					set name = "Dragon Fire"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+500
					if(usr.handseal(800,12))
						spawn(1)
							usr.kincrease(2.5)
						src.levelgain(4,src.level,usr,"Dragon Fire Jutsu")
						var/number=src.level
						if(number<1)
							number=1
						if(number>3)
							number=3
						while(number>0)
							var/obj/jutsu/fireball2/A=new()
							var/size=src.level
							if(size>2)
								size=2
							A.level=size
							A.power=((usr.nin*0.30)+(usr.katonknowledge*0.07))*size
							if(A.power<=1)
								A.power=1
							A.owner=usr;A.loc=usr.loc
							A.dir=usr.dir;walk(A,A.dir)
							number-=1
							sleep(4)