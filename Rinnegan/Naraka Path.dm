mob/outerpath
	name="Outer Path"
	icon='Outer Path.dmi'
	icon_state=""
	density=1
	Frozen=1
	health=100
	layer=MOB_LAYER+0.001
	pixel_y = -12
	pixel_x = -44//was -32
	New()
		..()
		spawn(1800)
			if(src)
				del src
	Del()
		view(src)<<"[src] leaves."
		src.density=0
		for(var/mob/M in src.contents)
			M.loc=src.loc
		for(var/mob/O in world)
			if(O.key==src.owner)
				O<<"[src] has left."
		flick("leave",src)
		sleep(5)
		..()


obj
	outerpath2
		name="King Of Hell"// 6% chance king of hell brings naraka paths back to life
		icon_state=""
		New()
			..()
			spawn(600)
				del src//make delete time longer

//whata bout, you have to summon him and maybe hide him or something and while he is out your able to do your jutsu and he lasts like 3-5 minutes maybe and u can capture people with him etc
//but if they are captured and he dissapears they are free and any jutsu he was connected to casting is broken

mob
	proc
		summonop()
			var/mob/outerpath/SC = new()
			//SC.loc=src.loc
			src.Frozen=1
			spawn(10)
				src.Frozen=0
			flick("beastman",src)
			sleep(4)
			src.icon_state="beastman"
			SC.loc=usr.loc
			flick("come",SC)
			SC.health+=((src.nin*2.3)+src.gen)
			SC.owner=src.key
			spawn(4)
				src.icon_state=""









obj
	skill
		naraka//this is the line the must only contain one verb after it untill the next jutsu
			verb
				summonhk()
					set category = "Skills"
					set name = "Outer Path: Revitalize"
					var/mob/M = null
					if(usr.target==null)
						usr<<"You need a target."
						return
					if(usr.target in oview(usr,3))
						M=usr.target
					else
						usr<<"Get closer to your target."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+600
					if(usr.handseal(300,8))
						for(var/mob/outerpath/T in world)
							if(T.owner==usr.key)
								usr<<"You already have him summoned, wait till hes gone or defeated."
								return
						usr.summonop()
						sleep(10)
						usr.loc=locate(M.x+1,M.y,M.z)
						usr.dir=WEST
						var/preptime=3
						usr<<"Don't move for 3 seconds for this to work."
						spawn(5)
							usr.icon_state="punchrS"
						var/preploc1=usr.loc
						var/preploc2=M.loc
						while(preptime)
							if(usr.loc==preploc1&&M.loc==preploc2)
								preptime-=1
							else
								usr<<"You need to be still..."
								usr.icon_state=""
								for(var/mob/outerpath/T in world)
									if(T.owner==usr.key)
										del T
								return
							sleep(10)
						for(var/mob/outerpath/T in world)
							if(T.owner==usr.key)
								M.loc=T
								usr.icon_state=""
								view(T)<<"[T] ate [M]!"
								if(src.level<1)
									while(M.loc==T&&M.health<=M.Mhealth)
										M.health+=(T.health/4.7)
										sleep(10)
								if(src.level==1)
									while(M.loc==T&&M.health<=M.Mhealth)
										M.health+=(T.health/3.2)
										sleep(10)
								if(src.level==2)
									while(M.loc==T&&M.health<=M.Mhealth)
										M.health+=(T.health/1.7)
										sleep(10)
								spawn(1)
									if(src.level<2)
										src.mastery+=(3-src.level)
										if(prob(10))
											usr<<"Your getting better with the Outer Path Jutsu."
										if(src.mastery>=100)
											src.level+=1
											src.mastery-=100
											if(src.level==1)
												usr<<"Outer Path: Revitalize is now level 1, it now heals 40% more health."
											if(src.level==2)
												usr<<"Outer Path: Revitalize is now level 2, it now heals 60% more health."
												usr<<"You learned to Judge others using the outer path!"
												var/obj/skill/naraka1/B=new()
												B.loc=usr
								M.loc=T.loc
								step(M,SOUTH,32)
								M<<"You are fully healed."
								del T
								break
						//var/obj/smoke/B=new()
						//B.loc=locate(A.x,A.y,A.z)
						//view(A)<< sound('Smoke.wav',0,0,1)
					else
						usr<<"You failed the jutsu."
		naraka1
			verb
				revive()
					set category = "Skills"
					set name = "Outer Path: Digest"
					var/mob/M = null
					if(usr.target==null)
						usr<<"You need a target."
						return
					if(usr.target in oview(usr,3))
						M=usr.target
					else
						usr<<"Get closer to your target."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+900
					if(usr.handseal(300,8))
						for(var/mob/outerpath/T in world)
							if(T.owner==usr.key)
								usr<<"You already have him summoned, wait till hes gone or defeated."
								return
						usr.summonop()
						spawn(1)
							if(src.level<2)
								src.mastery+=(2-src.level)
								if(prob(10))
									usr<<"Your getting better with the Outer Path Jutsu."
								if(src.mastery>=100)
									src.level+=1
									src.mastery-=100
									if(src.level==1)
										usr<<"Outer Path: Judgemeant is now level 1, it now does 20% more damage."
									if(src.level==2)
										usr<<"Outer Path: Judgement is now level 2, it now heals 50% more damage."
										usr<<"You learned to Revive others using the outer path!"
										var/obj/skill/naraka3/B=new()
										B.loc=usr
						sleep(30)
						if(M in view(usr))
							usr.loc=locate(M.x+1,M.y,M.z)
							//M.Frozen=1
						else
							for(var/mob/outerpath/T in world)
								if(T.owner==usr.key)
									del T
							return
						usr.dir=WEST
						var/preptime=1
						//usr<<"Don't move for 15 seconds for this to work."
						spawn(5)
							usr.icon_state="punchrS"
						var/preploc1=usr.loc
						var/preploc2=M.loc
						while(preptime)
							if(usr.loc==preploc1&&M.loc==preploc2)
								preptime-=1
							else
								//usr<<"You need to be still..."
								usr.icon_state=""
								//M.Frozen=0
								for(var/mob/outerpath/T in world)
									if(T.owner==usr.key)
										del T
								return
							sleep(10)
						for(var/mob/outerpath/T in world)
							if(T.owner==usr.key)
								M.loc=T
								usr.icon_state=""
								view(T)<<"[T] ate [M]!"
								M.Frozen=1
								var/killtime=rand(6,9)
								while(M.loc==T&&M.health>=1&&killtime&&T&&M)
									spawn(1)
										if(src.level<1)
											M.nindamage((usr.nin*0.60),0,usr)
										if(src.level==1)
											M.nindamage((usr.nin*0.80),rand(1,2),usr)
										if(src.level==2)
											M.nindamage((usr.nin*1.3),rand(1,4),usr)
									killtime-=1
									sleep(10)
								M.loc=T.loc
								M.Frozen=0
								step(M,SOUTH,32)
								M<<"[T] has spit you out."
								del T
								break
		naraka2
			verb
				arearevive()
					set category = "Skills"
					set name = "Outer Path: Area Rivival"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+3000
					if(usr.handseal(300,35))
						for(var/mob/outerpath/T in world)
							if(T.owner==usr.key)
								usr<<"You already have him summoned, wait till hes gone or defeated."
								return
						usr.summonop()
						spawn(1)
							if(src.level<2)
								src.mastery+=(2-src.level)
								if(prob(10))
									usr<<"Your getting better with the Outer Path Jutsu."
								if(src.mastery>=100)
									src.level+=1
									src.mastery-=100
									if(src.level==1)
										usr<<"Outer Path: Area Revival is now level 1, its faster."
									if(src.level==2)
										usr<<"Outer Path: Area Revival is now level 2, it almost has no wait time."
						usr<<"Don't move while you complete the jutsu."
						sleep(30)
							//M.Frozen=1
						var/preptime=(20-(src.level*10))
						//usr<<"Don't move for 15 seconds for this to work."
						var/preploc1=usr.loc
						while(preptime)
							if(usr.loc==preploc1)
								preptime-=1
							else
								//usr<<"You need to be still..."
								usr.icon_state=""
								usr<<"The jutsu has been cancled..."
								//M.Frozen=0
								for(var/mob/outerpath/T in world)
									if(T.owner==usr.key)
										del T
								return
							sleep(10)
						usr<<"The jutsu is complete, you may move freely now."
						for(var/mob/outerpath/T in world)
							if(T.owner==usr.key)
								for(var/mob/Y in orange(60,T))///
									spawn(1)
										if(Y.koamm>1&&Y.ko)
											Y.overlays+='outerfire.dmi'
											sleep(50)
											Y.loc=T
											Y.icon_state=""
											view(T)<<"[T] ate [Y]!"
											Y.overlays-='outerfire.dmi'
											Y.overlays-='outerfire.dmi'
											Y.overlays-='outerfire.dmi'
											//Y.Frozen=1
											//var/killtime=rand(5,8)
											while(Y.loc==T&&Y.health<=Y.Mhealth&&T)
												Y.health+=(T.health/2)
												if(Y.health>=Y.Mhealth)
													if(Y.ko)
														Y.ko=0
													Y.ko=0
													Y.koamm=0
												sleep(10)
											Y.loc=T.loc
											sleep(5)
											step(Y,SOUTH,32)
											//Y<<"You are fully healed."
											//Y.loc=T.loc
											//M.Frozen=0
											//step(M,SOUTH,32)
											//M<<"[T] has judged you."
											var/inside=0
											for(var/mob/K in T.contents)
												inside+=1
											if(inside<=0)
												del T
								sleep(200)
								var/inside=0
								if(T)
									for(var/mob/K in T.contents)
										inside+=1
									if(inside<=0)
										del T
											//break
		naraka3//this is the line the must only contain one verb after it untill the next jutsu
			verb
				singlerevive()
					set category = "Skills"
					set name = "Outer Path: Revival"
					var/mob/M = null
					if(usr.target==null)
						usr<<"You need a target."
						return
					if(usr.target in oview(usr,6))
						M=usr.target
					else
						usr<<"Get closer to your target."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+2100
					if(usr.handseal(900,10))
						for(var/mob/outerpath/T in world)
							if(T.owner==usr.key)
								usr<<"You already have him summoned, wait till hes gone or defeated."
								return
						usr.summonop()
						spawn(1)
							if(src.level<3)
								src.mastery+=(3-src.level)
								if(prob(10))
									usr<<"Your getting better with the Outer Path Jutsu."
								if(src.mastery>=100)
									src.level+=1
									src.mastery-=100
									if(src.level==1)
										usr<<"Outer Path: Revival is now level 1, it heals more and has a higher chance at success."
									if(src.level==2)
										usr<<"Outer Path: Revival is now level 2, it's revival is almost absolute."
										usr<<"You learned to Revive all those around you at once!"
										var/obj/skill/naraka2/B=new()
										B.loc=usr
						sleep(10)
						usr.loc=locate(M.x+1,M.y,M.z)
						usr.dir=WEST
						var/preptime=15
						usr<<"Don't move for 15 seconds for this to work."
						spawn(5)
							usr.icon_state="punchrS"
						var/preploc1=usr.loc
						var/preploc2=M.loc
						while(preptime)
							if(usr.loc==preploc1&&M.loc==preploc2)
								preptime-=1
							else
								usr<<"You need to be still..."
								usr.icon_state=""
								for(var/mob/outerpath/T in world)
									if(T.owner==usr.key)
										del T
								return
							sleep(10)
						for(var/mob/outerpath/T in world)
							if(T.owner==usr.key)
								M.loc=T
								usr.icon_state=""
								view(T)<<"[T] ate [M]!"
								var/timeser=src.level
								if(timeser<1)
									timeser=1
								if(src.level<1)
									while(M.loc==T&&M.health<=M.Mhealth)
										M.health+=(T.health/(5.7-src.level))
										if(M.health>=M.Mhealth)
											if(prob(30*timeser))
												M.ko=0
												M.koamm=0
												M.icon_state=""
											else
												usr<<"The revival failed..."
												del T
												return
										sleep(10)
								M.loc=T.loc
								step(M,SOUTH,32)
								M<<"You are fully healed."
								M.chakra=M.Mchakra
								M.chakrapool=M.chakrapoolmax
								del T
								break
						//var/obj/smoke/B=new()
						//B.loc=locate(A.x,A.y,A.z)
						//view(A)<< sound('Smoke.wav',0,0,1)
					else
						usr<<"You failed the jutsu."