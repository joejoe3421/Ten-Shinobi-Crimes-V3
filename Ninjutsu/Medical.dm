mob
	var
		medicalmastery=0
		tmp/chakraS=0
		DNA = list()
		implants=list()
		implantable=list()
		tmp/yinhealing=0
		//do something similar like you did with shop systems
		//gotta have uchiha dna implanted before u can implant sharingan
//chakra scalpes

/////Revamp all implants to make the DNA stolen become an object in the person's inventory


mob
	teacher
		Medicalteacher
			//human = 1
			density=1
			//NPC = 1
			name="Terfu"
			icon='Guy.dmi'
			clan="None"
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				.=..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='YannisH.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(0,0,0)
					src.icon=Base
					src.overlays+='Boxers.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+='pants.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+='SoundJounin.dmi'
					src.overlays+='soundoutfit.dmi'
					src.overlays+='headband.dmi'
					src.overlays+=Hair
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr)
					if(usr.medicalmastery>=0)
						cl+="Shousen"
					if(usr.medicalmastery>=20&&usr.CC>=50&&"Shousen" in usr.jutsus)
						cl+="Chakra Scalpes"
					if(usr.special==""&&usr.medicalmastery>=60&&usr.clan=="None"&&"Shousen" in usr.jutsus)
						cl+="Yin Healing"
						if("Strength of 100" in usr.jutsus)
							cl-="Yin Healing"
				oview(src)<<"[src] Says: Everything must be done perfectly....."
				sleep(3)
				if(usr)
					oview(src)<<"[src] Says: Do you wish to learn about medical ninjutsu?"
					var/T = input("What to learn?","[src]") in list("Nothing") + cl
					if(T=="Nothing")
						return
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
						return
					if(T=="Shousen")
						usr.contents += new /obj/skill/medic1
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
					else if(T=="Chakra Scalpes")
						usr.contents += new /obj/skill/medic2
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
					else if(T=="Yin Healing")
						usr.contents += new /obj/skill/medic3
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
						usr.special=T
						usr<<"Your specialty is now [usr.special]"
					else
						oview(src)<<"[src] Says: I'll teach you that in due time. Just keep training."
mob
	teacher
		Medicalteacher2
			//human = 1
			density=1
			//NPC = 1
			name="Mogonish"
			icon='Guy.dmi'
			clan="None"
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				.=..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					Base+=rgb(235,145,52)
					src.icon=Base
					src.overlays+='Boxers.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+='pants.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+='facewrap.dmi'
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				var/can=1
				if(usr.medicalmastery>=70&&"Shousen" in usr.jutsus&&usr.clan=="None")
					if(usr.special!=""||usr.special!="Strength of 100")
						oview(src)<<"[src] Says: You won't learn anything from me..."
						can=0
					if(can>=1)
						if(usr.medicalmastery>=70)
							cl+="Strength of 100"
						if(usr.medicalmastery>=200&&usr.CC>=90)
							cl+="Creation Rebirth"
						if(usr.medicalmastery>=500&&usr.CC>=100)
							cl+="100 Healings"
				oview(src)<<"[src] Says: Only some can be careless."
				sleep(3)
				if(usr.medicalmastery>50)
					oview(src)<<"[src] Says: Do you wish to learn real medical ninjutsu?"
					var/T = input("What to learn?","[src]") in list("Nothing") + cl
					if(T=="Nothing")
						return
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
						return
					if(T=="Strength of 100")
						usr.contents += new /obj/skill/seal15
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
						usr.special=T
						usr<<"Your specialty is now [usr.special]"
					else if(T=="Creation Rebirth")
						usr.contents += new /obj/skill/seal16
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
					else if(T=="100 Healings")
						usr.contents += new /obj/skill/seal17
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
					else
						oview(src)<<"[src] Says: I'll teach you that in due time. Just keep training."


mob
	teacher
		Medicalteacher3
			//human = 1
			density=1
			//NPC = 1
			name="Gur"
			icon='Guy.dmi'
			clan="None"
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				.=..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='inoH.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(0,0,0)
					var/Shirt='cvest.dmi'
					Shirt+=rgb(61,100,60)
					src.icon=Base
					src.overlays+='Boxers.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+='pants.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+='LeafJounin.dmi'
					src.overlays+=Shirt
					src.overlays+=Hair
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				var/can=1
				if(usr.medicalmastery>=500&&"Chakra Scalpes" in usr.jutsus&&usr.CC>=100&&usr.clan=="None")
					if(usr.special!=""||usr.special!="Scalpes")//"Yin Healing" in usr.jutsus||"Strength of 100" in usr.jutsus)
						oview(src)<<"[src] Says: Get away from me."
						can=0
					if(can>=1)
						if(usr.medicalmastery>=500)
							cl+="Extract"
						if(usr.medicalmastery>=600)
							cl+="Experiment"
						if(usr.medicalmastery>=750)
							cl+="Implant"
				oview(src)<<"[src] Says: I could Cut you a new one."
				sleep(3)
				if(usr.medicalmastery>50)
					oview(src)<<"[src] Says: Do you wish to specilize in the art of chakra scalpes like me?"
					var/T = input("What to learn?","[src]") in list("Nothing") + cl
					if(T=="Nothing")
						return
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
						return
					if(T=="Extract")
						usr.contents += new /obj/skill/implant
						oview(src)<<"[src] teaches [usr] to [T] DNA."
						usr.jutsus += T
						usr.special="Scalpes"
						usr<<"You now specilize in Chakra scalpes."
					else if(T=="Experiment")
						usr.contents += new /obj/skill/implant2
						oview(src)<<"[src] teaches [usr] to [T] on DNA."
						usr.jutsus += T
					else if(T=="Implant")
						usr.contents += new /obj/skill/implant3
						oview(src)<<"[src] teaches [usr] to [T] DNA."
						usr.jutsus += T
					else
						oview(src)<<"[src] Says: I'll teach you that in due time. Just keep training."
















obj
	skill
		medic1
			verb
				heal()
					set category = "Skills"
					set name = "Shousen"
					if(src.cooldown)
						usr<<"You must wait [src.cooldown] seconds before you can use this again."
						return
					if(usr.handseal(20,1))
						src.cooldown=7
						spawn(10)
							while(src.cooldown>0)
								if(src)
									src.cooldown-=1
								sleep(10)
						var/i=src.level
						if(i<1)
							i=1
						if(i>55)
							i=55
						src.levelgain(50,src.level)
						spawn(1)
							if(prob(40))
								usr.medicalmastery+=0.5
						var/found=0
						for(var/mob/M in get_step(usr,usr.dir))
							found=1
							spawn(1)
								usr.ninincrease(2)
							usr<<"You heal [M]!"
							M<<"[usr] gives up their chakra to heal you!"
							flick("throw",usr)
							var/healamm=rand(usr.Mchakra*0.01,usr.Mchakra*0.03)+src.level
							usr.chakra-=healamm
							M.health+=healamm
							if(M.health>=M.Mhealth)
								M.koamm-=i*0.09
								if(M.koamm<0)
									M.koamm=0
								if(M.ko==2)
									M.struggle+=i*0.125
							if(prob(45)&&M.poison)
								M.poison-=i*0.125
								M<<"The poison weakens."
								usr<<"[M]'s poison weakens."
								if(M.poison<=0)
									M.poison=0
									M.poisontype=0
									M<<"The poison dissamates..."
									usr<<"[M]'s poison dissamates..."
							break
						if(!found)
							usr<<"<font color=red size=1>There is no need to use this now. No one is in front of you!</font>"
							return
		medic2
			verb
				scalpes()
					set category = "Skills"
					set name = "Chakra Scalpes"
					if(usr.chakraS)
						usr.chakraS=0
						return
					if(src.cooldown)
						usr<<"You must wait [src.cooldown] seconds before you can use this again."
						return
					if(usr.handseal(20,1))
						src.cooldown=7
						spawn(10)
							while(src.cooldown)
								if(src)
									src.cooldown-=1
								sleep(10)
						view(usr)<<"[usr] Says: Chakra Scalpes!"
						spawn(1)
							if(prob(30))
								usr.medicalmastery+=0.9
						usr.chakraS=1
						while(usr.chakraS&&usr.ko==0)
							var/divider=usr.CC+(usr.gen*0.01)
							usr.chakra-=1000/divider
							sleep(15)
						usr.chakraS=0
						usr<<"Your Chakra Scalpes fade."
		medic3
			verb
				selfheal()
					set category = "Skills"
					set name = "Yin Healing"
					if(src.cooldown)
						usr<<"You must wait [src.cooldown] seconds before you can use this again."
						return
					if(usr.handseal(200,1))
						src.cooldown=10
						spawn(10)
							while(src.cooldown)
								if(src)
									src.cooldown-=1
								sleep(10)
						view(usr)<<"[usr] Says: Yin Healing Wound Destruction!"
						var/i=src.level
						if(i<1)
							i=1
						if(i>6)
							i=6
						spawn(1)
							if(prob(60))
								usr.medicalmastery+=0.5
						if(usr.yinhealing==0)
							usr.yinhealing=1
							while(usr.yinhealing&&usr.chakra>50)
								if(usr.health<usr.Mhealth)
									usr.health+=(src.level*i)
									usr.chakra-=(src.level*i)
									if(prob(5))
										src.levelgain(50,src.level)
									if(usr.health>usr.Mhealth)
										usr.health=usr.Mhealth
								sleep(10-i)
							usr.yinhealing=0
							usr<<"Yin healing has deactivated."
						else
							usr.yinhealing=0

		implant
			verb
				dnatake()
					set category = "Skills"
					set name = "Extract DNA"
					if(src.cooldown)
						usr<<"You must wait [src.cooldown] seconds before you can use this again."
						return
					if(usr)
						src.cooldown=180
						if(src.level>1)
							src.cooldown=180/src.level
						spawn(1)
							while(src.cooldown)
								if(src)
									src.cooldown-=1
								sleep(10)
						src.levelgain(4,src.level)
						//spawn(1)
							//usr.kincrease(1)
						for(var/mob/M in get_step(usr,usr.dir))
							if(istype(M,/mob/npc/Corpse))
								if(M)
									oview(usr)<<"[usr] takes some of [M]'s blood."
									for(var/C in usr.DNA)
										if(C=="[M.clan]")
											usr<<"You discard the dna already having some."
											src.cooldown=30
											return
									if(M.shari)
										usr<<"You take an imaginary sharingan."
										M.shari-=1
										src.cooldown=10
										return
									else if(M.bya)
										usr<<"You retrive an imaginary Byakugan."
										M.bya-=1
										src.cooldown=10
										return
									else if(M.rinnegan)
										usr<<"You retrive an imaginary Rinnegan."
										M.rinnegan-=1
										src.cooldown=10
										return
									else if(M.clan=="None"||M.clan=="")
										usr<<"They dont have anything worth taking."
										src.cooldown=10
										return
									else
										usr<<"You take a DNA sample from [M]."
										usr.DNA+="[M.clan]"
								break
							else
								if(M)
									if(M.clan=="None"||M.clan=="")
										usr<<"They dont have anything worth taking."
										src.cooldown=10
										return
									if(M.ko)
										oview(usr)<<"[usr] takes some of [M]'s blood."
										for(var/C in usr.DNA)
											if(C=="[M.clan]")
												usr<<"You discard the dna already having some."
												src.cooldown=30
												return
										usr<<"You take a DNA sample from [M]."
										usr.DNA+="[M.clan]"
									else
										usr<<"They need to be knocked out first."
										src.cooldown=10
										return
								break
		implant2
			verb
				dnaexp()
					set category = "Skills"
					set name = "DNA Experiment"
					if(src.cooldown)
						usr<<"You must wait [src.cooldown] seconds before you can use this again."
						return
					if(usr)
						src.cooldown=10
						spawn(1)
							while(src.cooldown)
								if(src)
									src.cooldown-=1
								sleep(10)
						//spawn(1)
							//usr.kincrease(1)
						var/choosing=list()
						for(var/H in usr.DNA)
							if(H in usr.implantable)

							else if(H=="Uchiha"&&"Sharingan" in usr.implantable)

							else if(H=="Hyuuga"&&"Byakugan" in usr.implantable)

							else if(H=="Kaguya"&&"Bone" in usr.implantable)

							else
								choosing+=H
						var/M = input("Experiment with?","[src]") in list("None") + choosing // + list("Cancel")
						if(M=="None")
							return
						if(src.level<1)
							src.levelgain(5,src.level)
						view(usr)<<"[usr] runs a few tests on [M] DNA."
						sleep(rand(50,100))
						if(src.level<1)
							if(prob(src.mastery))
								if(prob(1))
									if(M=="Uchiha")
										usr<<"You learn to implant The Sharingan."
										usr.implantable+="Sharingan"
									else if(M=="Hyuuga")
										usr<<"You learn to implant The Byakugan."
										usr.implantable+="Byakugan"
									else if(M=="Kaguya")
										usr<<"You learn to implant [M] Bones."
										usr.implantable+="Bone"
									else
										usr<<"You learn to implant [M] DNA."
										usr.implantable+="[M]"
								src.mastery+=pick(0.1,0.5,1,0.5,0.1)
								usr<<"You learn more about [M] DNA."
								usr.DNA-=M
							else
								usr<<"You failed to learn more about [M] DNA."
								usr.DNA-=M
								if(prob(10))
									src.mastery+=pick(0.01,0.02,0.05,0.1,0.05,0.03,0.02,0.01)
									usr<<"You learn a bit from your mistakes."
						else
							if(prob(10))
								if(M=="Uchiha")
									usr<<"You learn to implant the Sharingan."
									usr.implantable+="Sharingan"
								else if(M=="Hyuuga")
									usr<<"You learn to implant the Byakugan."
									usr.implantable+="Byakugan"
								else if(M=="Kaguya")
									usr<<"You learn to implant [M] Bones."
									usr.implantable+="Bone"
								else
									usr<<"You learn to implant [M] DNA."
									usr.implantable+="[M]"
								//usr<<"You learn to implant [M] DNA."
								//usr.implantable+="[M]"
								usr.DNA-=M
							else
								usr<<"You failed to learn anything about [M] DNA."
								usr.DNA-=M
		implant3
			verb
				dnaimp()
					set category = "Skills"
					set name = "Implant DNA"
					if(src.cooldown)
						usr<<"You must wait [src.cooldown] seconds before you can use this again."
						return
					if(usr)
						src.cooldown=10
						spawn(1)
							while(src.cooldown)
								if(src)
									src.cooldown-=1
								sleep(10)
						//spawn(1)
							//usr.kincrease(1)
						var/what=list()
						for(var/H in usr.implantable)
							if("[H]" in usr.DNA&&"[H]" in usr.implantable)
								what+=H
						var/M = input("Implant what DNA?","[src]") in list("None") + what // + list("Cancel")
						if(M=="None")
							return
						var/who=list()
						for(var/mob/T in view(1,usr))
							if(T.client&&T.clan!=M)
								if(M in T.implants)

								else
									who+=T
						var/mob/U = input("Implant on who?","[src]") in list("None") + who // + list("Cancel")
						if(U=="None")
							return
						if(U==usr&&src.level<1)
							usr<<"You can't do this to yourself yet."
							return
						if(src.level<1)
							src.mastery+=1
						var/myloc=usr.loc
						var/theirloc=U.loc
						view(usr)<<"[usr] begins inserting [M] DNA into [U]."
						sleep(rand(50,100))
						if(usr.loc==myloc&&U.loc==theirloc)
							if(src.level<1)
								src.levelgain(3,src.level)
							view(usr)<<"[usr] finishes the [M] DNA implant."
							if(src.level<1)
								if(prob(src.mastery))
									usr<<"You implant [M] DNA into [U]."
									view(usr)<<"[usr] says: Operation Sucess."
									U.implants+="[M]"
									src.mastery+=3
									usr.DNA-=M
								else
									view(usr)<<"[usr] says: Uh oh...."
									usr<<"You failed to implant the [M] DNA."
									U.chakra-=800000
									usr.DNA-=M
							else
								if(prob(95))
									usr<<"You implant [M] DNA into [U]."
									view(usr)<<"[usr] says: Operation Sucess."
									U.implants+="[M]"
									usr.DNA-=M
								else
									view(usr)<<"[usr] says: Opps..."
									usr<<"You failed to implant the [M] DNA."
									usr.DNA-=M
						else
							view(usr)<<"The Operation Failed."
							return