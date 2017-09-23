mob
	var
		koamm=0
		killedby=null
		tmp/spammkilled=0
		tmp/struggle=0
		special=""


mob
	proc
		Death2(mob/M)//make them die for about 3 minutes
			set background=1
			spawn(1)
				if(src.health<=0&&src.merchant)
					return
				if(src)
					if(!src)
						return
					else
						if(istype(src,/mob/npc/Corpse))
							return
						//src.koby=M
						src.ko = 3
						src.icon_state="dead"
						if(!src.client&&src.fake&&src.reanimated==0)
							sleep(50)
							del src
							return
						if(src.merchant)
							return
						//src.wounds += rand(8,17)
						//src.canthear = 1
						spawn(1)
							if(M&&M.rinnegan==0)
								if(M.clan=="Uchiha"&&M.hasems)
									if("Senju" in M.implants&&(M.kills-M.deaths)>=30)
										if(src.clan=="Uchiha")
											if(prob(7))
												M.rinneactivate()
										else
											if(prob(4))
												M.rinneactivate()
								else
									if("Senju" in M.implants&&M.rinnepoten)
										if(prob(0.1)&&(M.kills-M.deaths)>=5)
											M.rinneactivate()
						if(!src.client)
							if(src.summon)
								del src
								return
						if(src.reanimated)
							spawn(1)
								src.edorecover()
							return
						if(src.skinlayers>=1)
							src.shinshed()
						if(src.client&&src.level<15&&usr.opening<6)
							src.notdeadyet()
							src.koimmune=15
							return
						if(src.ko==0)
							return
						if(src)
							if(src.health>=src.Mhealth*0.90)
								oview(src) << "<font face=yellow>[src]</font><font face=red> gets back on their feet. "
								src<<"You get back up"
								src.WakeUp2()
							if(src.ko==0)
								return
							/*if(src.client&&src.struggle<src.koamm&&src.clamgen)
								var/mob/npc/Izanagiclone/A=new()
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
									src.WakeUp2()
									return*/
							if(src.struggle<src.koamm&&src.immortality<1&&src.heart<=1)
								if(src.inevent>0)
									src.loc=src.eventreturn
									eventplayers-=1
									eventplayerlist-=src
									src.inevent=0
									src.canjoin=1
									src.health=src.Mhealth
									src.chakra=src.Mchakra
									src.ko=0
									if(src.bossevent)
										src.bossevent=0
										var/matrix/MN = matrix()
										MN.Scale(1)
										src.transform = MN
										world<<"<font size=1><font color=yellow><B>World News: The Juggernaut [src] was defeated."
										var/rewardmult=(eventplayers/4)+(src.level/100)
										for(var/mob/R in world)
											if(R.inevent>0)
												R.loc=R.eventreturn
												eventplayers-=1
												eventplayerlist-=R
												R.inevent=0
												R.canjoin=1
												R.bossevent=0
												spawn(1)
													R.eventreward(rewardmult)

									else
										world<<"<font size=1><font color=yellow><B>World News: [src] was eliminated."
										src.ko=0
										src.koamm=0
										src.Frozen=0
										src.icon_state=""
										if(M&&M.bossevent)
											if(eventplayers<2)
												world<<"<font size=2><font color=red><B>World News: The Juggernaut [M] has defeated everyone."
												M.bossevent=0
												var/matrix/LL = matrix()
												LL.Scale(1)
												M.transform = LL
												var/rewardmult=(eventplayers/4)+(src.level/100)
												spawn(1)
													M.eventreward(rewardmult)
												for(var/mob/R in world)
													if(R.inevent>0)
														R.loc=R.eventreturn
														eventplayers-=1
														eventplayerlist-=R
														R.inevent=0
														R.canjoin=1
														R.bossevent=0
												//del M
										src.WakeUp2()
										return
								if(istype(M,/mob/boss))
									if(eventplayers<1)
										world<<"<font size=2><font color=red><B>World News: [M] has defeated everyone."
										for(var/mob/boss/RT in world)
											del RT
										del M
										return
								if(istype(src,/mob/boss))
									oview(src) << "<font color=yellow>[src]</font><font face=red> is dead. "
									var/bossleft=0
									for(var/mob/boss/Y in world)
										bossleft+=1
									bossleft-=1
									if(bossleft>0)
										world<<"<font size=1><font color=yellow><B>World News: [bossleft] Boss Mobs left."
									else
										world<<"<font size=2><font color=yellow><B>World News: The players have won the Boss Fight!"
										for(var/mob/R in world)
											if(R.inevent>0)
												R.loc=R.eventreturn
												eventplayers-=1
												eventplayerlist-=R
												R.inevent=0
												R.canjoin=1
												spawn(1)
													R.eventreward(rand(3,5))
									src.loc=locate(0,0,0)
									spawn(30)
										del src
									return
								oview(src) << "<font color=yellow>[src]</font><font face=red> is dead. "
								if(src==M||M==src)
									src<<"You have killed yourself."
									spawn(20)
										if(prob(10))
											src.AwardMedal("Suicide")
										src.deaths+=1
								else
									src<<"You have died by the hands of [M]."
									if(M&&M.clan=="Jashin")
										M.immortality+=round(src.level*1.5)
										M<<"You gained [round(src.level*1.5)] seconds of immortality."
									spawn(2)
										if(src.client)
											M.kills+=1
											src.killactivates()
										/*var/pricegone=round(src.yen*0.10)
										if(!src.client)
											pricegone=src.yen
										M.yen+=pricegone
										src.yen-=pricegone
										if(pricegone>=1)
											src<<"<font color=red>[M] has taken [pricegone] of your money."
											M<<"<font color=red>You take [pricegone] off of [src]'s body."*/
										src.deaths+=1
										if(M.assassin&&M.target==src)
											spawn(1)
												var/pricegone=round(src.yen*0.40)
												if(!src.client)
													pricegone=src.yen
												M.yen+=pricegone
												src.yen-=pricegone
												if(pricegone>=1)
													src<<"<font color=red>[M] has taken [pricegone] yen of your money."
													M<<"<font color=red>You take [pricegone] yen off of [src]'s body."
												for(var/mob/Y in world)
													if(Y.client&&Y.village==M.village)
														Y<<"<font face=red>Village Info:</font><font face=yellow> [src]'s bounty of [src.bounty] has been taken and given to the village as [src.bounty+(M.yen*0.5)] by [M]"
														sleep(1)
												M.yen-=round(M.yen*0.5)
												M.yen+=src.bounty
												src.bounty=0
												if(M.village=="Leaf")
													LeafVillagePool+=M.yen
												if(M.village=="Rock")
													RockVillagePool+=M.yen
												if(M.village=="Rain")
													RainVillagePool+=M.yen
												if(M.village=="Sound")
													SoundVillagePool+=M.yen
												if(M.village=="Waterfall")
													WaterfallVillagePool+=M.yen
												if(M.village=="Cloud")
													CloudVillagePool+=M.yen
												if(M.village=="Sand")
													SandVillagePool+=M.yen
												M.yen=0
												spawn(300)
													if(M)
														del M
												return
										if(src.assassin)
											spawn(1)
												for(var/mob/Y in world)
													if(Y.client&&Y.village==M.village)
														Y<<"<font color=red>Village Info:</font><font color=yellow> [src] has failed to collect [src.target]'s bounty."
														sleep(1)
												if(prob(30))
													if(src.target==M)
														if(prob(40))
															M<<"<font color=red>You find a letter from the Hidden [src.village] Village wanting for your arrest."
															if(prob(10))
																M<<"<font color=red>The [src.village] Probably wanted your sweet bounty."
														else
															M<<"<font color=red>You find a wanted poster with your name and face on [src]."
															sleep(10)
															M<<"<font color=red>Reading the wanted poster you see that your bounty is [M.bounty]."
													else
														if(prob(40))
															M<<"<font color=red>You notice a wanted poster as you look through their things."
															sleep(10)
															var/mob/OO=src.target
															M<<"<font color=red>The poster has a picture of [src.target] and under it a wanted dead sign that has the bounty reward of [OO.bounty] yen."

										if(src.bounty>=1)
											M.yen+=src.bounty
											src.bounty=0
										else
											if(src.village=="None"||src.village=="Missing")

											else
												if(prob(30))
													if(M.bounty==0)
														M<<"You have aquired a bounty after killing [src]."
													M.bounty+=200
								//src.corpsecreate()
								//oview(src) << "<font face=yellow>[src]</font><font face=red> could not be saved. "
								if(src.client)
									src.AwardMedal("My First Death")
								if(src.reanimated)
									spawn(1)
										src.edorecover()
									return
								if(M.levelcapped==0&&M!=src&&src.levelcapped==0)
									if(src.killedby=="[M]"&&M.client)
										M<<"<font size=1><font color=red><B>Try not to spamm kill, its illegal."
										M.spammkilled+=1
										if(M.spammkilled>=5)
											spawn(50)
												M<<"You were warned not to spamm kill."
												world<<"<font size=1><font color=red><B>World News: [M] was booted for spamm kill."
												del M
									else
										if(M)
											if(M.inparty>=1)
												var/divide=1
												var/who=list()
												for(var/mob/R in world)
													if(R.client&&R.partyid==M.partyid&&R!=M&&R.z==M.z)
														if(R.level<(M.level-15)||R.level>(M.level+15))

														else
															divide+=1
															who+=R
												var/expgoing=src.expgive*expmult
												if(divide>=1)
													expgoing=expgoing/divide
												M.exp+=expgoing
												M.expgive+=src.expgive*0.10
												M<<"<font color=red>You killed [src]"
												M<<"<font color=green>You gained [expgoing] exp."
												M.DamageShow(round(expgoing))
												var/pricegone=round(src.yen*0.40)
												if(!src.client)
													pricegone=src.yen
												M.yen+=pricegone/divide
												src.yen-=pricegone
												if(pricegone>=1)
													src<<"<font color=red>[M] has taken [pricegone/divide] of your money."
													M<<"<font color=red>You take [pricegone/divide] off of [src]'s body."
												spawn(5)
													M.level()
												for(var/mob/YU in who)
													YU<<"<font color=green>[M] has killed [src]"
													YU<<"<font color=green>You leeched [expgoing] exp."
													if(pricegone>=1)
														YU<<"<font color=red>[M] shares [pricegone/divide] yen stolen from [src]'s corpse."
													YU.exp+=expgoing
													YU.yen+=pricegone/divide
													YU.DamageShow(round(expgoing))
													spawn(3)
														YU.level()
													sleep(1)
											else
												M.exp+=(src.expgive*expmult)
												M.expgive+=src.expgive*0.10
												M.DamageShow(round(src.expgive*0.10)*expmult)
												M<<"You gained [src.expgive] exp."
												var/pricegone=round(src.yen*0.40)
												if(!src.client)
													pricegone=src.yen
												M.yen+=pricegone
												src.yen-=pricegone
												if(pricegone>=1)
													src<<"<font color=red>[M] has taken [pricegone] of your money."
													M<<"<font color=red>You take [pricegone] off of [src]'s body."
												spawn(1)
													M.level()
										src<<"<font color=yellow>For being killed you have lost 10% of your gained exp."
										src.exp-=src.Mexp*0.10
										if(src.exp<0)
											src.exp=0
								if(!src.client)
									if(src.summon)
										del src
										return
									src.loc=locate(0,0,0)
									spawn(1)
										src.ko=2
										src.woken=0
										sleep(rand(1800,4200))
										del src
									return
								if(src.client&&src!=M)
									src.killedby="[M]"
									M.AwardMedal("My First Kill")
								src<<"You feel cold?"
								sleep(20)
								src<<"You feel your life force slipping away..."
								oview(src) << "<font color=yellow>[src]</font><font face=red> doesn't look so good."
								var/killcount=180
								while(killcount&&src.ko>=1)
									killcount-=1
									src.icon_state="dead"
									if(src.soul<=0)
										killcount-=1
									if(src.health>=src.Mhealth*0.75)
										src.ko=0
										src.koamm+=50
									sleep(10)
								if(src.ko<1)
									src.icon_state=""
									src.WakeUp()
									return
								src.corpsecreate()
								oview(src) << "<font color=red>[src]</font><font face=yellow> could not be saved. "
								var/spawnpoints=list()
								var/hasspawn=0
								var/checks=0
								for(var/turf/Buildings/Furnature/Bed/House1/BedCovers/UV in world)
									if(UV in spawnpoints)

									else
										if(UV.village==src.village)
											spawnpoints+=UV
											hasspawn+=1
											checks+=1
									if(checks>=7)
										break
									sleep(1)
								if(hasspawn>=1)
									src.loc=pick(spawnpoints)
								else
									src.loc=locate(1,1,1)
								src.soul=1
								src.health=src.Mhealth
								src.chakra=src.Mchakra
								src.chakrapool=src.chakrapoolmax
								src.ko=0
								src.stun=0
								src.koamm=0
								src.icon_state=""
							else
								if(src.heart>1)
									src.heart-=1
									src.koamm-=20
									if(src.koamm<=0)
										src.koamm=0
									oview(src)<<"</br><center><font color=red size=1>[src] has been revitalized. They have [src.heart] heart(s) remaining...</font></br>"
									src<<"</br><center><font color=red size=2>You are given life again at the cost of a heart. you now have [src.heart] heart(s) left.</font></br>"
									//src<<"You get back up"
									if(src.run==0)
										src.icon_state=""
									else
										src.icon_state="running"

									src.ko=0
									src.stun=0
									src.bind=0
									src.health = src.Mhealth*0.25
									if(src.chakra<=10)
										src.chakra=30
									//src.Frozen = 0
								else
									oview(src) << "<font color=yellow>[src]</font><font face=red> gets back on their feet. "
									src<<"You get back up"
									if(src.run==0)
										src.icon_state=""
									else
										src.icon_state="running"
									src.ko=0
									src.stun=0
									src.bind=0
									if(prob(28)&&src.clan=="Uchiha"&&!src.hasshar)//change percent to 30% or 10%
										src.hasshar=1
										src<<"<font color=blue>Your sharingan activates!"
										spawn(10)
											src.hasshar=1
											//src.verbs+= /mob/uchiha/verb/Sharingan
											src.contents += new /obj/skill/sharingan
											src.AwardMedal("I can see!")
									src.health = src.Mhealth*0.45
									if(src.chakra<=10)
										src.chakra=30
									//src.Frozen = 0
				else
					return


mob
	var
		beforeedoname=""
	proc
		notdeadyet()
			src.reanimated=1
			var/obj/summoneffect/U = new()
			var/obj/summoneffect/D = new()
			var/obj/summoneffect/L = new()
			var/obj/summoneffect/R = new()
			var/obj/summoneffect/NW = new()
			var/obj/summoneffect/NE = new()
			var/obj/summoneffect/SE = new()
			var/obj/summoneffect/SW = new()
			var/obj/summoncircle/SC = new()
			SC.loc=src.loc
			U.loc=src.loc
			step(U,NORTH)
			D.loc=src.loc
			step(D,SOUTH)
			L.loc=src.loc
			step(L,WEST)
			R.loc=src.loc
			step(R,EAST)
			NW.loc=src.loc
			step(NW,NORTHWEST)
			NE.loc=src.loc
			step(NE,NORTHEAST)
			SE.loc=src.loc
			step(SE,SOUTHEAST)
			SW.loc=src.loc
			step(SW,SOUTHWEST)
			var/obj/reanimate/UU = new()
			UU.loc=src.loc
			src<<"???: You can't escape my training that easily...."
			sleep(15)
			if(src)
				src.beforeedoname="[src.name]"
				src.name="[src.name](Edo)"
				src.koimmune=7
				src.struggle=0
				viewers(src)<<"<font color=red><b><font size=2>[src] has been reanimated!"//;src.Stun=0
				src.stun=0
				src<<"Your body feels different... Reanimated...."
				src.icon_state=""
				src.Frozen=0
				src.bind=0
				src.insand=0
				src.ko=0
				src.Frozen=0
				src.icon_state=""
				src.health=round(src.Mhealth*0.75)
				src.SaveK()








mob
	proc
		Death(mob/M)//make them die for about 3 minutes
			set background = 1
			spawn(1)
				if(src.koimmune)
					return
				if(src.health<=0&&src.merchant)
					return
				if(src.health<=0&&src.ko==0)
					if(istype(src,/mob/npc/Corpse))
						return
					//src.koby=M
					if(src.gates>=4)
						src<<"Your body couldn't handle the stress of the gates and released them."
						src.gates=0
						src.icon=src.Oicon
						src.overlays-='BEyes.dmi'
						src.tai=src.Mtai
						src.pixel_step_size=0
					src.ko = 1
					src.ingenjutsu=0
					src.koamm+=rand(15,25)
					if(src.delonko&&!src.client)
						del src
						return
					oview(src) << "<font color=yellow>[src]</font><font face=red> is knocked out. "
					src<<"<font color=blue>You are knocked out."
					src.health=0
					src.currentcharge=0
					src.charging=0
					src.struggle=0
					if(!src.client)
						if(src.summon)
							del src
							return
					if(src.reanimated)
						spawn(1)
							src.edorecover()
						return
					if(src.absorbing)
						src.absorbing=0
						src.Frozen=0
						src<<"You stop absorbing."
						src.icon_state=""
						src.overlays-='absorbtion.dmi'
						src.overlays-='absorbtion.dmi'
						src.overlays-='absorbtion.dmi'
					//src.koby=M
					//src.icon_state="rest"
					src.icon_state="dead"
					if(istype(src,/mob/puppet/regular))
						var/mob/O = src.owner
						if(O)
							src.loc=O
						if(!O)
							del src
						return
					if(istype(src,/mob/puppet/humanoid))
						del src
						return
					if(istype(src,/mob/npc/trainingbag))
						if(M)
							var/reward=rand(10,50)*expmult
							M.exp+=reward
							M<<"<font color=green>You gained [reward] exp for knocking down the bag!"
					if(istype(src,/mob/npc/trainingbag2))
						if(M)
							var/reward=rand(50,100)*expmult
							M.exp+=reward
							M<<"<font color=green>You gained [reward] exp for knocking down the bag!"
					if(istype(src,/mob/npc/trainingbag3))
						if(M)
							var/reward=rand(100,300)*expmult
							M.exp+=reward
							M<<"<font color=green>You gained [reward] exp for knocking down the bag!"
					if(istype(src,/mob/npc/trainingbag5))
						if(M)
							var/reward=rand(7,15)*expmult
							M.exp+=reward
							M<<"<font color=green>You gained [reward] exp for knocking down the bag!"
					spawn(1)
						M.level()
					if(src.client)
						src.koimmune=1
					spawn(1)
						var/timing=rand(25,30)
						while(timing)
							if(src.ko==0||src.ko==2)
								return
							timing-=1
							sleep(10)
						src.WakeUp2()
				else if(src.health<=0&&src.ko==1)
					/*if(src.client)
						if(src.level<=15||M.level<=15)
							return*/
					if(istype(src,/mob/npc/trainingbag))
						return
					if(istype(src,/mob/npc/trainingbag2))
						return
					if(istype(src,/mob/npc/trainingbag3))
						return
					if(istype(src,/mob/npc/trainingbag5))
						return
					if(src.reanimated==0)
						oview(src)<<"<font color=red>[src] is struggling for their life!"
						src<<"<font color=red>You are dieing, quickly tap Space rapidly to save yourself. You have 30 seconds!"
						src.ko=2
						if(src.clamgen)
							src.alpha=30
							var/list/H=list()
							for(var/turf/T in getring(src.loc,3))
								if(T.density==0)
									H.Add(T)
							var/mob/npc/Izanagiclone/A=new()
							if(A)
								A.name="[src.name]"
								//A.density=0
								A.owner=src
								A.icon=src.icon
								A.dir=src.dir
								A.overlays+=src.overlays
								A.loc=src.loc
								A.icon_state="dead"
							src.loc=pick(H)
							animate(src, transform = null, alpha = 255, time = 30)
							//walk(src,0)
							src.clamgen=0
							src.WakeUp2()
							return
						spawn(1)
							var/dietime=60
							while(dietime)
								if(src.ko==0)
									return
								dietime-=1
								sleep(5)
							if(src.struggle<src.koamm)
								src.Death2(M)
						while(src.ko==2)
							if(src.struggle>=src.koamm)
								src.WakeUp()
							sleep(10)
					else
						src.Death2(M)

				else
					return

mob
	var
		tmp/koimmune=0

mob/proc
	WakeUp()
		if(src.struggle>=src.koamm)
			if(src.client)
				src.koimmune=7
			src.struggle=0
			viewers(src)<<"[src] struggles back to their feet."//;src.Stun=0
			/*if(src.deathcount>=3)
				src.Running=0
				src<<"You're getting tired and forced to walk.."*/
			src.stun=0
			src<<"You get back to your feet!"
			if(prob(28)&&src.clan=="Uchiha"&&!src.hasshar)//change percent to 30% or 10%
				src.hasshar=1
				src<<"<font color=blue>Your sharingan activates!"
				spawn(10)
					src.hasshar=1
					//src.verbs+= /mob/uchiha/verb/Sharingan
					src.contents += new /obj/skill/sharingan
					src.AwardMedal("I can see!")
			//src.sight&=~(SEE_SELF|BLIND)
			//src.Struggle=0
			src.icon_state=""
			src.Frozen=0
			src.bind=0
			src.insand=0
			//src.firing=0
			src.ko=0
			//src.Endurance=src.MEndurance
			src.Frozen=0
			src.icon_state=""
			//src.Guarding=0
			//src.gencounter=0
			src.health=round(src.Mhealth*0.75)
			if(istype(src,/mob/npc/trainingbag))
				src.health=src.Mhealth
				src.Frozen=1
				src.moving=1
			if(istype(src,/mob/npc/trainingbag2))
				src.health=src.Mhealth
				src.Frozen=1
				src.moving=1
			if(istype(src,/mob/npc/trainingbag3))
				src.health=src.Mhealth
				src.Frozen=1
				src.moving=1
			if(istype(src,/mob/npc/trainingbag5))
				src.health=src.Mhealth
				src.Frozen=1
				src.moving=1
			//src.stamina+=round(src.maxstamina/3)
			//var/Gain=(src.Mchakra/3)
			//if(Gain>src.ChakraPool)
			//	Gain=src.ChakraPool
			//src.chakra+=Gain
			//src.ChakraPool-=Gain
			//src.ImmuneToDeath=1
			//spawn(70)
				//src.ImmuneToDeath=0
			src.SaveK()
	WakeUp2()
		src.struggle=0
		if(src.client)
			src.koimmune=7
		oview(src) << "<font face=yellow>[src]</font><font face=red> begins to come to. "
		src<<"You get back up"
		if(src.run==0)
			src.icon_state=""
		else
			src.icon_state="running"
		src.ko=0
		src.bind=0
		src.insand=0
		src.stun=0
		if(prob(28)&&src.clan=="Uchiha"&&!src.hasshar)//change percent to 30% or 10%
			src.hasshar=1
			src<<"<font color=blue>Your sharingan activates!"
			spawn(10)
				src.hasshar=1
				//src.verbs+= /mob/uchiha/verb/Sharingan
				src.contents += new /obj/skill/sharingan
				src.AwardMedal("I can see!")
		src.health=round(src.Mhealth*0.75)
		if(src.chakra<=10)
			src.chakra=30
		if(istype(src,/mob/npc/trainingbag))
			src.health=src.Mhealth
			src.koamm=0
			src.Frozen=1
			src.moving=1
		//src.Frozen = 0


mob
	var
		tmp/struggledelay=0



mob/verb/CENTER()
	set name="DADAMNSPACEBUTTON"
	set hidden=1
	if(src.ko>=2)
		if(src.struggledelay>=1)
			return
		src.struggledelay=1
		src.struggle+=(0.25+src.willpower)*src.soul
		if(src.rank=="Academy Student")
			src.struggle+=0.02
		if(src.rank=="Genin")
			src.struggle+=0.03
		if(src.rank=="Chuunin")
			src.struggle+=0.06
		if(src.rank=="Special Jounin")
			src.struggle+=0.08
		if(src.rank=="Jounin")
			src.struggle+=0.1
		if(src.rank=="Sannin")
			src.struggle+=0.12
		spawn(2)
			src.struggledelay=0

	/*if(usr.deathcount<=2)
		usr.Struggle+=0.5
	if(usr.deathcount<4)
		usr.Struggle+=0.25
		if(usr.Trait2=="Iron Will")
			usr.Struggle+=0.50
	if(usr.TypeLearning=="Taijutsu"&&usr.StruggleAgainstDeath>0)
		usr.exp+=rand(5,10)
	if(usr.rank!="Genin"&&usr.rank!="Chuunin"&&usr.rank!="S.Jounin"&&usr.deathcount<=4)
		usr.Struggle+=0.5*/
	//usr.UpdateStruggle()




mob
	proc
		killactivates()
			spawn(1)
				for(var/mob/U in oview(2,src))
					if(U.hasshar&&U.hasms==0&&U.client)
						if(src.clan=="Uchiha")
							if(prob(14)&&U.sharM>=U.msM&&U.kills>=U.mskills&&U.hasms==0&&U.shari)//make it so that when they kill someone and have the reqz to get it, they get it that way
									//src.firing=1
								spawn(10)
									//src<<"You try to activate your eyes but they won't seem to activate."
									//sleep(20)
									U<<"Your eyes begin to burn...."
									sleep(30)
									//src.mswho=pick("Itachi","Obito","Sasuke","Izuna","Madara")//,"Shisui")
									//src.firing=0
									U.hasms=1
									//src.cgms=0
									U<<"Your Sharingan activates with a heavy pressure!"
									U.contents += new /obj/skill/mangekyou
									U.msprep=1
									U.MangekyouPrep()
									//src.FadeScreen()
									//return
						else
							if(prob(7)&&U.sharM>=U.msM&&U.kills>=U.mskills&&U.hasms==0&&U.shari)//make it so that when they kill someone and have the reqz to get it, they get it that way
									//src.firing=1
								spawn(10)
									//src<<"You try to activate your eyes but they won't seem to activate."
									//sleep(20)
									U<<"Your eyes begin to burn...."
									sleep(30)
									//src.mswho=pick("Itachi","Obito","Sasuke","Izuna","Madara")//,"Shisui")
									//src.firing=0
									U.hasms=1
									//src.cgms=0
									U<<"Your Sharingan activates with a heavy pressure!"
									U.contents += new /obj/skill/mangekyou
									U.msprep=1
									U.MangekyouPrep()
									//src.FadeScreen()
									//return
				if(src.rinnegan==0)
					if(src.clan=="Uchiha"&&src.hasems)
						if("Senju" in src.implants&&(src.kills-src.deaths)>=30)
							if(prob(6))
								src.rinneactivate()
					else
						if(src.rinnepoten)
							if(prob(0.1)&&(src.kills-src.deaths)>=30)
								src.rinneactivate()






mob
	var
		tmp/corpse=0


mob
	proc
		corpsecreate()
			var/mob/npc/Corpse/A=new()
			//var/mob/C = src
			A.name="[src.name]'s Corpse"
			A.clan=src.clan
			A.rank=usr.rank//For bounty hunting with corpses or something, Maybe?
			A.owner="[src]"
			A.Mhealth=src.Mhealth
			A.Mtai=src.Mtai
			A.Mnin=src.Mnin
			A.Mgen=src.Mgen
			A.attackdelay=src.attackdelay
			A.jutsus=src.jutsus
			A.hasgates=src.hasgates
			A.corpse=1
			A.style=src.style
			A.icon=src.icon
			//A.dir=usr.dir
			A.overlays+=src.overlays
			A.loc=src.loc
			A.icon_state="dead"
			if(src.shari||src.mshar)
				A.shari=2
			if(src.bya)
				A.bya=2
			if(src.rinnegan)
				A.rinnegan=2
			//A.run=1
			//bodies+=1
			//A.reanimated=1
			//A.koamm=100

/*

mob
	proc
		Death(mob/M)//make them die for about 3 minutes
			spawn(1)
				if(src.health<=0&&src.merchant)
					return
				if(src.health<=0)
					if(src.ko)
						return
					else
						if(istype(src,/mob/npc/Corpse))
							return
						//src.koby=M
						src.ko = 1
						src.koamm+=0.50//rand(10,15)
						oview(src) << "<font face=yellow>[src]</font><font face=red> is knocked out. "
						src<<"You are knocked out."
						//src.koby=M
						//src.icon_state="rest"
						src.icon_state="dead"
						if(!src.client&&src.fake&&src.reanimated==0)
							sleep(50)
							del src
							return
						if(src.merchant)
							return
						//src.wounds += rand(8,17)
						//src.canthear = 1
						if(prob(5)&&src.rinnegan==0&&src.sharM>1000)
							var/senjudna=0
							for(var/C in src.DNA)
								if(C=="Senju")
									senjudna+=1
							if(src.clan=="Uchiha"&&src.hasems)
								if(senjudna>=1&&(src.kills-src.deaths)>=rand(30,50)&&src.sharM>1000)
									src.rinneactivate()

							else
								if(senjudna>=1&&src.hasshar&&src.levelcapped&&src.sharM>1000)
									src.rinneactivate()
						if(!src.client)
							if(src.summon)
								del src
								return
						if(src.reanimated)
							spawn(1)
								src.edorecover()
							return
						var/time=rand(30,35)
						while(time)
							if(src.ko==0)
								return
							time-=1
							sleep(10)
						//sleep(pick(300,350))
						if(src.ko==0)
							return
						if(src)
							if(src.health>=src.Mhealth*0.90)
								oview(src) << "<font face=yellow>[src]</font><font face=red> gets back on their feet. "
								src<<"You get back up"
								if(src.run==0)
									src.icon_state=""
								else
									src.icon_state="running"
								src.ko=0
								return
							if(src.koamm>=2)
								for(var/mob/summon/Clam/T in world)
									if(T&&T.owner=="[src.key]")
										src.koamm-=1
							if(src.koamm>=2&&src.immortality<1)
								if(src.inevent>0)
									src.loc=src.eventreturn
									eventplayers-=1
									eventplayerlist-=src
									src.inevent=0
									src.canjoin=1
									if(src.bossevent)
										src.bossevent=0
										world<<"<font size=1><font color=yellow><B>World News: The Juggernaut [src] was defeated."
										var/rewardmult=(eventplayers/4)+(src.level/100)
										for(var/mob/R in world)
											if(R.inevent>0)
												R.loc=R.eventreturn
												eventplayers-=1
												eventplayerlist-=R
												R.inevent=0
												R.canjoin=1
												R.bossevent=0
												spawn(1)
													R.eventreward(rewardmult)

									else
										world<<"<font size=1><font color=yellow><B>World News: [src] was eliminated."
										src.ko=0
										src.koamm=0
										src.Frozen=0
										src.icon_state=""
									if(M.bossevent)
										if(eventplayers<2)
											world<<"<font size=2><font color=red><B>World News: The Juggnaut [M] has defeated everyone."
											M.bossevent=0
											var/rewardmult=(eventplayers/4)+(src.level/100)
											spawn(1)
												M.eventreward(rewardmult)
											for(var/mob/R in world)
												if(R.inevent>0)
													R.loc=R.eventreturn
													eventplayers-=1
													eventplayerlist-=R
													R.inevent=0
													R.canjoin=1
													R.bossevent=0
											//del M
											return
								if(istype(M,/mob/boss))
									if(eventplayers<1)
										world<<"<font size=2><font color=red><B>World News: [M] has defeated everyone."
										for(var/mob/boss/RT in world)
											del RT
										del M
										return
								if(istype(src,/mob/boss))
									oview(src) << "<font face=yellow>[src]</font><font face=red> is dead. "
									var/bossleft=0
									for(var/mob/boss/Y in world)
										bossleft+=1
									bossleft-=1
									if(bossleft>0)
										world<<"<font size=1><font color=yellow><B>World News: [bossleft] Boss Mobs left."
									else
										world<<"<font size=2><font color=yellow><B>World News: The players have won the Boss Fight!"
										for(var/mob/R in world)
											if(R.inevent>0)
												R.loc=R.eventreturn
												eventplayers-=1
												eventplayerlist-=R
												R.inevent=0
												R.canjoin=1
												spawn(1)
													R.eventreward(rand(4,8))
									del src
									return
								oview(src) << "<font face=yellow>[src]</font><font face=red> is dead. "
								if(src==M||M==src)
									src<<"You have killed yourself."
									spawn(20)
										if(prob(10))
											src.AwardMedal("Suicide")
										src.deaths+=1
								else
									src<<"You have died by the hands of [M]."
									if(M.clan=="Jashin"&&src.client)
										M.immortality+=round(src.level*1.5)
										M<<"You gained [round(src.level*1.5)] seconds of immortality."
									spawn(2)
										if(src.client)
											M.kills+=1
										src.deaths+=1
								src.corpsecreate()
								oview(src) << "<font face=yellow>[src]</font><font face=red> could not be saved. "
								src.AwardMedal("My First Death")
								if(src.reanimated)
									spawn(1)
										src.edorecover()
									return
								if(M.levelcapped==0&&M!=src&&src.levelcapped==0)
									if(src.killedby=="[M]"&&M.client)
										M<<"<font size=1><font color=red><B>Try not to spamm kill, its illegal."
										M.spammkilled+=1
										if(M.spammkilled>=5)
											spawn(50)
												M<<"You were warned not to spamm kill."
												world<<"<font size=1><font color=red><B>World News: [M] was booted for spamm kill."
												del M
									else
										M.exp+=(src.expgive*expmult)
										M.expgive+=src.expgive/10
										M<<"You gained [src.expgive] exp."
										src<<"For being killed you have lost 10% of your gained exp."
										src.exp-=src.Mexp*0.10
										if(src.exp<0)
											src.exp=0
										spawn(1)
											M.level()
								if(!src.client)
									if(src.summon)
										del src
										return
									src.loc=locate(0,0,0)
									spawn(1)
										src.ko=1
										src.woken=0
										sleep(rand(1800,4200))
										del src
									return
								if(src.client&&src!=M)
									src.killedby="[M]"
									M.AwardMedal("My First Kill")
								src<<"You feel cold?"
								sleep(600)
								if(src.ko<1)
									src.icon_state=""
									return
								src<<"You feel your life force sleeping away..."
								oview(src) << "<font face=yellow>[src]</font><font face=red> doesn't look so well. "
								var/killcount=120
								while(killcount&&src.ko)
									killcount-=1
									src.icon_state="dead"
									if(src.soul<=0)
										killcount-=1
									sleep(10)
								if(src.ko<1)
									src.icon_state=""
									return
								src.corpsecreate()
								oview(src) << "<font face=yellow>[src]</font><font face=red> could not be saved. "
								src.loc=locate(1,1,1)
								src.soul=1
								src.health=src.Mhealth
								src.chakra=src.Mchakra
								src.ko=0
								src.stun=0
								src.koamm=0
								src.icon_state=""
							else
								oview(src) << "<font face=yellow>[src]</font><font face=red> gets back on their feet. "
								src<<"You get back up"
								if(src.run==0)
									src.icon_state=""
								else
									src.icon_state="running"
								src.ko=0
								src.stun=0
								if(prob(28)&&src.clan=="Uchiha"&&!src.hasshar)//change percent to 30% or 10%
									src.hasshar=1
									src<<"Your sharingan activates!"
									spawn(10)
										src.hasshar=1
										//src.verbs+= /mob/uchiha/verb/Sharingan
										src.contents += new /obj/skill/sharingan
										src.AwardMedal("I can see!")
								src.health = src.Mhealth*0.45
								if(src.chakra<=10)
									src.chakra=30
								//src.Frozen = 0
				else
					return






*/