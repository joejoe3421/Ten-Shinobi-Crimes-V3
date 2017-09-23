//maybe when one is nearby soemone liek within 3 or 2 tiles they can hear their village say and whispers

//soul strike, does half nin half tai damage, damage is double tai of user

//Soul carneval, with the help of a naraka path it'll prompt the naraka and every soul that human path has killed will be broke back to forcably fight for them usign their powers etc
//won't attack human path, naraka path is now on the dont attack list  while naraka gets every kill the bodys make

//soul sense, a move that lets the human path sense nearby souls

//soul steal, a move that allows human path to steal a soul that can later be used for soul carneval, can onyl be use oen peopel who are already dying,
//makes them fullly die




mob
	var
		soul=1



obj
	item
		soulbag
			icon = 'NA.dmi'
			name = "Soul Bag"
			desc = "A special bag to keep stolen souls in."
			verb
				View_Souls()
					set category = "Commands"
					set name = "View Souls"
					for(var/mob/npc/soulclone/M in src.contents)
						usr<<"You have [M] in your soul bag."
				View_Souls2(mob/npc/soulclone/M in src.contents)
					set category = "Commands"
					set name = "View Soul Stats"
					usr<<"[M] has [M.health] health"
					usr<<"[M] has [M.tai] Strength"
					usr<<"[M] has [M.nin] Power"
					usr<<"[M] has [M.gen] Control"
				Destroy_Soul(mob/npc/soulclone/M in src.contents)
					set category = "Commands"
					set name = "Destroy Soul"
					switch(input(usr,"Are you sure you want to destroy [M]?")in list ("No","Yes","Cancel"))
						if("Yes")
							del M
						else
							usr<<"You decide not to destroy [M]."
							return
			//view bag(whos souls are in it)
			//view soul stats(view stats of soul)
			//destroy soul(in bag)






obj
	skill
		soulsteal//this is the line the must only contain one verb after it untill the next jutsu
			verb
				ss()
					set category = "Skills"
					set name = "Soul Steal"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+900
					if(usr.handseal(600,5))
						for(var/mob/M in get_step(usr,usr.dir))
							if(M.ko>=1)
								flick("beastman",usr)
								sleep(4)
								usr.icon_state="beastman"
								usr<<"Your taking [M]'s soul out, dont move."
								M<<"[usr] is ripping your soul from your body!"
								var/xz=usr.loc
								var/zx=M.loc
								var/count=0
								while(count<20&&M)
									count+=1
									if(usr.loc!=xz||M.loc!=zx||M.ko==0)
										usr<<"Something went wrong..."
										usr.icon_state=""
										return
									sleep(10)
								usr.icon_state=""
								//var/found=0
								view(usr)<<"[usr] has taken [M]'s Soul!"
								M.soul=0
								M.koamm+=40
								/*for(var/obj/item/soulbag/T in usr.contents)
									var/mob/npc/soulclone/A=new()
									if(A)
										A.name="[M]'s Soul"
										A.density=1
										A.owner=usr
										A.icon=M.icon
										A.health=M.Mhealth*0.75
										A.tai=M.Mtai*pick(0.70,0.75,0.80,0.85,0.90)
										A.nin=M.nin*pick(0.70,0.75,0.80,0.85,0.90)
										A.gen=M.Mgen*pick(0.70,0.75,0.80,0.85,0.90)
										A.jutsus=M.jutsus
										A.overlays+=M.overlays
										for(var/mob/npc/soulclone/Y in T.contents)
											if(Y.name==A.name)
												del Y
										A.loc=T
										found=1
								if(found==0)
									var/obj/item/soulbag/L=new()
									L.loc=usr
									var/mob/npc/soulclone/A=new()
									if(A)
										A.name="[M]'s Soul"
										A.density=1
										A.owner=usr
										A.icon=M.icon
										A.health=M.Mhealth*0.75
										A.tai=M.Mtai*pick(0.70,0.75,0.80,0.85,0.90)
										A.nin=M.nin*pick(0.70,0.75,0.80,0.85,0.90)
										A.gen=M.Mgen*pick(0.70,0.75,0.80,0.85,0.90)
										A.jutsus=M.jutsus
										A.overlays+=M.overlays
										for(var/mob/npc/soulclone/Y in usr.contents)
											if(Y.name==A.name)
												del Y
										A.loc=L*/
							else
								usr<<"They need to be at least KO'ed to use this!"
								return






obj
	skill
		soulstrike//this is the line the must only contain one verb after it untill the next jutsu
			verb
				ss()
					set category = "Skills"
					set name = "Soul Strike"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					if(usr.handseal(200,1))
						src.cooldown=world.time+150
						for(var/mob/M in get_step(usr,usr.dir))
							flick(pick("Attack1","Attack2"),usr)
							if(M.soul)
								if(src.level<=1)
									M.taidamage(usr.tai/2,0,usr)
									M.nindamage(usr.tai/4,0,usr)
								if(src.level==2)
									M.taidamage(usr.tai*1,0,usr)
									M.nindamage(usr.tai/3,0,usr)
								if(src.level==3)
									M.taidamage(usr.tai*1.5,0,usr)
									M.nindamage(usr.tai/2,0,usr)
								spawn(1)
									if(src.level<3)
										src.mastery+=(3-src.level)
										if(prob(10))
											usr<<"Your getting better with soul strike."
										if(src.mastery>=100)
											src.level+=1
											src.mastery-=100
											if(src.level==2)
												usr<<"Soul Strike is now level 2, it now does 25% more damage."
												//this will be where you learn soul steal
												usr<<"You learned to take souls from dying bodies!"
												var/obj/item/soulbag/A=new()
												A.loc=usr
												var/obj/skill/soulsteal/B=new()
												B.loc=usr
											if(src.level==3)
												usr<<"Soul Strike is now max level, it now does 50% more damage."
								spawn(1)
									if(M.ko==0)
										M.dir=get_dir(M,usr)
										M.icon_state="fall"
									M.stepback(rand(1,2))
									if(M.ko==0)
										M.icon_state=""
								break