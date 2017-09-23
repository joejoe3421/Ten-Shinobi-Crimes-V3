mob
	var
		upgrades=list()//for puppets mainly may add for human/player puppets too
		hpuppet=0//human puppet, if client dont delete when killed if puppet delete when killed
		cancontrol=0//how many at max your able to control at once
		tmp/controling=0//meaning you can summon as many puppets as u want but only control so many at once
		tmp/incontrol=0
		tmp/hasstrings=0//if a mob has strings then it can be controled players included. if they are a puppet and your not controlignt hem they will auto fight owner targets


mob
	puppet
		regular
			//icon='NA.dmi'
			health=500
			Mhealth=500
			//overlays=null
		humanoid
			icon='Guy.dmi'
			health=500
			Mhealth=500
			//overlays=null

obj
	skill
		puppetmaster
			verb
				puppetsummon()
					set category = "Skills"
					set name = "Puppet Master Jutsu"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+30
					if(usr.handseal(5,0))
						var/i=src.level
						if(i<1)
							i=1
						if(i>10)
							i=10
						usr.cancontrol=i
						src.levelgain(1,src.level)
						var/PupList = list()
						for(var/mob/puppet/C in usr.contents)
							PupList += C
						var/mob/puppet/T = input("Which Puppet would you like to Summon?","Puppets") in PupList + list("Cancel")
						if(T=="Cancel")
							return
						else
							if(T.health<=0||T.ko)
								usr<<"This puppet needs repairs."
								return
							T.loc = usr.loc
							T.owner = usr
							//T.owner = "[usr]"
							T.Frozen = 0
							T.stun=0
							T.health=T.Mhealth
							T.chakra=T.Mchakra
							T.tai=T.Mtai
							T.nin=T.Mnin
							T.gen=T.Mgen
							//T.summoned=1
				attachstrings()
					set category = "Skills"
					set name = "Attach Chakra Threads"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+30
					if(usr.handseal(5,0))
						var/i=src.level
						if(i<1)
							i=1
						if(i>10)
							i=10
						usr.cancontrol=i
						src.levelgain(10,src.level)
						var/PupList = list()
						for(var/mob/puppet/C in view(usr,10))
							if(C.owner==usr)
								PupList += C
						var/mob/puppet/T = input("Which Puppet would you like to attach chakra threads to?","Puppets") in PupList + list("Cancel")
						if(T=="Cancel")
							return
						else
							spawn(1)
								if(T.hasstrings)
									usr<<"The [T] puppet already has strings connected to it."
									return
								if(usr.controling>=usr.cancontrol)
									usr<<"Your already at your limit!"
									return
								T.hasstrings=1
								//T.loc=usr.loc
								usr.controling+=1
								spawn(1)
									T.puppetAI()
				dettachstrings()
					set category = "Skills"
					set name = "Remove Chakra Threads"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+30
					if(usr.handseal(5,0))
						var/i=src.level
						if(i<1)
							i=1
						if(i>10)
							i=10
						usr.cancontrol=i
						var/PupList = list()
						for(var/mob/puppet/C in world)
							if(C.owner==usr&&C.hasstrings)
								PupList += C
						var/mob/puppet/T = input("Which Puppet would you like to de-connect chakra threads from?","Puppets") in PupList + list("Cancel")
						if(T=="Cancel")
							return
						else
							spawn(1)
								T.hasstrings=0
								//T.loc=usr.loc
								usr.controling-=1
				summonallpuppets()
					set category = "Skills"
					set name = "Retrieve Puppet/s"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+10
					if(usr.handseal(5,0))
						var/i=src.level
						if(i<1)
							i=1
						if(i>10)
							i=10
						usr.cancontrol=i
						var/PupList = list()
						for(var/mob/puppet/C in world)
							if(C.owner==usr)
								PupList += C
						var/mob/puppet/T = input("Which Puppet would you like to retrieve?","Puppets") in PupList + list("All") + list("Cancel")
						if(T=="Cancel")
							return
						if(T=="All")
							for(var/mob/puppet/Y in world)
								if(Y.owner==usr)
									Y.hasstrings=0
									Y.loc=usr
							usr.controling=0

						else
							spawn(1)
								T.hasstrings=0
								T.loc=usr
								usr.controling-=1





mob
	proc
		puppetAI()
			while(src)
				var/mob/O = src.owner
				if(src.hasstrings==0)
					return
				if(O&&O.target&&src.hasstrings&&src.incontrol==0&&src.ko==0)
					if(O.CC<=30)
						O.chakra-=30/O.CC
					else
						O.chakra-=100/O.CC
					src.target=O.target
					var/distance = distance(src.target,src)
					if(src.target&&distance <=50)
						var/mob/M = src.target
						//src.random=rand(1,5)
						if(distance>=30)
							step_towards(src,M)
						else
							src.random=rand(1,5)
							if(src.random==2)
								if(M)
									//src.target=M
									step_towards(src,M)
									sleep(1)
									step_towards(src,M)
									sleep(1)
									step_towards(src,M)
									sleep(1)
									src.Attack()
									step_towards(src,M)
									sleep(1)
									step_towards(src,M)
									sleep(1)
									step_towards(src,M)
									if(prob(95))
										src.Attack()
									else
										src.usejutsu()
									sleep(1)
									step_rand(src,0)
									sleep(1)
									step_rand(src,0)
							if(src.random==3)
								if(prob(75))
									src.Attack()
								else
									src.usejutsu()
								step_rand(src,0)
								sleep(1)
								step_rand(src,0)
								sleep(1)
								step_rand(src,0)
							if(src.random==4)
								if(M)
									//src.target=M
									//src.Shushin_Behind(M)
									src.Attack()
									step(src,rand(1.10))
									sleep(1)
									step(src,src.dir)
									sleep(1)
									step(src,src.dir)
									sleep(1)
									src.dir=get_dir(src,M)
									if(prob(77))
										src.Attack()
									else
										src.usejutsu()
									sleep(1)
									step_rand(src,0)
									sleep(1)
									step_rand(src,0)
							if(src.random==5)
								step(src,rand(1,10))
								sleep(1)
								step(src,rand(1,10))
								sleep(1)
								step(src,rand(1,10))
								sleep(1)
								step(src,rand(1,10))
								if(prob(60))
									src.Attack()
								else
									src.usejutsu()
								sleep(1)
								step_rand(src,0)
								sleep(1)
								step_rand(src,0)
							if(src.random==1)
								sleep(10)
								if(M)
									step_towards(src,M)//take a step towards M
									step_towards(src,M)
									if(prob(40))
										step_rand(src,32)
										step_rand(src,32)
									//if(prob(3))
										//src.Shushin_Behind(M)
									//src.target=M
									if(get_dist(src,M)<=1)//if the distance is 1 or less
										if(prob(97))
											src.dir=get_dir(src,M)//Makes it so T faces M
											src.Attack()//Calls the attack proc
											//if(prob(6.5))
												//src.Shushin_Far_Behind(M)
											if(prob(4))
												src.usejutsu()
					else
						step_rand(src,0)
						for(var/mob/M in oview(6))
							if(src.owner!=M)
								if(src.owner!=M.owner)
									src.target=M
						sleep(30)
				else
					if(src.incontrol)
						sleep(100)
					if(!O)
						src.hasstrings=0
					sleep(60)
				sleep(2*src.movedelay)
				if(O.chakra<=10)
					src.hasstrings=0
					if(O)
						src.loc=O
					src.incontrol=0
					if(O)
						O.controling-=1
						O<<"The chakra strings attached to [src] break due to your chakra levels."
						return