mob
	teacher
		Hozukiteacher
			//human = 1
			density=1
			//NPC = 1
			name="Ryu Hozuki"
			icon='Guy.dmi'
			clan="Hozuki"
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
					if(usr.suitonknowledge>=0)
						cl+="Water Gun"
					if(usr.suitonknowledge>=2000)
						cl+="Steam Imp"
				oview(src)<<"[src] Says: I am one with the water."
				sleep(3)
				if(usr.clan==src.clan)
					oview(src)<<"[src] Says: Would you like to learn of our techniques?"
					var/T = input("What to learn?","[src]") in list("Nothing") + cl
					if(T=="Nothing")
						return
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
						return
					if(T=="Water Gun")
						usr.contents += new /obj/skill/hozuki2
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else if(T=="Steam Imp")
						usr.contents += new /obj/skill/hozukifinal
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
					else
						oview(src)<<"[src] Says: The world isn't ready for that move..."























mob
	var
		hydromode=0
		hydration=0//how much water in the body
		tmp/iswater=0
		jokiboi=0
		tmp/usingjokiboi=0
		tmp/heatlevel=0
	proc
		watermode()
			spawn(1)
				if(src.hydration>=5&&src.iswater==0)
					var/mylook=src.icon
					var/mylook2=list()
					//var/mylook=list()
					mylook2+=src.overlays
					src.icon='hozukiwater.dmi'
					src.overlays-=src.overlays
					src.overlays-=src.overlays
					src.overlays-=src.overlays
					src.overlays-=src.overlays
					sleep(3)
					src.iswater=1
					flick("down",src)
					src.hydration-=5
					sleep(6)
					flick("up",src)
					sleep(6)
					src.iswater=0
					//src.icon=mylook
					src.icon=src.Oicon
					src.icon=mylook
					src.overlays-=mylook2
					src.overlays+=mylook2
					src.icon=src.Oicon
					if(src.hydration<=0)
						src.hydration=0
obj
	jutsu
		clonemist
			icon='mist.dmi'
			icon_state="lesser"
			density=0
			layer=MOB_LAYER+5
			New()
				..()
				spawn(3)
					var/mob/O = src.owner
					if(O)
						for(var/mob/M in src.loc)
							M.alldamage(src.power,O)
							M<<"The Steam burns you!"
							break
				spawn(rand(50,100))
					if(src)
						del src




obj
	skill
		hozuki
			verb
				HM()
					set category = "Skills"
					set name = "Hydro Mode"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(75,0))
						if(usr.hydromode==1)
							usr.hydromode=0
							usr<<"You turn off Hydro Mode."
						else
							usr.hydromode=1
							usr<<"You turn on HydroMode."
		hozuki2
			verb
				wg()
					set category = "Skills"
					set name = "Water Gun"
					if(usr.hydration<10)
						usr<<"Your hydration is too low to use this right now."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+250
					if(usr.handseal(200,0))
						src.levelgain(1,src.level)
						view(usr)<<"<font color=blue>[usr]: Water Bullet!"
						usr.hydration-=10
						var/obj/jutsu/watergun/A=new()
						if(src.level<1)
							A.power=usr.nin*1.2
						else
							A.power=usr.nin*2
						A.owner=usr;A.loc=usr.loc
						A.dir=usr.dir;walk(A,A.dir)
		hozukifinal
			verb
				jb()
					set category = "Skills"
					set name = "Steam Imp"//make sure hydration is at 100 for this
					if(usr.usingjokiboi)
						usr<<"You de-activate your Joki Boi."
						usr.usingjokiboi=0
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					if(usr.hydration<50)
						usr<<"You need at least 50% hydration to proform this jutsu."
						return
					src.cooldown=world.time+300
					if(usr.handseal(usr.Mchakra*0.80,0))
						usr.usingjokiboi=1
						usr<<"You create Joki Boi(Steam Imp) from the hydration in your body leaving you weakened."
						src.levelgain(5,src.level)
						var/times=src.level
						if(times<=0)
							times=1
						var/mob/npc/JokiBoi/A=new()
						if(A)
							A.name="[usr]";A.density=1;A.owner=usr;A.icon=usr.icon;A.overlays+=usr.overlays;A.loc=usr.loc
							A.jokiboi=1
							A.run=1
							A.health=usr.Mhealth
							A.Mhealth=usr.Mhealth
							A.movedelay=usr.speed3
							A.target=null
							A.Mtai=usr.tai*0.25
							A.Mnin=((usr.Mchakra*0.90)+(usr.nin*1.2))*times
							var/obj/smoke/B=new()
							B.loc=locate(A.x,A.y,A.z)
							view(A)<< sound('Smoke.wav',0,0,volume=30)
							spawn(30)
								A.jokiboiAI()

obj/jutsu
	watergun
		icon='SuitonTechniques.dmi'
		icon_state = "bullet"
		//Element="Suiton"
		density=1
		movedelay=0
		layer=MOB_LAYER+1
		New()
			..()
			spawn(50)
				del(src)
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				var/mob/O=src.owner
				if(M.clan=="Hoshigaki")
					M.nindamage(src.power*0.60,1,O)
					M.health+=src.power*0.01
				else
					M.nindamage(src.power,1,O)
				src.loc=M.loc
				src.power*=0.60
			if(istype(A,/turf/))
				del(src)
			if(istype(A,/obj/))
				del(src)



mob
	proc
		jokiboiAI()
			while(src)
				tryagain
				var/distance=0
				if(src.ko>=2)
					src.struggle+=50
				if(src.target)
					distance = get_dist(src.target,src)
				if(src.target!=null&&distance <=15)
					var/mob/M = src.target
					if(M==src.owner)
						src.target=null
						goto tryagain
					src.random=rand(1,5)
					if(src.random==2)
						if(M)
							//src.target=M
							step_towards(src,M)
							src.Attack()
					if(src.random==3)
						src.Attack()
						step_rand(src,0)
					if(src.random==4)
						if(M)
							//src.target=M
							src.Attack()
							step(src,rand(1.10))
							step_towards(src,M)
							step_towards(src,M)
							src.dir=get_dir(src,M)
							src.Attack()
					if(src.random==5)
						step_towards(src,M)
						step_towards(src,M)
						src.Attack()
						step_rand(src,0)
					if(src.random==1)
						sleep(10)
						if(M)
							step_towards(src,M)//take a step towards M
							step_towards(src,M)
							if(prob(40))
								step_rand(src,32)
								step_rand(src,32)
							//src.target=M
							if(get_dist(src,M)<=1)//if the distance is 1 or less
								if(prob(97))
									src.dir=get_dir(src,M)//Makes it so T faces M
									src.Attack()//Calls the attack proc
				else
					step_towards(src,src.owner)
					for(var/mob/M in oview(6))
						if(src.owner==M||M==src||M.owner==src.owner)

						else
							src.target=M
					sleep(30)
				sleep(1+(src.heatlevel*0.05))













mob
	proc
		explodeme()
			src.Frozen=1
			spawn(50)
				src.Frozen=0
			src.heatlevel=0
			var/number=8
			var/oldnum=number
			spawn(2)
				var/obj/hi = new/obj
				hi.icon='jokiboi.dmi'
				hi.loc = src.loc
				hi.layer = src.layer+20
				hi.dir = src.dir
				hi.pixel_x=-32
				hi.pixel_y=-32
				spawn(30)
					del hi
			view(src)<<"[src] explodes!"
			while(number>0)
				var/nownum=oldnum-number
				if(nownum<0)
					nownum=0
				for(var/turf/T in getring(src,nownum))
					var/obj/jutsu/clonemist/A=new()
					if(A)
						A.owner=src;A.power=src.nin+src.tai;A.loc=T
				number-=1
				sleep(1)
			src.health=src.Mhealth
			src.nin=src.Mnin
			src.tai=src.Mtai
			//src.Frozen=0






