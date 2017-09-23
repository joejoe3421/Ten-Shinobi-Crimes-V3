///When you add clone to AI proc make sure to make it so that NPC with owners can not use clone jutsus



obj
	skill
		shadowclone
			verb
				Clones()
					set category = "Skills"
					set name = "Shadow Clone"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(500,4))
						spawn(1)
							usr.ninincrease(1)
						var/mob/npc/elementclone/A=new()
						if(A)
							A.name="[usr]";A.density=1;A.owner=usr;A.icon=usr.icon;A.overlays+=usr.overlays;A.loc=usr.loc
							A.run=usr.run
							A.health=10
							A.Mtai=usr.Mtai*0.65
							A.Mnin=usr.Mnin*0.50
							A.Mgen=usr.Mgen*0.20
							A.tai=A.Mtai
							A.nin=A.Mnin
							A.gen=A.Mgen
							A.attackdelay=usr.attackdelay
							A.jutsus=usr.jutsus
							A.owner=usr
							A.style=usr.style
							var/obj/smoke/B=new()
							B.loc=locate(A.x,A.y,A.z)
							view(A)<< sound('Smoke.wav',0,0,volume=30)
					else
						usr<<"You failed the jutsu."
		waterclone
			verb
				wClones()
					set category = "Skills"
					set name = "Water-Clone"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(500,4))
						spawn(1)
							usr.Say("Water Clone Jutsu!")
						var/mob/npc/elementclone/A=new()
						if(A)
							A.name="[usr]";A.density=1;A.owner=usr;A.icon=usr.icon;A.overlays+=usr.overlays;A.loc=usr.loc
							A.run=usr.run
							A.health=10
							A.Mtai=usr.Mtai*0.50
							A.Mnin=usr.Mnin*0.40+(usr.suitonknowledge*0.05)
							A.Mgen=usr.Mgen*0.20
							A.element="suiton"
							A.tai=A.Mtai
							A.nin=A.Mnin
							A.gen=A.Mgen
							A.target=usr.target
							A.attackdelay=usr.attackdelay
							A.jutsus=usr.jutsus
							A.owner=usr
							A.style=usr.style
							var/obj/smoke/B=new()
							B.loc=locate(A.x,A.y,A.z)
							view(A)<< sound('Smoke.wav',0,0,volume=30)
					else
						usr<<"You failed the jutsu."
		raitonclone
			verb
				rClones()
					set category = "Skills"
					set name = "Raiton-Clone"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(500,4))
						spawn(1)
							usr.Say("Raiton Clone Jutsu!")
						var/mob/npc/elementclone/A=new()
						if(A)
							A.name="[usr]";A.density=1;A.owner=usr;A.icon=usr.icon;A.overlays+=usr.overlays;A.loc=usr.loc
							A.run=usr.run
							A.health=10
							A.Mtai=usr.Mtai*0.50
							A.Mnin=usr.Mnin*0.40+(usr.raitonknowledge*0.06)
							A.Mgen=usr.Mgen*0.20
							A.element="raiton"
							A.tai=A.Mtai
							A.nin=A.Mnin
							A.gen=A.Mgen
							A.target=usr.target
							A.attackdelay=usr.attackdelay
							A.jutsus=usr.jutsus
							A.owner=usr
							A.style=usr.style
							var/obj/smoke/B=new()
							B.loc=locate(A.x,A.y,A.z)
							view(A)<< sound('Smoke.wav',0,0,volume=30)
					else
						usr<<"You failed the jutsu."
		katonclone
			verb
				rClones()
					set category = "Skills"
					set name = "Flame Embodyment"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(500,4))
						spawn(1)
							usr.Say("Flame Embodyment!")
						var/mob/npc/elementclone/A=new()
						if(A)
							A.name="[usr]";A.density=1;A.owner=usr;A.icon=usr.icon;A.overlays+=usr.overlays;A.loc=usr.loc
							A.run=usr.run
							A.health=10
							A.Mtai=usr.Mtai*0.50
							A.Mnin=usr.Mnin*0.40+(usr.katonknowledge*0.10)
							A.Mgen=usr.Mgen*0.20
							A.element="katon"
							A.tai=A.Mtai
							A.nin=A.Mnin
							A.gen=A.Mgen
							A.target=usr.target
							A.attackdelay=usr.attackdelay
							A.jutsus=usr.jutsus
							A.owner=usr
							A.style=usr.style
							var/obj/smoke/B=new()
							B.loc=locate(A.x,A.y,A.z)
							view(A)<< sound('Smoke.wav',0,0,volume=30)
					else
						usr<<"You failed the jutsu."











mob
	proc
		cloneAI2()
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
						if(prob(80))
							src.Attack()
						else
							src.usejutsu(M)
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
						if(prob(65))
							src.Attack()
						else
							src.usejutsu(M)
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
									if(prob(90))
										src.Attack()//Calls the attack proc
									else
										src.usejutsu(M)
				else
					step_towards(src,src.owner)
					for(var/mob/M in oview(6))
						if(src.owner==M||M==src||M.owner==src.owner)

						else
							src.target=M
					sleep(30)
				sleep(src.movedelay)




