//sealing jutsu
//make sure to add reaper with different ability liek taking away hands or chakra usage or somethign and they have a 30% chance to be
/// free from cure through death or they have to find another way
//add 5 prong seal so it taeks away all chakra and make sit so u cant use a demon till unsealed period
//hyuuga seal makes u not regen chakra while taking it away with each strike has a timer effect like mute, is over automatically as soon as ko maybe
mob
	var
		prongseal=0
		healingseal=0
		tmp/crebirth=0
		tmp/healjutsu=0





obj/jutsu
	chakraseal
		icon='summoncircle.dmi'//use summoning icon
		icon_state="chakrasteal"
		layer=TURF_LAYER
		density=0
		New()
			..()
			spawn(450)
				if(src)
					del src
			spawn(10)
				var/mob/P = null
				for(var/mob/M in src.loc)
					if(M!=src.owner)
						P=M
						break
				if(P==null)
					del src
				else
					var/mob/O = src.owner
					while(O&&P.loc==src.loc&&P.ko==0)
						var/drain=O.Mchakra*0.01
						P.chakra-=drain
						O.chakra+=drain
						for(var/obj/jutsu/Y in src.loc)
							if(Y.owner!=O)
								O.chakra+=Y.power*0.25
								view(Y)<<"The Seal absorbed [Y]"
								del Y
						sleep(10)
					if(src)
						del src


obj
	skill
		seal1//this is the line the must only contain one verb after it untill the next jutsu
			verb
				sealone()
					set category = "Skills"
					set name = "Chakra Draining Seal"//a seal placed on the ground under someone as long as they stand on it it takes chakra
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(75,8))
						var/obj/jutsu/chakraseal/A=new/obj/jutsu/chakraseal(usr.loc)
						A.owner=usr
						A.dir=usr.dir
						step(A,usr.dir)
		seal2
			verb
				sealtwo()
					set category = "Skills"
					set name = "Evil Sealing"//a seal that keeps a cursemark from activating
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(150,19))
						usr<<"Not yet implimented."
		seal3
			verb
				sealthree()
					set category = "Skills"
					set name = "Evil Sealing-Release"//a seal that lets a cursemark activate if sealed
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(75,8))
						usr<<"Not yet implimented."
		seal4
			verb
				sealfour()
					set category = "Skills"
					set name = "Five Prong Seal"//takes all chakra and doesn't allow using more than half their max for awhile
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(300,2))
						usr<<"You prepare the 5 prong seal.(Don't Move)"
						var/myloc=usr.loc
						sleep(30)
						if(usr.loc==myloc)
							for(var/mob/M in get_step(usr,usr.dir))
								if(M.prongseal==0)
									spawn(1)
										usr.Say("5 Prong Seal!")
									flick("Attack2",usr)
									M.prongseal=500
									M.chakra=0
									M.demonstage=0
									view(M)<<"A seal appears on [M]!"
									break
			verb
				sealf()
					set category = "Skills"
					set name = "Elements Unseal"//reverses 5 prong seal
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(300,2))
						usr<<"You prepare the 5 prong un-seal.(Don't move)"
						var/myloc=usr.loc
						sleep(30)
						if(usr.loc==myloc)
							for(var/mob/M in get_step(usr,usr.dir))
								if(M.prongseal>0)
									spawn(1)
										usr.Say("5 Prong UnSeal!")
									flick("Attack2",usr)
									M.prongseal=0
									view(M)<<"The seal on [M] dissapears."
									break
		seal5
			verb
				eigthtrigrams()
					set category = "Skills"
					set name = "Eight Tetragram Seal"//a seal that lets u seal a bijuu in someone
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(75,8))
						usr<<"Not yet implimented."
		seal6
			verb
				sealfo()
					set category = "Skills"
					set name = "Four Seal Barrier"//...
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(300,2))
						usr<<"Not yet implimented."
		seal7
			verb
				sealur()
					set category = "Skills"
					set name = "Shikokumujin"//forces cs into second stage using the box sasuke used instead of being bitten again
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(300,2))
						usr<<"Not yet implimented."
		seal8
			verb
				sealr()
					set category = "Skills"
					set name = "Edo Tensei: Living Coffin"//traps opponet ina  edo coffin that does dmg over time
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(300,2))
						usr<<"Not yet implimented."
		seal9
			verb
				dgff()
					set category = "Skills"
					set name = "Fuinjutsu: Trap"//Warps opponet to a random map in the game and the seal gets deleted
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(300,2))
						usr<<"Not yet implimented."
		seal10
			verb
				se()
					set category = "Skills"
					set name = "Reverse Tretragram Seal"//once active, its active till you die, when u die it seals anyone in range... does a shit ton of dmg instead
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(300,2))
						usr<<"Not yet implimented."
		seal11
			verb
				four()
					set category = "Skills"
					set name = "Sealing-Release"//frees a edo tensei from their seal
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(300,2))
						usr<<"Not yet implimented."
		seal12
			verb
				seur()
					set category = "Skills"
					set name = "Cursed Tongue"//place a seal on someone secretly only to have it activate later and stop them from moviing for awhile
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(300,2))
						usr<<"Not yet implimented."
		seal13
			verb
				sr()
					set category = "Skills"
					set name = "Mokuton:Binding"//binds an opponet for awhile
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(300,2))
						usr<<"Not yet implimented."
		seal14
			verb
				se()
					set category = "Skills"
					set name = "Rikudou Jubi Kyu In"//when in view of the juubi in its full state, you need this to seal it inside of you
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+600
					if(usr.handseal(2000,30))
						usr<<"Not yet implimented."
		seal15
			verb
				fvgy()
					set category = "Skills"
					set name = "Strenth of 100 Seal"//gives u the seal which grants access to creation rebirth and 100 healing technique
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(usr.Mchakra,30))
						if(usr.healingseal)
							usr<<"You already have this mark."
						else
							usr<<"A diamond forms on your head. You now have the Strength of 100 seal."
							oview(usr)<<"A diamond forms on [usr]'s head."
							usr.healingseal=1//katsu summon can't heal without this mark on the owner
						del src
		seal16
			verb
				fffrrr()
					set category = "Skills"
					set name = "Creation Rebirth"//heals you till deactivated but gives you wounds in exchange
					if(usr.healingseal==0)
						usr<<"You don't have the right things to use this."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(300,2))
						if(usr.crebirth)
							usr<<"You de-activate your creation rebirth."
							usr.crebirth=0
						else
							usr<<"You activate creation rebirth. Be careful using this technique is dangerous over long periods of time."
							usr.crebirth=1
							usr.Say("Creation Rebirth!")
							while(usr.crebirth>0&&usr.ko==0)
								usr.chakra-=25
								var/drain=(usr.Mhealth-usr.health)*0.25
								if(drain<0)
									drain=0
								if(usr.health<usr.Mhealth)
									usr.health+=usr.Mhealth*0.03
									if(drain>0)
										usr.koamm+=drain*0.01
								sleep(10)
							if(usr.ko>0)
								usr<<"Creation rebirth de-activated."
							usr.crebirth=0
		seal17
			verb
				sgfjgfk()
					set category = "Skills"
					set name = "100 Healings Technique"//put all yourchakra in the seal, resivoir and all then it uses it to heal you till the chakra is all gone
					if(usr.healingseal==0)
						usr<<"You don't have the right things to use this."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+6000
					if(usr.handseal(300,8))
						if(usr.healjutsu)
							usr<<"It's already active."
							src.cooldown=120
							return
						var/atme=usr.loc
						usr<<"You begin the 100 healings technique, stand still for 5 seconds to go through with it."
						usr<<"This jutsu will take every bit of chakra you have left."
						sleep(50)
						if(usr.loc==atme)
							usr.Say("100 Healings Technique!")
							usr.healjutsu=1
							usr<<"The 100 healings jutsu is now active."
							var/allme=(usr.chakra+usr.chakrapool)*1.3
							usr.chakrapool=0
							if(usr.chakra>300)
								usr.chakra=300
							while(allme>0&&usr.ko==0)
								var/drain=usr.Mhealth-usr.health
								var/drain2=usr.koamm
								if((drain*0.50)>allme)
									drain=allme
								allme-=(drain*0.50)
								if((drain2*4)>allme)
									drain2=allme
								allme-=(drain2*4)
								//var/drain2=usr.koamm
								if(drain<0)
									drain=0
								if(drain2<0)
									drain2=0
								usr.koamm-=drain2
								usr.health+=drain
								//allme-=(drain*0.50)+(drain2*4)
								allme-=10
								sleep(rand(10,30))
							usr.healjutsu=0
							usr<<"The 100 healings jutsu has worn off."

						else
							usr<<"The jutsu failed."
							src.cooldown=120