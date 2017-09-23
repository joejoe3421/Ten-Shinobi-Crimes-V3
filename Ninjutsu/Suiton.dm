mob
	teacher
		suitonteacher
			//human = 1
			density=1
			//NPC = 1
			name="Suiton Teacher"
			icon='Guy.dmi'
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				.=..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/hair='SasukeTS.dmi'
					var/icon/A='cvest.dmi'
					hair+=rgb(200,200,200)
					A+=rgb(0,0,150)
					Base+=rgb(235,145,52)
					src.icon=Base
					src.overlays+='Boxers.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+='RainJounin.dmi'
					src.overlays+=A
					src.overlays+=hair
					src.overlays+='Cloths.dmi'
					src.overlays+='headband.dmi'
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr.element=="Suiton"||usr.hassuiton)
					if(usr.suitonknowledge>=0)
						cl+="Water Spout"
					if(usr.suitonknowledge>=10)
						cl+="Water Prison"
					if(usr.suitonknowledge>=50)
						cl+="Water Creation"
					if(usr.suitonknowledge>=60)
						cl+="Water Wall"
					if(usr.suitonknowledge>=100)
						cl+="Water Clone"
					if(usr.suitonknowledge>=150)
						cl+="Water Dragon"
					if(usr.suitonknowledge>=500)
						cl+="Hidden Mist"
				oview(src)<<"[src] Says: You here to learn something?"
				var/T = input("What to learn?","Suiton") in list("Nothing") + cl
				if(T=="Nothing")
					return
				if(T in usr.jutsus)
					oview(src)<<"[src] Says: You already know this technique."
					return
				if(T=="Water Spout")
					usr.contents += new /obj/skill/suiton
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Water Creation")
					usr.contents += new /obj/skill/suiton2
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Water Clone")
					usr.contents += new /obj/skill/waterclone
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Water Dragon")
					usr.contents += new /obj/skill/suiton3
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else
					oview(src)<<"[src] Says: Sorry, I cant teach you that at this time."


























mob
	var
		suitonknowledge=0
		WaterWalkingMastery=0
mob
	proc
		sincrease(number)
			if(src.suitonknowledge<5001)
				if(prob(12))
					src.suitonknowledge+=rand(1,number)
				else
					src.suitonknowledge+=0.5





obj/wateredges
	icon = 'Beach.dmi'
	density = 0
	New()
		..()
		spawn(600)
			del(src)
	a
		icon_state = "Shore1"
		pixel_y = 32
	b
		icon_state = "Shore3"
		pixel_x = -32
	c
		icon_state = "Shore4"
		pixel_x = 32
	d
		icon_state = "Shore2"
		pixel_y = -32
	e
		icon_state = "Shore5"
		pixel_x = -32;pixel_y = 32
	f
		icon_state = "Shore6"
		pixel_x = 32;pixel_y = 32
	g
		icon_state = "Shore8"
		pixel_x = 32;pixel_y = -32
	h
		icon_state = "Shore7"
		pixel_x = -32;pixel_y = -32

obj/jutsu/water
	Owater
		icon = 'Beach.dmi'
		icon_state="water235"
		layer = TURF_LAYER
		density=0
		New()
			..()
			src.overlays+=/obj/wateredges/a
			src.overlays+=/obj/wateredges/b
			src.overlays+=/obj/wateredges/c
			src.overlays+=/obj/wateredges/d
			src.overlays+=/obj/wateredges/e
			src.overlays+=/obj/wateredges/f
			src.overlays+=/obj/wateredges/g
			src.overlays+=/obj/wateredges/h
			spawn(600)
				del(src)
		Entered(mob/M)
			if(ismob(M))
				var/counta=100;var/countb=1;var/list/L = list()
				while(countb<10)
					var/list/S = range(countb)
					for(var/mob/X in L)
						S-=X
					S<<sound('StepInWater.wav',0,0,0,14)
					for(var/mob/X in S)
						L+=X
					countb++;counta-=10
				if(M.WaterWalkingMastery!=10)
					var/Z=(rand(M.Mchakra*0.001,M.Mchakra*0.03))/(M.WaterWalkingMastery+1)
					M.chakra-=rand(Z*0.5,Z*1.5)
					if(prob(20))
						M.WaterWalkingMastery+=pick(0.01,0.02)
						if(M.WaterWalkingMastery>10)
							M.WaterWalkingMastery=10
				if(M.WaterWalkingMastery==10)
					M.chakra-=1
				if(M.clan=="Hozuki"&&M.hydration<100)
					M.hydration+=pick(2,5,2)
					if(M.hydration>=100)
						M.hydration=100
				if(prob(2))
					M.CC++
					if(M.CC>100)
						M.CC=100
				if(M.chakra<=0)
					M<<"<b>You ran out of chakra!"
					M.health-=rand(M.Mhealth*0.01,M.Mhealth*0.05)//;return
				return 1
			else return 1


obj/jutsu
	water2
		icon='SuitonTechniques.dmi'
		icon_state = "MizuRappaHead"
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
			var/obj/jutsu/MizurappaTrail/L=new()
			L.loc=src.laststep
			L.dir=src.dir
			L.owner=src.owner
			//
			var/obj/jutsu/water/Owater/U=new()
			U.loc=src.laststep
			//L.dir=src.dir
			U.owner=src.owner
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O=src.owner
				M.nindamage(src.power,0,O,"suiton")
				M.stepback(rand(1,3))
				//M.Death(O)
				del(src)
			if(istype(A,/turf/))
				del(src)
			if(istype(A,/obj/))
				del(src)
	MizurappaTrail
		icon='SuitonTechniques.dmi'
		icon_state = "MizuRappaTrail"
		//Element="Suiton"
		density=0
		layer=MOB_LAYER+1
		New()
			..()
			spawn(50) del(src)
		//Del()
			//src.CreateBubbles("Light")
			//..()
	mist
		icon='mist.dmi'
		icon_state="lesser"
		density=0
		layer=MOB_LAYER+20
		luminosity=0
		alpha = 0
		mouse_opacity = 0
		New()
			animate(src, transform = null, alpha = 255, time = 70)//time was 30
			..()
			spawn(rand(500,600))
				if(src)
					del src
obj
	jutsu
		waterdragon
			icon='SuitonTechniques.dmi'
			icon_state="SuiryuudanHead"
			density=1
			layer=MOB_LAYER+1.1
			var
				laststep=0
			New()
				..()
				spawn(80)
					if(src)
						del src
			Move()
				src.laststep=src.loc
				..()
				var/obj/jutsu/WDtail/L=new()
				L.loc=src.laststep
				L.dir=src.dir
				L.owner=src.owner
			Bump(A)
				if(ismob(A))
					var/mob/M = A
					var/mob/O=src.owner
					M.nindamage(src.power,0,O,"suiton")
					del(src)
				if(istype(A,/turf/))
					del(src)
				if(istype(A,/obj/))
					del(src)
			Del()
				for(var/turf/T in getcircle(src,1))
					if(T.density<=0)
						var/obj/jutsu/water/Owater/U=new()
						U.loc=locate(T.x,T.y,T.z)
				..()
		WDtail
			icon='SuitonTechniques.dmi'
			icon_state = "SuiryuudanBody"
			//Element="Suiton"
			density=0
			layer=MOB_LAYER+1
			New()
				..()
				spawn(30) del(src)

mob
	proc
		watercheck()
			var/yes=0
			for(var/obj/jutsu/water/Owater/T in view(2,src))
				if(T)
					yes=1
					break
			for(var/turf/Ground/Water/R in view(2,src))
				if(R)
					yes=1
					break
			return yes

obj
	skill
		suiton
			verb
				Wshot()
					set category = "Skills"
					set name = "Water Spout"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal(40,3))
						spawn(1)
							usr.sincrease(2.5)
						src.levelgain(1,src.level,usr,"Water Spout Jutsu")
						var/obj/jutsu/water2/A=new()
						if(src.level<1)
							A.power=usr.nin*0.60
						else
							A.power=usr.nin*1.2
						A.owner=usr;A.loc=usr.loc
						A.dir=usr.dir;walk(A,A.dir)
		suiton2
			verb
				Wshot2()
					set category = "Skills"
					set name = "Water Creation"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+450
					if(usr.handseal(350,5))
						spawn(1)
							usr.sincrease(3)
						src.levelgain(7,src.level,usr,"Water Creation")
						var/levelreach=1*src.level
						if(levelreach<=1)
							levelreach=1
						if(levelreach>=6)
							levelreach=6
						usr.icon_state="Jutsu"
						usr.Frozen=1
						var/obj/AW2 = new/obj
						AW2.loc = src.loc
						AW2.dir = src.dir//get_dir(AW2,O)
						AW2.pixel_x=-8
						AW2.pixel_y=-8
						AW2.layer = MOB_LAYER+1
						AW2.icon = 'Icons/water.dmi'
						AW2.icon_state="Jutsu"
						spawn(15)
							del AW2
						for(var/turf/T in getring(usr,levelreach))
							if(T.density<=0)
								var/obj/jutsu/water/Owater/U=new()
								U.loc=locate(T.x,T.y,T.z)
								U.owner=usr
						sleep(20)
						usr.icon_state=""
						usr.Frozen=0
		suiton3
			verb
				Wshot3()
					set category = "Skills"
					set name = "Water Dragon"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+500
					if(usr.handseal(650,9))
						if(usr.watercheck())
							spawn(1)
								usr.sincrease(1.5)
							src.levelgain(5,src.level,usr,"Water Dragon Jutsu")
							var/obj/jutsu/waterdragon/A=new()
							A.power=((usr.nin*0.60)*src.level)+(usr.suitonknowledge*0.20)
							A.owner=usr;A.loc=usr.loc
							A.dir=usr.dir
							if(usr.target!=null)
								while(A)
									walk_towards(A,usr.target)
									sleep(5)
							else
								walk(A,A.dir)
						else
							usr<<"You need to be near a water source."

		hiddenmist
			verb
				HM()
					set category = "Skills"
					set name  = "Hidden Mist Jutsu"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+1800
					if(usr.handseal(300,2))
						src.levelgain(5,src.level,usr,"Hidden Mist Jutsu")
						usr<<"You do the hidden mist jutsu. The size depend son the uses while the thickness depends on your chakra control."
						var/where=usr.loc
						var/levelreach=4*src.level
						if(levelreach<=4)
							levelreach=4
						if(levelreach>=16)
							levelreach=16
						var/level=0
						while(level<=levelreach)
							var/control=usr.CC
							if(control==100)
								control=99
							for(var/turf/T in getcircle(where,level))
								if(prob(usr.CC))
									var/obj/jutsu/mist/A=new()
									A.owner=usr;A.loc=locate(T.x,T.y,T.z)
								//sleep(1)
							level+=1
							sleep(20)


