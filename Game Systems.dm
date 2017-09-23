///////////////------------Hand Seal System---------////////////////////////
mob
	verb
		izanagi()//delete this once you add all the componets of iznagi
			set category = "Testing"
			set name = "Izanagi Test"
			if(usr.armsharingan>0)
				if(usr.izanagi)
					usr<<"you turn izanagi off."
					usr.izanagi=0
				else
					usr<<"You turn izanagi on."
					usr.izanagi=1
			else
				usr<<"You need sharingan to use this!"







mob
	var
		endurance=0
		enduranceaddon=0
		chakraarmor=0
		tmp
			izanagi=0
			crowgen=0
			smokeclone=0
			sandarmor=0
			boneharden=0
			goldenarmor=0
		rikudoumode=0
mob
	proc
		palmeffect(dx,dy,dz,D)
			spawn()
				dx=src.x
				dy=src.y
				dz=src.z
				D=src.dir
				var/obj/o=new/obj/effect(locate(dx,dy,dz))
				o.icon='AttackEfx.dmi'
				o.layer=MOB_LAYER
				o.dir=D
				o.pixel_x=rand(-6,6)
				o.pixel_y=rand(-6,6)
				var/r=rand(7,10)
				flick("[r]",o)
				spawn(4)
					del(o)
		criticaleffect(dx,dy,dz)
			spawn()
				dx=src.x
				dy=src.y
				dz=src.z
				var/obj/o=new/obj/effect(locate(dx,dy,dz))
				o.icon='AttackEfx.dmi'
				o.layer=MOB_LAYER+1
				flick("bang",o)
				spawn(9)
					del(o)
	proc/AttackEfx(dx,dy,dz)
		spawn()
			var/obj/o=new/obj/effect(locate(dx,dy,dz))
			o.icon='AttackEfx.dmi'
			var/r=rand(1,3)
			flick("[r]",o)
			spawn(9)
				del(o)
	proc/AttackEfx4(dx,dy,dz,D)
		spawn()
			var/obj/o=new/obj/effect(locate(dx,dy,dz))
			o.icon='AttackEfx.dmi'
			o.dir=D
			o.pixel_x=rand(-6,6)
			o.pixel_y=rand(-6,6)
			var/r=rand(11,13)
			flick("[r]",o)
			spawn(4)
				del(o)
	proc/JyuukenEfx(dx,dy,dz)
		spawn()
			var/obj/o=new/obj/effect(locate(dx,dy,dz))
			o.icon='AttackEfx.dmi'
			var/r=rand(4,6)
			flick("[r]",o)
			spawn(9)
				del(o)
	proc/BangAttackEfx(dx,dy,dz)
		spawn()
			var/obj/o=new/obj/effect(locate(dx,dy,dz))
			o.icon='AttackEfx.dmi'
			flick("bang",o)
			spawn(9)
				del(o)

mob
	proc
		armorproc(number)
			//var/O = number
			if(src.susanoo)
				for(var/mob/npc/susanoo/T in view(src))
					if(T.owner==src)
						T.health-=number
						if(T.health<1)
							src<<"Your susanoo is broken."
						number=0
			if(src.skinlayers>0)
				number-=(number*(0.025*src.skinlayers))
			if(src.sandarmor)
				number-=(number*0.30)
			if(src.boneharden)
				number-=(number*0.55)
			if(src.goldenarmor)
				number-=(number*0.45)
			if(src.rikudoumode)
				//src.chakra-=number/4
				number-=(number*0.90)
			if(src.endurance>0||src.enduranceaddon>0)
				number-=(number*((src.endurance+enduranceaddon)*0.001))
			if(src.chakraarmor>0)
				number-=(number*(src.chakraarmor*0.001))
			return number
		genarmorproc(number)
			if(src.rikudoumode)
				//src.chakra-=number/4
				number-=(number*0.25)
			return number
		armorproc2(number)//------------------sage jutsu armor
			//var/O = number
			if(src.susanoo)
				for(var/mob/npc/susanoo/T in view(src))
					if(T.owner==src)
						T.health-=number
						if(T.health<1)
							src<<"Your susanoo is broken."
						number=0
			if(src.skinlayers>0)
				number-=(number*(0.0125*src.skinlayers))
			if(src.sandarmor)
				src.chakra-=number*0.125
				number-=(number*0.30)
				if(src.chakra<=50)
					src<<"You no longer have the chakra to sustain your sand armor."
					src.sandarmor=0
			if(src.boneharden)
				src.chakra-=number*0.25
				number-=(number*0.55)
				if(src.chakra<=80)
					src<<"You no longer have the chakra to sustain your bone armor."
					src.boneharden=0
			if(src.goldenarmor)
				src.chakra-=number*0.33
				number-=(number*0.45)
				if(src.chakra<=100)
					src<<"You no longer have the chakra to sustain your golden armor."
					src.goldenarmor=0
			if(src.rikudoumode)
				number-=(number*0.65)
			if(src.endurance>0||src.enduranceaddon>0)
				number-=(number*((src.endurance+enduranceaddon)*0.001))
			if(src.chakraarmor>0)
				number-=(number*(src.chakraarmor*0.001))
			return number



mob
	proc
		jutsucheck(T)
			var/pass=0
			if(T in src.contents)
				if(T)
					pass=1
			return pass


mob
	proc
		taiincrease(number)
			number*=expmult
			if(prob(20))
				if(prob(5))
					src.taiknowledge+=rand(1,number)
				else
					src.taiknowledge+=0.75*expmult
				if(src.taiknowledge<300)
					if(prob(75))
						src.taiknowledge+=0.5
		ninincrease(number)
			number*=expmult
			if(prob(85))
				if(prob(5))
					src.ninknowledge+=rand(1,number)
				else
					src.ninknowledge+=0.5*expmult
				if(src.ninknowledge<50)
					if(prob(75))
						src.ninknowledge+=pick(0.5,1)
		genincrease(number)
			number*=expmult
			if(prob(75))
				if(prob(5))
					src.genknowledge+=rand(1,number)
				else
					src.genknowledge+=0.90*expmult


mob
	proc
		taidamage(amm,blood,who,effect)
			if(who)
				if(!src)
					return
				spawn(1)
					var/mob/F=who
					var/TR=null
					if(!F)
						return
					if(F.owner!="")
						TR=F.owner
					else
						TR=who
					var/mob/O = TR
					if(!O)
						return
					if(src.clan=="Sand")
						var/hitchance=((O.tai/(O.tai+src.nin))*100)
						if(hitchance>=100)
							hitchance=99
						if(hitchance<=1)
							hitchance=1
						if(prob(hitchance))

						else
							//sand defence time
							src.dir=get_dir(src,O)
							var/obj/AW = new/obj
							AW.loc = src.loc
							AW.dir = src.dir//get_dir(AW,O)
							AW.pixel_x=-8
							AW.pixel_y=-16
							AW.layer = MOB_LAYER+1
							var/obj/AW2 = new/obj
							AW2.loc = src.loc
							AW2.dir = src.dir//get_dir(AW2,O)
							AW2.pixel_x=-8
							AW2.pixel_y=-8
							AW2.layer = MOB_LAYER-1
							AW.icon = 'sand block.dmi'
							AW2.icon = 'sand block.dmi'
							flick("over player",AW)
							flick("under player",AW2)
							//canhityou=0
							spawn(10)
								if(AW)del(AW)
								if(AW2)del(AW2)
							return
					if(src.izanagi)
						if(src.armsharingan<=0)
							src.izanagi=0
							return
						if(O.izanamiactive>0)
							src<<"Your izanagi was de-activated?!"
							O<<"Your izanami was de-activated?!"
							src.izanagi=0
							O.izanamiactive=0
						else
							var/mob/npc/Izanagiclone/A=new()
							////////////////////////////////////////------------------lose eye here
							src.armsharingan-=1
							if(A)
								A.name="[src.name]"
								//A.density=0
								A.owner=src
								A.icon=src.icon
								A.dir=src.dir
								A.overlays+=src.overlays
								A.loc=src.loc
								A.icon_state="dead"
							src.invisibility=1
							src.see_invisible=1
							spawn()
								var/list/H=list()
								for(var/turf/T in view(3,A.loc))
									if(T in view(1,A.loc))

									else
										if(T.density==0)
											H.Add(T)
								src.loc=pick(H)
								//walk(src,0)
								src.invisibility=0
								src.see_invisible=0
							src.chakra-=src.Mchakra*0.005
							return
					if(src.crowgen)
						var/mob/npc/CrowBunshin/A=new()
						if(A)
							A.name="[src.name]"
							A.owner=src
							A.icon=src.icon
							A.dir=src.dir
							A.overlays+=src.overlays
							A.loc=src.loc
							A.icon_state=src.icon_state
							A.tai=src.tai*0.25
							A.target=O
						if(src.gen>O.gen&&O.target==src)
							if(O.client)
								for(var/image/x in O.client.images)
									if(x.icon=='target.dmi')
										del(x)
								var/image/I = image('target.dmi',A)
								I.layer=FLOAT_LAYER
								O<<I
								O.target=A
								//A.target=O
							else
								O.target=A
								//A.target=O
						src.invisibility=1
						src.see_invisible=1
						spawn(1)
							src.stepback(4)
							sleep(15)
							src.invisibility=0
							src.see_invisible=0
							//src.movedelay=olddelay
						src.chakra-=src.Mchakra*0.05//npc teach crow style genjutsu
						src.crowgen-=1
						return
					if(src.smokeclone)

						src.chakra-=src.Mchakra*0.067//only those who have the element mix can use this type fo clone
						return
					if(src.hydromode&&src.hydration>=5)
						src.watermode()
						return
					if(src.iswater)
						return
					var/damage=amm
					//var/mob/O = who
					if(O.sagemode)
						damage=src.armorproc2(damage*1.1)
					else
						damage=src.armorproc(damage)
					if(src.bossevent)
						damage=damage*pick(0.05,0.10)
					if(O.client)
						if(O.bossevent)
							damage*=rand(3,5)
					if(src.guard)
						damage-=(src.tai/4)
					if(damage<0)
						damage=0
					/*if(src.clan=="Sand")
						var/hitchance=((O.tai/(O.tai+src.nin))*100)
						if(hitchance>=100)
							hitchance=99
						if(hitchance<=1)
							hitchance=1
						if(prob(hitchance))
							src.health-=damage
							spawn(1)
								if(prob(40))
									spawn() src.voice("h")
							if(blood>0)
								spawn()
									while(blood)
										//spawn blood here
										//make the blood have an orner for the jashins who need it to
										blood-=1
										sleep(1)
							src.Death(who)
							return
						else
							//sand defence time
							var/obj/AW = new/obj
							AW.loc = src.loc
							AW.dir = src.dir
							AW.pixel_x=-16
							AW.layer = MOB_LAYER+1
							var/obj/AW2 = new/obj
							AW2.loc = src.loc
							AW2.dir = src.dir
							AW2.pixel_x=-16
							AW2.layer = MOB_LAYER-1
							AW.icon = 'sand block.dmi'
							AW2.icon = 'sand block.dmi'
							flick("over player",AW)
							flick("under player",AW2)
							//canhityou=0
							spawn(10)
								if(AW)del(AW)
								if(AW2)del(AW2)
							return*/
					src.infight=40
					if(src.sharkskin&&O.sharkskin==0)
						src.health-=damage*0.97
						O.weapondamage(damage*0.03,pick(0,1,0),src)
					else
						src.health-=damage
					src.koby=O
					if(src.guard==0&&src.doingseals==0&&src.chakracharge==0)
						flick("hit",src)
					spawn(1)
						if(prob(5)&&damage>0)
							spawn() src.voice("h")
					if(blood>0)
						spawn()
							while(blood)
								src.Blood()
								blood-=1
								sleep(1)
					src.Death(O)
		weapondamage(amm,blood,who,effect)
			if(who)
				if(!src)
					return
				spawn(1)
					var/mob/F=who
					var/TR=null
					if(F.owner!="")
						TR=F.owner
					else
						TR=who
					var/mob/O = TR
					if(!O)
						return
					if(src.clan=="Sand")
						var/hitchance=((O.tai/(O.tai*1.5+src.nin))*100)
						if(hitchance>=100)
							hitchance=99
						if(hitchance<=1)
							hitchance=1
						if(prob(hitchance))

						else
							src.dir=get_dir(src,O)
							var/obj/AW = new/obj
							AW.loc = src.loc
							AW.dir = src.dir
							AW.pixel_x=-8
							AW.pixel_y=-16
							AW.layer = MOB_LAYER+1
							var/obj/AW2 = new/obj
							AW2.loc = src.loc
							AW2.dir = src.dir
							AW2.pixel_x=-8
							AW2.pixel_y=-8
							AW2.layer = MOB_LAYER-1
							AW.icon = 'sand block.dmi'
							AW2.icon = 'sand block.dmi'
							flick("over player",AW)
							flick("under player",AW2)
							//canhityou=0
							spawn(10)
								if(AW)del(AW)
								if(AW2)del(AW2)
							return
					if(src.izanagi)
						if(src.armsharingan<=0)
							src.izanagi=0
							return
						if(O.izanamiactive>0)
							src<<"Your izanagi was de-activated?!"
							O<<"Your izanami was de-activated?!"
							src.izanagi=0
							O.izanamiactive=0
						else
							var/mob/npc/Izanagiclone/A=new()
							////////////////////////////////////////------------------lose eye here
							src.armsharingan-=1
							if(A)
								A.name="[src.name]"
								//A.density=0
								A.owner=src
								A.icon=src.icon
								A.dir=src.dir
								A.overlays+=src.overlays
								A.loc=src.loc
								A.icon_state="dead"
							src.invisibility=1
							src.see_invisible=1
							spawn()
								var/list/H=list()
								for(var/turf/T in view(3,A.loc))
									if(T in view(1,A.loc))

									else
										if(T.density==0)
											H.Add(T)
								src.loc=pick(H)
								//walk(src,0)
								src.invisibility=0
								src.see_invisible=0
							src.chakra-=src.Mchakra*0.005
							return
					if(src.crowgen)
						var/mob/npc/CrowBunshin/A=new()
						if(A)
							A.name="[src.name]"
							A.owner=src
							A.icon=src.icon
							A.dir=src.dir
							A.overlays+=src.overlays
							A.loc=src.loc
							A.icon_state=src.icon_state
						if(src.gen>O.gen)
							if(O.client)
								for(var/image/x in O.client.images)
									if(x.icon=='target.dmi')
										del(x)
								var/image/I = image('target.dmi',A)
								O<<I
								O.target=A
							else
								O.target=A
						src.invisibility=1
						src.see_invisible=1
						spawn(1)
							src.stepback(4)
							sleep(15)
							src.Shushin_Behind(O)
							src.invisibility=0
							src.see_invisible=0
							//src.movedelay=olddelay
						src.chakra-=src.Mchakra*0.05//npc teach crow style genjutsu
						src.crowgen-=1
						return
					if(src.smokeclone)

						src.chakra-=src.Mchakra*0.067//only those who have the element mix can use this type fo clone
						return
					if(src.hydromode&&src.hydration>=5)
						src.watermode()
						return
					if(src.iswater)
						return
					var/damage=amm
					if(O.sagemode)
						damage=src.armorproc2(damage+(damage*(O.sagepower*0.20)))
					else
						damage=src.armorproc(damage*rand(1.01,1.03))
					//damage=src.armorproc(damage)
					//var/mob/O = who
					if(src.bossevent)
						damage=damage*pick(0.05,0.10)
					if(O.bossevent)
						damage*=rand(3,5)
					if(src.guard)
						damage-=(src.tai/5.5)
					if(damage<0)
						damage=0
					if(F.weapon=="Chakra Rod")/////////////weapon type-------------------------------<<<<<----
						damage*=0.50
						spawn(1)
							src.rinnehit()
					src.infight=40
					src.health-=damage
					src.koby=O
					spawn(1)
						if(prob(5)&&damage>0)
							spawn() src.voice("h")
					if(blood>0)
						spawn()
							while(blood>0)
								src.Blood()
								blood-=1
								sleep(1)
					src.Death(O)


mob
	proc
		nindamage(amm,blood,who,effect)
			if(who)
				if(!src)
					return
				spawn(1)
					var/bonus=effect
					var/mob/F=who
					var/TR=null
					if(F.owner!="")
						TR=F.owner
					else
						TR=who
					var/mob/O = TR
					if(!O)
						return
					if(src.clan=="Sand")
						var/hitchance=((amm+src.nin*0.30)*100)
						if(hitchance>=100)
							hitchance=99
						if(hitchance<=1)
							hitchance=1
						if(prob(hitchance))

						else
							//sand defence time
							var/obj/AW = new/obj
							AW.loc = src.loc
							AW.dir = get_dir(AW,O)
							AW.pixel_x=-8
							AW.pixel_y=-16
							AW.layer = MOB_LAYER+1
							var/obj/AW2 = new/obj
							AW2.loc = src.loc
							AW2.dir = get_dir(AW2,O)
							AW2.pixel_x=-8
							AW2.pixel_y=-8
							AW2.layer = MOB_LAYER-1
							AW.icon = 'sand block.dmi'
							AW2.icon = 'sand block.dmi'
							flick("over player",AW)
							flick("under player",AW2)
							//canhityou=0
							spawn(10)
								if(AW)del(AW)
								if(AW2)del(AW2)
							return
					if(src.izanagi)
						if(src.armsharingan<=0)
							src.izanagi=0
							return
						if(O.izanamiactive>0)
							src<<"Your izanagi was de-activated?!"
							O<<"Your izanami was de-activated?!"
							src.izanagi=0
							O.izanamiactive=0
						else
							var/mob/npc/Izanagiclone/A=new()
							////////////////////////////////////////------------------lose eye here
							src.armsharingan-=1
							if(A)
								A.name="[src.name]"
								//A.density=0
								A.owner=src
								A.icon=src.icon
								A.dir=src.dir
								A.overlays+=src.overlays
								A.loc=src.loc
								A.icon_state="dead"
							src.invisibility=1
							src.see_invisible=1
							spawn()
								var/list/H=list()
								for(var/turf/T in view(3,A.loc))
									if(T in view(1,A.loc))

									else
										if(T.density==0)
											H.Add(T)
								src.loc=pick(H)
								//walk(src,0)
								src.invisibility=0
								src.see_invisible=0
							src.chakra-=src.Mchakra*0.005
							return
					if(src.smokeclone)

						src.chakra-=src.Mchakra*0.067//only those who have the element mix can use this type fo clone
						return
					if(src.hydromode&&src.hydration>=5&&bonus!="katon"&&bonus!="raiton")
						src.watermode()
						return
					if(src.iswater)
						return
					if(src.absorbing)
						src.chakra+=amm*0.25
						src<<"You absorb [amm*0.25] chakra from the attack."
						if(src.chakra>src.Mchakra*3)
							src.chakra=src.Mchakra*3
						return
					var/damage=amm
					if(bonus=="suiton"&&src.clan=="Hoshigaki")
						src.health+=damage*0.10
						damage*=0.40
					if(src.clan=="Hoshigaki"&&bonus=="katon")
						damage*=1.3
					if(src.hydromode&&bonus=="katon")
						damage*=1.2
						if(hydration>=1)
							src.hydration-=1
					if(src.hydromode&&bonus=="raiton"||src.hydromode&&bonus=="raiton2")
						damage*=2
					if(bonus=="raiton"&&src.raitonarmor>=1)
						if(prob(40))
							src<<"Your raiton armor absorbed the damage."
						damage=0
					if(bonus=="raiton"||bonus=="raiton2")
						if(prob(35))
							src.stun+=1
					if(O.sagemode)
						damage=src.armorproc2(damage+(damage*O.sagepower))
					else
						damage=src.armorproc(damage*rand(1.01,1.03))
					//damage=src.armorproc(damage*rand(1.1,1.3))
					//var/mob/O = who
					if(src.bossevent)
						damage=damage*pick(0.05,0.10)
					if(O.bossevent)
						damage*=rand(3,5)
					if(src.guard)
						damage-=(src.tai/rand(5,8))
					if(damage<0)
						damage=0
					src.infight=40
					src.health-=damage
					src.koby=O
					spawn(1)
						if(prob(20))
							spawn() src.voice("h")
					if(blood>0)
						spawn()
							while(blood)
								src.Blood()
								blood-=1
								sleep(1)
					src.Death(O)


mob
	proc
		gendamage(amm,who)
			if(who)
				if(src.ko)
					return
				spawn(1)
					var/damage=amm
					damage=src.genarmorproc(damage)
					var/mob/F=who
					var/TR=null
					if(F.owner!="")
						TR=F.owner
					else
						TR=who
					var/mob/O = TR
					if(!O)
						return
					if(src.bossevent)
						damage=damage*pick(0.05,0.10)
					if(O.bossevent)
						damage*=rand(3,5)
					if(damage<0)
						damage=0
					src.infight=40
					src.health-=damage
					src.koby=O
					spawn(1)
						if(prob(40))
							spawn() src.voice("h")
					src.Death(O)
		alldamage(amm,who)
			if(who)
				if(src.ko)
					return
				spawn(1)
					var/damage=amm
					damage=src.genarmorproc(damage)
					var/mob/F=who
					var/TR=null
					if(F.owner!="")
						TR=F.owner
					else
						TR=who
					var/mob/O = TR
					if(!O)
						return
					if(src.bossevent)
						damage=damage*pick(0.05,0.10)
					if(O.bossevent)
						damage*=rand(3,5)
					if(damage<0)
						damage=0
					src.infight=40
					src.health-=damage
					src.koby=O
					spawn(1)
						if(prob(10))
							spawn() src.voice("h")
					src.Death(O)




mob
	proc
		stepback(K)
			spawn(1)
				if(!src||Frozen||src.ko)return
				//K*=2

				while(K)
					if(!src||Frozen)return
					K--
					var/image=new/obj/kimage(loc)
					image:dir=dir
					image:icon=icon
					image:overlays=overlays
					image:icon_state=icon_state
					image:invisibility=invisibility
					//moving=0
					var/P=dir
					if(dir==NORTH)step(src,SOUTH)
					if(dir==SOUTH)step(src,NORTH)
					if(dir==EAST)step(src,WEST)
					if(dir==WEST)step(src,EAST)
					if(dir==NORTHEAST)step(src,SOUTHWEST)
					if(dir==SOUTHWEST)step(src,NORTHEAST)
					if(dir==SOUTHEAST)step(src,NORTHWEST)
					if(dir==NORTHWEST)step(src,SOUTHEAST)
					dir=P
					//runstep=0
					sleep(1)
mob
	proc
		stepback2(K,dir)
			//if(!src||Frozen||!client||npc)return
			while(K>0)
				K--
				var/image=new/obj/kimage(loc)
				image:dir=dir
				image:icon=null
				image:overlays=overlays
				image:invisibility=invisibility
				var/P=dir
				step(src,dir)
				//step(src,NORTH)
				//step(src,WEST)
				//step(src,EAST)
				dir=P
				sleep(1)


obj
	kimage
		name="Afterimage"
		icon_state=""
		New()spawn(1)del src










mob
	var
		tmp/doingseals=0
		tmp/didseals=0
		sealspeed=3
		sealac=10
		tmp/dids=0
		CC=10
		tmp/bind=0

mob
	proc
		handseal(jchakra,seals)
			if(src.doingseals)
				src<<"Your currently doing hands seals, wait till you finish."
				return
			if(src.bind>0||src.ko||src.dead||src.Frozen||src.absorbing||src.insand||src.intsu||src.rtornado||src.doing||src.inmindtransfer||src.resting)
				src<<"Not now."
				return
			if(seals>=1&&src.rasenganon>=1)
				src<<"Your hands are a little busy right now."
				return
			if(seals>=1&&src.chidorion>=1)
				src<<"Your hands are a little busy right now."
				return
			if(src.gates>=3&&seals>=1)
				src<<"<b>Your hands slipped! Your muscles are twitching too quickly to form handseals!</b>"
				return
			if(prob(sealac))
				if(seals>1)
					src<<"You begin doing handseals."
					src.doingseals=1
					while(seals)
						if(src.ko<=0||src.dead<=0&&src.insand<=0)
							seals--
							spawn(1)
								flick("handseals",src)
								view(src)<< sound('SEAL1.wav',0,0,volume=20)
							//src<< sound('SEAL1.wav',1,0,1);sleep(sealspeed);src<<sound(0,0,1);viewers()<<sound('SEAL2.wav',0,0,1)
						else
							src<<"You stop doing hand seals."
							src.doingseals=0
							return
						sleep(sealspeed)
					flick("handseal",src)
					view(src)<< sound('SEAL2.wav',0,0,volume=25)
					src.dids=1
					src.doingseals=0
					if(src.sealspeed>0.010)
						if(src.sealspeed>1.888)
							if(prob(10))
								src.sealspeed-=0.02//rand(0.01,0.1)
								src<<"You get faster at your hand seals."
						else
							if(prob(5))
								src.sealspeed-=0.01
					if(src.sealspeed<0.010)
						src.sealspeed=0.010
					if(src.sealac<100)
						if(prob(18))
							src.sealac+=20
							if(src.sealac>100)
								src.sealac=100
					//src.didseals=1
					if(prob(CC))
						var/ST = src.sageenergyuse
						if(src.sagemode)
							src.chakra-=(jchakra*(1-ST))
							src.nenergy-=(jchakra*ST)
						else
							src.chakra-=jchakra
						if(CC<100)
							src<<"You performed the jutsu perfectly."
							if(prob(32))
								src.CC+=rand(0.5,2)
								if(src.CC>100)
									src.CC=100
					else
						var/u=pick("1","2","3")
						var/chakrataken = 1
						if(u=="1")
							src<<"You used more than enough chakra performing the jutsu!"
							chakrataken=1.5
						if(u=="3")
							src<<"You used a little more chakra than the jutsu needed but still managed to do it!"
							chakrataken=1.2
						if(u=="2")
							src<<"You used way to much chakra performing the jutsu!"
							chakrataken=rand(1.8,2.3)
						if(src.sagemode)
							var/ST2 = src.sageenergyuse
							src.chakra-=((jchakra*chakrataken)*(1-ST2))
							src.nenergy-=((jchakra*chakrataken)*ST2)
						else
							src.chakra-=(jchakra*chakrataken)
				else
					if(prob(CC))
						var/ST3 = src.sageenergyuse
						if(src.sagemode)
							src.chakra-=(jchakra*(1-ST3))
							src.nenergy-=(jchakra*ST3)
						else
							src.chakra-=jchakra
						if(CC<100)
							src<<"You performed the jutsu perfectly."
							if(prob(32))
								src.CC+=rand(0.5,1)
								if(src.CC>100)
									src.CC=100
					else
						var/u=pick("1","2","3")
						var/chakrataken = 1
						if(u=="1")
							src<<"You used more than enough chakra performing the jutsu!"
							chakrataken=1.5
						if(u=="3")
							src<<"You used a little more chakra than the jutsu needed but still managed to do it!"
							chakrataken=1.2
						if(u=="2")
							src<<"You used way to much chakra performing the jutsu!"
							chakrataken=rand(1.8,2.3)
						if(src.sagemode)
							var/ST4 = src.sageenergyuse
							src.chakra-=((jchakra*chakrataken)*(1-ST4))
							src.nenergy-=((jchakra*chakrataken)*ST4)
						else
							src.chakra-=(jchakra*chakrataken)
				return 1
			else
				if(seals>1)
					src<<"You messed up the hand seals!"
					return 0
				else
					return 1
mob
	proc
		Blood()
			spawn()
				var/random=rand(1,13)
				if(random>5) return
				var/obj/o=new/obj/effect(locate(src.x,src.y,src.z))
				o.icon='Blood.dmi'
				var/r=rand(1,7)
				flick("[r]",o)
				var/obj/blood/x=new()
				x.owner=src;x.loc=src.loc
				//view(src)<<"[src] bleeds!"
				spawn(9)
					del(o)
					if(!x)return
					//x.icon='Blood.dmi'
					var/v=rand(1,7)
					x.pixel_x=rand(-8,8)
					x.pixel_y=rand(-8,8)
					x.icon_state="l[v]"


obj
	effect

	blood
		icon='Blood.dmi'
		icon_state=""
		layer=TURF_LAYER
		New()
			..()
			spawn(rand(1200,3000))
				del src



mob
	var
		taiknow=0
		ninknow=0
		genknow=0
		kinknow=0//forbidden
		fuinknow=0//sealing



mob
	var
		haskaton=0
		hassuiton=0
		hasfuuton=0
		hasdoton=0
		hasraiton=0
		element="None"
		basic=0
		hasamat=0//has amat
		hassus=0//has susano
		hassm=0 //has sage mode
		hytech=0
		katon1=0
		katon2=0
		suiton=0
		raiton=0
		doton=0
		fuuton=0
		lava=0//count up the latter liek hyuuga techs
		cooldown = list()
		skilllist = list()



//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//////////////////////////////

mob
	var
		useshushin=0
		shunshin=0
		//Move_Delay=0
		//MoveDelay=1
		//Running=0
		//walks=1

mob/proc
	Shushin_Behind(mob/M)
		if(M.z==20)
			return
		if(src.Frozen||src.ko)
			return 0
		if(src.useshushin) return
		if(src.z!=M.z) return
		if(src.ko) return
		src.dir=get_dir(src,M)
		if(M.dir==NORTH)
			var/turf/T = locate(M.x,M.y-1,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==SOUTH)
			var/turf/T = locate(M.x,M.y+1,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==WEST)
			var/turf/T = locate(M.x-1,M.y,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==EAST)
			var/turf/T = locate(M.x+1,M.y,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==NORTHWEST)
			var/turf/T = locate(M.x-1,M.y+1,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==NORTHEAST)
			var/turf/T = locate(M.x+1,M.y+1,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==SOUTHWEST)
			var/turf/T = locate(M.x-1,M.y-1,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==SOUTHEAST)
			var/turf/T = locate(M.x+1,M.y-1,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		src.dir=get_dir(src,M)
	Shushin_Far_Behind(mob/M)
		if(M.z==20)
			return
		if(src.Frozen||src.ko)
			return 0
		if(src.useshushin) return
		if(src.z!=M.z) return
		if(src.ko) return
		src.dir=get_dir(src,M)
		if(M.dir==NORTH)
			var/turf/T = locate(M.x,M.y-4,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==SOUTH)
			var/turf/T = locate(M.x,M.y+4,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==WEST)
			var/turf/T = locate(M.x-4,M.y,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==EAST)
			var/turf/T = locate(M.x+4,M.y,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==NORTHWEST)
			var/turf/T = locate(M.x-4,M.y+4,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==NORTHEAST)
			var/turf/T = locate(M.x+4,M.y+4,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==SOUTHWEST)
			var/turf/T = locate(M.x-4,M.y-4,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		if(M.dir==SOUTHEAST)
			var/turf/T = locate(M.x+4,M.y-4,M.z)
			if(!T) return
			if(T.density) return
			src.loc = T
			//src.overlays-='Icons/Jutsus/Shushin.dmi'
			//src.overlays+='Icons/Jutsus/Shushin.dmi'
			src.useshushin=1
			spawn(10)
				src.useshushin=0
				src.shunshin=0
				//src.overlays-='Icons/Jutsus/Shushin.dmi'
		src.dir=get_dir(src,M)











proc
	worldreboot(TTime)
		var/ANNC="<font color=red><b>Server Announcement:</b><font color=blue>"
		if(TTime<=0)
			return
		while(TTime>600)
			world<<"[ANNC] World Rebooting In [TTime/10] Seconds, or [TTime/600] Minutes."
			TTime-=600
			sleep(600)
		while(TTime>100)
			world<<"[ANNC] World Rebooting In [TTime/10] Seconds."
			TTime-=100
			sleep(100)
		while(TTime>=10)
			world<<"[ANNC] World Rebooting In [TTime/10] Seconds."
			TTime-=10
			sleep(10)
		world<<"[ANNC] World Rebooting Now!"
		spawn(2)
		world.Reboot()



