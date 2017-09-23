mob
	var
		webmastery=0
		spidergoldmastery=0







mob
	teacher
		Spiderteacher
			//human = 1
			density=1
			//NPC = 1
			name="Kidou"
			icon='Guy.dmi'
			clan="Spider"
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				.=..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi';Base+=rgb(235,145,52)
					var/icon/A='cvest.dmi';A+=rgb(0,0,150)
					var/Hair='inoH.dmi';Hair+=rgb(0,150,0)
					src.icon=Base
					src.overlays-='Boxers.dmi';src.overlays+='Boxers.dmi'
					src.overlays-='MaleEyes.dmi';src.overlays+='MaleEyes.dmi'
					src.overlays-='Eyes.dmi';src.overlays+='Eyes.dmi'
					src.overlays-='RainJounin.dmi';src.overlays+='RainJounin.dmi'
					src.overlays+=A
					src.overlays-='Cloths.dmi';src.overlays+='Cloths.dmi'
					src.overlays-=Hair;src.overlays+=Hair
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr.clan==src.clan)
					if(usr.webmastery>=0)
						cl+="Spider Web"
					if(usr.spidergoldmastery>=0&&usr.webmastery>=5)
						cl+="Golden Armor"
					if(usr.spidergoldmastery>=10)
						cl+="Golden Kunai"
					if(usr.spidergoldmastery>=50)
						cl+="Golden Arrow"
					if(usr.webmastery>=50)
						cl+="Spider Summon"
				oview(src)<<"[src] Says: I got bit by a spider the other day and I feel strange now."
				sleep(3)
				if(usr.clan==src.clan)
					oview(src)<<"[src] Says: Did you get bitten too?"
					var/T = input("What to learn?","[src]") in list("Nothing") + cl
					if(T=="Nothing")
						return
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
						return
					if(T=="Spider Web")
						usr.contents += new /obj/skill/spider1
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
					else if(T=="Golden Armor")
						usr.contents += new /obj/skill/spider3
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
					else if(T=="Golden Kunai")
						usr.contents += new /obj/skill/spider2
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
					else
						oview(src)<<"[src] Says: The world isn't ready for that move..."



















obj/jutsu/spider/web
	icon='SpiderTechniques.dmi'
	icon_state="5"
	layer=TURF_LAYER+1
	density=0
	New()
		..()
		overlays+=/obj/jutsu/spider/web/A
		overlays+=/obj/jutsu/spider/web/B
		overlays+=/obj/jutsu/spider/web/C
		overlays+=/obj/jutsu/spider/web/D
		overlays+=/obj/jutsu/spider/web/E
		overlays+=/obj/jutsu/spider/web/F
		overlays+=/obj/jutsu/spider/web/G
		overlays+=/obj/jutsu/spider/web/H
		spawn()
			while(src)
				sleep(5)
				var/mob/O=src.owner
				for(var/mob/M in view(1,src))
					if(M!=O)
						M.stun+=rand(3,5)
				/*for(var/obj/jutsu/spider/kunai/A in oview(1,src))
					A.Frozen=1
				for(var/obj/jutsu/spider/arrow/A in oview(1,src))
					A.Frozen=1*/
		spawn(300)
			del(src)
	Del()
		for(var/obj/jutsu/spider/kunai/A in oview(1,src))
			A.Frozen=0
		/*for(var/obj/jutsu/spider/arrow/A in oview(1,src))
			A.Frozen=0*/
		..()
	A
		icon_state="1"
		pixel_x = -32
		pixel_y = 32
	B
		icon_state="5"
		pixel_y = 32
	C
		icon_state="3"
		pixel_x = 32
		pixel_y = 32
	D
		icon_state="5"
		pixel_x = -32
	E
		icon_state="5"
		pixel_x = 32
	F
		icon_state="7"
		pixel_x = -32
		pixel_y = -32
	G
		icon_state="5"
		pixel_y = -32
	H
		icon_state="8"
		pixel_x = 32
		pixel_y = -32


obj/jutsu/spider/kunai
	icon = 'SpiderTechniques.dmi'
	icon_state = "NenkinKunai"
	density = 1
	movedelay=0.7
	New()
		..()
		spawn(25)
			del(src)
	Bump(A)
		if(ismob(A))
			var/mob/M = A
			var/mob/O=src.owner
			M.weapondamage(src.power,1,O)
			del(src)
		if(istype(A,/turf/))
			del(src)
		if(istype(A,/obj/))
			del(src)


obj/jutsu/spider/webshot
	icon='SpiderTechniques.dmi'
	icon_state="Shot"
	density=1
	layer = MOB_LAYER+999999
	movedelay=0.8
	New()
		..()
		spawn(20)
			del(src)
	Bump(A)
		if(ismob(A))
			var/mob/M = A
			if(M==src.owner)
				return
			del(src)
		if(istype(A,/turf/))
			del(src)
		if(istype(A,/obj/))
			del(src)
	Del()
		var/obj/jutsu/spider/web/K = new /obj/jutsu/spider/web;K.loc=src.loc;K.owner=src.owner
		..()



obj
	skill
		spider1
			verb
				Wshot()
					set category = "Skills"
					set name = "Spider Web"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+200
					if(usr.handseal(usr.Mchakra*0.03,1))
						var/i=src.level
						if(i<1)
							i=1
						if(i>3)
							i=3
						spawn(1)
							if(usr.webmastery<100)
								if(prob(20))
									usr.webmastery+=0.1
						src.levelgain(3,src.level,usr,"Spider Web Shot")
						while(i>0)
							var/obj/jutsu/spider/webshot/A=new()
							A.power=((usr.nin*0.20)*src.level)
							A.owner=usr;A.loc=usr.loc
							A.dir=usr.dir//;walk(A,A.dir)
							if(i==3)
								A.dir=turn(A.dir,45)
								step(A,A.dir)
								if(A)
									A.dir=usr.dir
							if(i==2)
								A.dir=turn(A.dir,-45)
								step(A,A.dir)
								if(A)
									A.dir=usr.dir
							//if(A.icon=='BKatonTechniques.dmi') A.RandomAlameProc("Blue",4,1,24,32,src.dir,3,5)
							if(A)
								walk(A,A.dir)
							i-=1
							sleep(1)
		spider2
			verb
				Gkunai()
					set category = "Skills"
					set name = "Golden Kunai"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+70
					if(usr.handseal(usr.Mchakra*0.02,1))
						spawn(1)
							if(usr.spidergoldmastery<100)
								if(prob(20))
									usr.spidergoldmastery+=0.1
						src.levelgain(1,src.level)
						var/obj/jutsu/spider/kunai/A=new()
						if(src.level<1)
							A.power=(usr.nin*0.60)+usr.spidergoldmastery
						else
							A.power=(usr.nin*1.2)+usr.spidergoldmastery
						A.owner=usr
						A.loc=usr.loc
						A.dir=usr.dir
						walk(A,A.dir)
		spider3
			verb
				Garmor()
					set category = "Skills"
					set name = "Golden Armor"
					if(usr.goldenarmor)
						usr<<"You release your golden armor."
						usr.goldenarmor=0
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal(100,3))
						spawn(1)
							if(usr.spidergoldmastery<100)
								if(prob(20))
									usr.spidergoldmastery+=0.1
						if(usr.goldenarmor)
							usr<<"You release your golden armor."
							usr.goldenarmor=0
						else
							usr<<"You cover yourself in your sticky golden armor."
							usr.goldenarmor=1
							spawn(10)
								while(usr&&usr.goldenarmor>0)
									usr.chakra-=(usr.Mchakra*0.015)+30
									if(usr.chakra<=0)
										usr.goldenarmor=0
										usr<<"You ran out of chakra to keep your Golden armor active."
									sleep(rand(7,25))
								usr.goldenarmor=0















