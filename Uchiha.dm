obj
	uchiha
		//pixel_x = 16
		pixel_y = 18
		sharingan1
			icon = 'UchihaClan.dmi'
			icon_state = "1"
			layer = FLOAT_LAYER
		sharingan2
			icon = 'UchihaClan.dmi'
			icon_state = "2"
			layer = FLOAT_LAYER
		sharingan3
			icon = 'UchihaClan.dmi'
			icon_state = "3"
			layer = FLOAT_LAYER
		itachimangekyou
			icon = 'UchihaClan.dmi'
			icon_state = "Itachi"
			layer = FLOAT_LAYER
		madaramangekyou
			icon = 'UchihaClan.dmi'
			icon_state = "Madara"
			layer = FLOAT_LAYER
		izunamangekyou
			icon = 'UchihaClan.dmi'
			icon_state = "Izuna"
			layer = FLOAT_LAYER
		obitomangekyou
			icon = 'UchihaClan.dmi'
			icon_state = "Kakashi"
			layer = FLOAT_LAYER
		shisuimangekyou
			icon = 'UchihaClan.dmi'
			icon_state = "Shisui"
			layer = FLOAT_LAYER
		othermangekyou
			icon = 'UchihaClan.dmi'
			icon_state = "Rose"
			layer = FLOAT_LAYER
		sasukemangekyou
			icon = 'UchihaClan.dmi'
			icon_state = "Sasuke"
			layer = FLOAT_LAYER
//if i make a copy skill, use a var for what is copied then when u use copy it'll act liek the usejutsu() proc
//but it will only contain one jutsu at a time

obj
	jutsu
		yasaka
			icon='UchihaClan.dmi'
			icon_state = "yasaka"
			density=1
			//layer = FLOAT_LAYER
			New()
				pixel_y=rand(-16,16)
				pixel_x=rand(-16,16)
				..()
				spawn(100)
					if(src)
						del src
				src.icon_state=pick("yasaka1","yasaka","yasaka2")
			Bump(A)
				if(istype(A,/mob/))
					var/mob/O = src.owner
					var/mob/M = A
					M.nindamage(src.power*1.5,1,O)
					del src
				if(istype(A,/obj/))
					del src
				if(istype(A,/turf/))
					del src

obj
	jutsu
		yasaka2//itachi's
			icon='UchihaClan.dmi'
			icon_state = "yasaka"
			//layer = FLOAT_LAYER
			density=1
			New()
				pixel_y=rand(-16,16)
				pixel_x=rand(-16,16)
				..()
				spawn(80)
					if(src)
						del src
				src.icon_state=pick("yasaka4","yasaka3","yasaka5")
			Bump(A)
				if(istype(A,/mob/))
					var/mob/O = src.owner
					var/mob/M = A
					M.gendamage(src.power*0.25,O)
					M.nindamage(src.power*0.75,1,O)
					del src
				if(istype(A,/obj/))
					del src
				if(istype(A,/turf/))
					del src
			Del()
				for(var/turf/x in view(1,src))
					var/obj/jutsu/tsukuyomiground/SC = new()
					SC.loc=locate(x.x,x.y,x.z)
					//view(src)<< sound('Smoke.wav',0,0,1)
				..()

obj/skill
	kamui
		icon='kamui.dmi'
		density=0
		New()
			..()
			spawn(20)
				while(src)
					for(var/mob/A in src.loc)
						A.health-=300//change this entire codeing of kamui
					sleep(10)
			spawn(80)
				if(src)
					del src

obj/skill
	kamui2//for appearances, objects
		icon='kamui.dmi'
		density=0
		layer=TURF_LAYER
		New()
			..()
			spawn(7)
				if(src)
					del src

obj/skill
	kamui3//for appearances, for people
		icon='kamui.dmi'
		pixel_x = 16
		pixel_y = 22
		density=0
		layer=FLOAT_LAYER
		New()
			..()
			spawn(7)
				if(src)
					del src





obj
	jutsu
		tsukuyomiground
			icon='tsukuyomieffects.dmi'
			icon_state=""
			density=0
			//NPC = 1
			//health = 1
			layer=TURF_LAYER
			New()
				..()
				spawn(rand(30,55))
					if(src)
						del src
				spawn(4)
					for(var/mob/M in view(0,src))
						M.stun+=rand(1,3)









mob
	var
		tmp/shari=0
		sharM=0
		tmp/mshar=0
		mswho=""
		mskills=10//how many kills needed for ms
		msM=200//sharingan mastery needed for ms
		hasshar=0
		hasms=0
		tmp/msprep=0
		hasems=0
		emswho=""
		armsharingan=0


obj/skill/sharingan
	name = "Sharingan"
	icon = 'Skillcards.dmi'
	icon_state = "Sharingan"
	verb
		Sharingan()
			set category = "Doujutsu"
			if(src.cooldown-world.time>=0)
				usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
				return
			if(usr.clan!="Uchiha")
				return
			src.cooldown=world.time+100
			if(usr.handseal(10,0))
				//if(usr.firing)
					//return
				if(usr.shari||usr.mshar)
					usr<<"You release your sharingan."//;usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye);usr.shari=0;usr.IlluminateOff();usr.GenjutsuCounterMode=0;usr.SharCounter=0;usr.CopyMode=0;usr.ChakraSight(0);return
					src.overlays-='Icons/Jutsus/SEyes.dmi'
					src.overlays-='Icons/Jutsus/SEyes.dmi'
					usr.nin=usr.Mnin
					usr.gen=usr.Mgen
					usr.tai=usr.Mtai
					usr.shari=0
					//usr.mshar=0
					usr.dodgerate-=usr.dodgeplus
					usr.dodgeplus=0
					if(usr.mshar)
						spawn(1)
							usr.MangekyouPrep()
						return
					/*usr.verbs-= /mob/uchiha/verb/Amateratsu
					usr.verbs-= /mob/uchiha/verb/Amateratsu
					usr.verbs-= /mob/uchiha/verb/Amateratsu
					usr.verbs-= /mob/uchiha/verb/Susano
					usr.verbs-= /mob/uchiha/verb/Susano
					usr.verbs-= /mob/uchiha/verb/Susano
					usr.verbs -= typesof(/mob/amat/verb)
					usr.verbs -= typesof(/mob/ms/verb)
					usr.verbs -= typesof(/mob/shisui/verb)*/
					return
				else
					if(!usr.shari)
						if(usr.msprep)
							spawn(1)
								usr.MangekyouPrep()
							return
						//src.icon_state="1";usr.ChangeEyeStyle(usr.EyeStyle,200,0,0)
						if(usr.sharM==0)
							usr.AwardMedal("Sharingan!")
						/*if(prob(3)&&src.sharM>1000&&src.cgms)//make it so that when they kill someone and have the reqz to get it, they get it that way
							src.firing=1
							spawn(30)
								src<<"You try to activate your eyes but they won't seem to activate."
								sleep(30)
								src<<"Your eyes begin to burn...."
								sleep(80)
								src.mswho=pick("Itachi","Obito","Sasuke","Izuna","Madara")//,"Shisui")
								src.firing=0
								src.hasms=1
								src.cgms=0
								usr<<"Your Sharingan activates with a heavy pressure!"
								//src.verbs+= /mob/shar/verb/Msharingan
								src.MangekyouPrep()*/
							//return
						if(usr.sharM<30)
							view()<<"[usr]'s eyes shine red!"
							usr.dodgerate+=0.02
							usr.dodgeplus+=0.02
							spawn(1)
								var/obj/uchiha/sharingan1/A = new()
								usr.overlays += A
								sleep(15)
								usr.overlays -= A
						if(usr.sharM<61&&usr.sharM>30)
							view()<<"[usr]'s eyes shine brightly red!"
							usr.dodgerate+=0.06
							usr.dodgeplus+=0.06
							spawn(1)
								var/obj/uchiha/sharingan2/A = new()
								usr.overlays += A
								sleep(15)
								usr.overlays -= A
						if(usr.sharM>61&&usr.sharM<200)
							view()<<"[usr]'s eyes shine brightly red."
							usr.dodgerate+=0.08
							usr.dodgeplus+=0.08
							spawn(1)
								var/obj/uchiha/sharingan3/A = new()
								usr.overlays += A
								sleep(15)
								usr.overlays -= A
						if(usr.sharM>200)
							view()<<"[usr]'s eyes shines brightly red, revealing a very mature Sharingan!"
							usr.dodgerate+=0.02
							usr.dodgeplus+=0.02
							var/obj/uchiha/sharingan3/A = new()
							usr.overlays += A
							sleep(15)
							usr.overlays -= A
						if(usr.sharM>=31)
							usr<<"You can see through taijutsu techniques a lot better now!"//;usr.SharCounter=1
							usr.dodgerate+=0.12
							usr.dodgeplus+=0.12
						if(usr.sharM>=61)
							usr<<"You can see through taijutsu techniques on a high level!"//;usr.SharCounter=2
							usr.dodgerate+=0.2
							usr.dodgeplus+=0.2
						usr.shari=1//;usr.Illuminate();sleep(30);usr.overlays-='Icons/Jutsus/sharinganthing.dmi';usr.ChakraSight(1)
						usr.overlays-='Icons/Jutsus/SEyes.dmi'
						usr.overlays+='Icons/Jutsus/SEyes.dmi'
						spawn(1)
							while(usr.shari)
								var/A=usr.sharM
								if(A<1) A=1
								var/ChakraDrain=(usr.Mchakra/(A*18))
								if(ChakraDrain>52)
									ChakraDrain=52
								usr.chakra-=ChakraDrain
								if(prob(1))
									usr.sharM+=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
								if(usr.hasms&&usr.blindness>=0.5)
									if(prob(10))
										spawn(1)
											usr.blinding()
								//if(usr.Charging&&prob(3))
									//usr.sharM+=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
								sleep(22)


mob
	var
		tmp/IdoList=list()



obj
	skill
		icon = 'Skillcards.dmi'
		icon_state = ""
		msbasic//for the ones who get amaterasu etc
			mangekyou
				icon = 'Skillcards.dmi'
				icon_state = "Amaterasu"
				verb
					Amat()
						set category = "Doujutsu"
						set name = "Amaterasu(Follow)"
						if(usr.mshar<=0)
							usr<<"You need to activate the mangekyou sharingan first."
							return
						if(src.cooldown-world.time>=0)
							usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
							return
						src.cooldown=world.time+450
						if(usr.handseal(600,0))//600 chakra
							usr.blindness+=5
							//view(usr)<<"[usr]: Amaterasu!"
							usr.Say("Amaterasu!")
							var/obj/jutsu/amaterasu/SC = new()
							SC.owner=usr
							SC.dir=usr.dir
							SC.power=usr.nin*0.50
							SC.loc=usr.loc
			mangekyou2//sasuke
				icon = 'Skillcards.dmi'
				icon_state = "Amaterasu"
				verb
					Amat()
						set category = "Doujutsu"
						set name = "Amaterasu(Spread)"
						if(usr.mshar<=0)
							usr<<"You need to activate the mangekyou sharingan first."
							return
						if(src.cooldown-world.time>=0)
							usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
							return
						src.cooldown=world.time+450
						if(usr.handseal(750,0))//600 chakra
							usr.blindness+=7
							usr.Say("Amaterasu!")
							if(usr.mswho=="Sasuke"||usr.mswho=="Izuna")
								if(usr.target)
									var/mob/T = usr.target
									var/obj/jutsu/amaterasu2/SC = new()
									SC.owner=usr
									SC.dir=usr.dir
									SC.power=usr.nin*0.80
									SC.loc=T.loc
									for(var/turf/Y in view(1,T))
										var/obj/jutsu/bfire2/t = new()
										t.owner=usr
										t.dir=usr.dir
										t.power=usr.nin*0.20
										t.loc=locate(Y.x,Y.y,Y.z)
								else
									var/obj/jutsu/amaterasu2/SC = new()
									SC.owner=usr
									SC.dir=usr.dir
									SC.power=usr.nin*0.90
									SC.loc=usr.loc
									for(var/turf/Y in view(1,usr))
										var/obj/jutsu/bfire2/t = new()
										t.owner=usr
										t.dir=usr.dir
										t.power=usr.nin*0.20
										t.loc=locate(Y.x,Y.y,Y.z)
							else
								var/obj/jutsu/amaterasu2/SC = new()
								SC.owner=usr
								SC.dir=usr.dir
								SC.power=usr.nin*0.65
								SC.loc=usr.loc
								for(var/turf/Y in view(1,usr))
									var/obj/jutsu/bfire2/t = new()
									t.owner=usr
									t.dir=usr.dir
									t.power=usr.nin*0.20
									t.loc=locate(Y.x,Y.y,Y.z)
			mangekyou3//izuna special
				icon = 'Skillcards.dmi'
				icon_state = "WhiteAmaterasu"
				verb
					Amat()
						set category = "Doujutsu"
						set name = "White Amaterasu"
						if(usr.mshar<=0)
							usr<<"You need to activate the mangekyou sharingan first."
							return
						if(src.cooldown-world.time>=0)
							usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
							return
						src.cooldown=world.time+600
						if(usr.handseal(1250,0))//600 chakra
							usr.blindness+=11
							usr.Say("Amaterasu!")
							var/obj/jutsu/amaterasu3/SC = new()
							SC.owner=usr
							SC.dir=usr.dir
							SC.power=usr.nin*1.20
							SC.loc=usr.loc
			tsukuyomi//itachi's maybe?
				icon = 'Skillcards.dmi'
				icon_state = ""
				verb
					tsuku()
						set category = "Doujutsu"
						set name = "Tsukuyomi"
						if(usr.mshar<=0)
							usr<<"You need to activate the mangekyou sharingan first."
							return
						if(src.cooldown-world.time>=0)
							usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
							return
						src.cooldown=world.time+1200
						if(usr.handseal(1000,0))//600 chakra
							src.cooldown=120
							spawn(1)
								while(src.cooldown)
									if(src)
										src.cooldown-=1
									sleep(10)
							usr.blindness+=9
							usr<<"You activate tsukuyomi."
							var/mob/ST   //Specified Target     I defined these variables so that the mob or turf is not lost in runtime
																//By movement or other things
							var/Distance=round(usr.sharM/100)
							if(Distance<3) Distance=3
							if(Distance>10) Distance=10
							var/turf/DM = get_steps(usr,usr.dir,Distance)  //Distance Marker
							var/a=0
							while(a<Distance&&!ST)
								a++
								DM = get_steps(usr,usr.dir,a)
								for(var/mob/L in DM)
									if(L!=usr&&L.dir==(get_dir(L,usr))&&usr.dir==(get_dir(usr,L))&&L.ingenjutsu==0&&L.ko<=0)
										ST=L   //Catch the first mob in the line. If he makes eyecontact then he's caught
										//If not, then the jutsu ends because anyone behind him wouldn't make eyecontact period.
										break
							//var/found=0
							//var/look=0
							if(ST)
								var/mob/M = ST
								if(M)
									usr<<"[M] looked into your eyes."
									spawn(3)
										M.ingenjutsu=1
										var/duration=((usr.gen-M.gen)+(usr.sharM-M.sharM))
										if(duration>=30)
											duration=30
										if(duration<=0)
											usr<<"[M] was uneffected by your tsukuyomi."
											//M.ingenjutsu=1
										else
											M.ingenjutsu=1
											M.Frozen=1
											M<<"[usr] Says: This is the world of Tsukuyomi where all things I control, I'll be keeping you here for the next 72 hours."
											//M.sight |= BLIND
											//M.sight |= (SEE_SELF)
											M.dir=SOUTH
											duration=round(duration)+1
											var/phrases=pick("What's wrong?","Have you given up already?","Maybe I'll kill you now...")
											spawn(5)
												while(M.ingenjutsu>0&&M.ko==0)
													if(prob(1))
														M<<"[usr] stabs you!"
													M.gendamage((usr.gen*0.10),usr)
													M.koamm+=0.15
													M<<sound('SFX/Slice.wav',0)
													sleep(rand(1,5))
											while(duration>0&&M)
												if(prob(3))
													M<<"[usr] Says: [phrases]"
												if(M.ko>0)
													duration=1
												duration-=1
												sleep(10)
											M<<"[usr] Says: Have you given up? You still have 71 hours 59 minutes and 59 seconds to go."
											sleep(50)
											if(M)
												//M.sight&=~(SEE_SELF|BLIND)
												M.gendamage((usr.gen*0.10),usr)
												M.ingenjutsu=0
												M.Frozen=0
										//var/image/A = image(usr.icon,M)
							else
								src<<"You couldn't make eye contact with anyone."
			mangekyou4
				icon = 'Skillcards.dmi'
				icon_state = ""
				verb
					yasaka()
						set category = "Doujutsu"
						set name = "Yasaka Magatama"
						if(usr.mshar<=0)
							usr<<"You need to activate the mangekyou sharingan first."
							return
						if(src.cooldown-world.time>=0)
							usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
							return
						src.cooldown=world.time+450
						if(usr.handseal(1200,0))//600 chakra
							var/mob/M = null
							for(var/mob/npc/susanoo/T in view(usr))
								if(T.owner==usr)
									M=T
									break
							if(M==null)
								usr<<"You need to activate susano'o first."
								return
							usr.blindness+=5
							view(usr)<<"[usr]: Yasaka Magatama!"
							var/i=4
							if(usr.mswho=="Itachi")
								while(i>0)
									var/obj/jutsu/yasaka2/A=new()
									A.power=usr.nin*1.10
									A.owner=usr;A.loc=M.loc
									A.dir=M.dir//;walk(A,A.dir)
									if(i==3)
										A.dir=turn(A.dir,45)
										step(A,A.dir)
										if(A)
											A.dir=M.dir
									if(i==2)
										A.dir=turn(A.dir,-45)
										step(A,A.dir)
										if(A)
											A.dir=M.dir
									//if(i==3)
										//A.dir=turn(A.dir,45)
									//if(i==2)
										//A.dir = turn(A.dir,-45)
									//if(A.icon=='BKatonTechniques.dmi') A.RandomAlameProc("Blue",4,1,24,32,src.dir,3,5)
									if(A)
										walk(A,A.dir)
									i-=1
									sleep(1)
							else
								while(i>0)
									var/obj/jutsu/yasaka/A=new()
									A.power=usr.nin*1.20
									A.owner=usr;A.loc=M.loc
									A.dir=M.dir//;walk(A,A.dir)
									if(i==3)
										A.dir=turn(A.dir,45)
										step(A,A.dir)
										if(A)
											A.dir=M.dir
									if(i==2)
										A.dir=turn(A.dir,-45)
										step(A,A.dir)
										if(A)
											A.dir=M.dir
									//if(i==3)
										//A.dir=turn(A.dir,45)
									//if(i==2)
										//A.dir = turn(A.dir,-45)
									//if(A.icon=='BKatonTechniques.dmi') A.RandomAlameProc("Blue",4,1,24,32,src.dir,3,5)
									if(A)
										walk(A,A.dir)
									i-=1
									sleep(1)


		obito
			kamui
				icon = 'Skillcards.dmi'
				icon_state = ""
				verb
					kamui()
						set category = "Doujutsu"
						set name = "Kamui Destruction"
						if(usr.mshar<=0)
							usr<<"You need to use your mangekyou sharingan for this technique."
							return
						if(src.cooldown-world.time>=0)
							usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
							return
						src.cooldown=world.time+1600
						if(usr.handseal(2000,0))
							if(usr.target)
								var/mob/M = usr.target
								usr<<"You target [M] with your kamui."
								if(prob(30))
									M<<"[usr] is targeting you with their mangekyou sharingan."
								M.overlays+='kamui.dmi'
								var/part=pick("Arm","Leg","Chest","Neck","Head","Leg","Arm","Chest")
								var/multi=1
								if(part=="Chest")
									multi=1.6
								if(part=="Neck")
									multi=1.8
								if(part=="Head")
									multi=3
								if(part=="Arm")
									multi=1.4
								if(part=="Leg")
									multi=1.3
								sleep(rand(30,50))
								if(M in view(5,usr))
									view(M)<<"[M] is hit in the [part] with kamui!"
									usr<<"You hit [M] in the [part] using kamui."
									M.alldamage((usr.nin*1.3)*multi,usr)
									M.koamm+=rand(3,7)*multi
									M.overlays-='kamui.dmi'
									M.overlays-='kamui.dmi'
									M.overlays-='kamui.dmi'
									spawn(1)
										if(part=="Chest")
											if(prob(40))
												view(M)<<"[M] has been sucked into the Kamui!"
												var/newz=pick(5,1,22,25,11,14,21,9,18)
												M.loc=locate(rand(1,200),rand(1,200),newz)
												if(newz==25)
													usr<<"[M] has been sent to the kamui dimension."
									if(usr.hasems<=0)
										usr.blindness+=10
										if(prob(80))
											spawn(rand(100,200))
												usr<<"The side effects from using kamui kick in."
												usr.koamm+=rand(1,4)*multi
												if(prob(10))
													usr.blindness+=rand(3,12)
												usr.Blood()
												usr.alldamage(usr.Mhealth*0.35,usr)
								else
									usr<<"[M] escaped the sight of your kamui."
									M.overlays-='kamui.dmi'
									M.overlays-='kamui.dmi'
									M.overlays-='kamui.dmi'
							else
								usr<<"You need to aquire a target."

					/*kamui4()
						set category = "Doujutsu"
						set name = "Kamui Surroundings"//as in all objects even people
						if(src.cooldown)
							usr<<"You must wait [src.cooldown] seconds before you can use this again."
							return
						if(usr.handseal(usr.Mchakra*0.10,0))
							src.cooldown=10//was 120
							spawn(1)
								while(src.cooldown)
									if(src)
										src.cooldown-=1
									sleep(10)
							//spawn(1)
							usr<<"You use kamui on all nearby jutsu."
							if(src.mastery<5)
								src.mastery=5
							if(src.mastery>=99)
								src.mastery=99
							for(var/obj/jutsu/U in view(2))
								spawn(1)
									var/obj/skill/kamui2/SC = new()
									//SC.loc=src.loc
									usr.Frozen=1
									spawn(10)
										usr.Frozen=0
									//flick("groundjutsu",src)
									//sleep(4)
									//src.icon_state="groundjutsuse"
									if(SC&&U)
										SC.loc=U.loc
										if(usr.z==25)
											U.z=pick(5,1,22,11,14,21,9,18)
										else
											U.z=25
											//usr.amControlling=1
												//usr.whoIControl=A
												//usr.client.perspective = EYE_PERSPECTIVE
												//usr.client.eye = A
								sleep(1)*/
			kamui2
				verb
					kamui2()
						set category = "Doujutsu"
						set name = "Kamui Teleport(Person)"
						if(usr.inevent)
							usr<<"Not while in a event."
							return
						if(src.cooldown-world.time>=0)
							usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
							return
						src.cooldown=world.time+200
						if(usr.handseal(usr.Mchakra*0.06,2))
							var/people=list()
							for(var/mob/M in world)
								if(M.client)
									people += M
							var/mob/M = input("Who?","[usr]") in list("Nevermind") + people
							if(M=="Nevermind")
								return
							if(src.mastery>99)
								src.mastery=99
							if(src.mastery<20)
								src.mastery=20
							world<<"Mastery = [src.mastery]"
							if(prob(src.mastery))
								if(src.mastery<99)
									src.mastery+=10
								usr.overlays+='kamui.dmi'
								sleep(15)
								M.overlays+='kamui.dmi'
								sleep(20)
								usr.loc=M.loc
								usr.overlays-='kamui.dmi'
								M.overlays-='kamui.dmi'
										//usr.amControlling=1
											//usr.whoIControl=A
											//usr.client.perspective = EYE_PERSPECTIVE
											//usr.client.eye = A
							else
								usr<<"You failed to use warp!"
								if(src.mastery<10)
									src.mastery=10
								return
					kamui3()
						set category = "Doujutsu"
						set name = "Kamui Dimension"
						if(usr.inevent)
							usr<<"Not while in a event."
							return
						if(src.cooldown-world.time>=0)
							usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
							return
						src.cooldown=world.time+100
						if(usr.handseal(usr.Mchakra*0.08,0))
							if(prob(src.mastery))
								if(src.mastery<99)
									src.mastery+=10
									if(src.mastery>99)
										src.mastery=99
								else
									usr<<"You failed to warp."
									return
							var/going=15
							switch(input("Where do you want to go?") in list("Leaf","Rock","Sand","Outer"))
								if("Outer")
									going=25//25 will be it when its added to the map
									if(usr.z==25)
										going=pick(5,1,22,11,14,21,9,18)
								if("Leaf")
									going=5
								if("Sand")
									going=1
								if("Rock")
									going=22
								if("Sound")
									going=11
								if("Waterfall")
									going=14
								if("Rain")
									going=21
								if("Mist")
									going=9
								if("Cloud")
									going=18
							for(var/mob/C in oview(1,usr))
								spawn(1)
									if(C.client)
										if(C!=usr)
											C.overlays+='kamui.dmi'
											sleep(20)
											C.z=going
											C.overlays-='kamui.dmi'
											C.overlays-='kamui.dmi'
											C.overlays-='kamui.dmi'
											if(C!=usr&&going==15)
												usr.IdoList += C
							usr.overlays+='kamui.dmi'
							sleep(10)
							usr.z=going
							usr.overlays-='kamui.dmi'
							usr.overlays-='kamui.dmi'
							usr.overlays-='kamui.dmi'
					IdoSummon(mob/M in usr.IdoList)
						set category="Doujutsu"
						set name = "Kamui: Summon"
						if(usr.inevent)
							usr<<"Not while in a event."
							return
						if(M)
							M.underlays+='kamui.dmi'
							sleep(30)
							if(usr.z!=2)
								usr.IdoList -= M
							M.loc = usr.loc
							spawn(5)
								M.underlays-='kamui.dmi'
					kamui4()
						set category = "Doujutsu"
						set name = "Warp Surroundings"//as in all objects even people
						if(src.cooldown-world.time>=0)
							usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
							return
						src.cooldown=world.time+300
						if(usr.handseal(usr.Mchakra*0.10,0))
							//spawn(1)
							usr<<"For the next 5 seconds you will now use kamui on all nearby jutsu that are not your own."
							if(src.mastery<5)
								src.mastery=5
							if(src.mastery>=99)
								src.mastery=99
							var/timer=5
							while(timer>0)
								for(var/obj/jutsu/U in getcircle(usr,2))
									spawn(1)
										var/obj/skill/kamui2/SC = new()
										if(SC&&U)
											SC.loc=U.loc
											if(U.z==25)
												U.z=pick(5,1,22,11,14,21,9,18)
											else
												U.z=25
								timer-=1
								sleep(10)














obj
	skill
		mangekyou
			icon = 'Skillcards.dmi'
			icon_state = "Mangekyou"
			verb
				Msharingan()
					set name = "Use Mangekyou"
					set category = "Doujutsu"
					if(usr.hasms)
						if(usr.msprep==0)
							usr.msprep=1
							usr<<"You are now going to use your Mangekyou Sharingan the next time you use your Sharingan."
						else
							usr.msprep=0
							usr<<"You won't use your Mangekyou Sharingan the next time you use your Sharingan."

mob/proc
	MangekyouPrep()
		//if(src.firing)
			//return
		if(src.mshar)
			/*src.mangekyou=0;src.ChangeEyeStyle(src.EyeStyle,src.reye,src.geye,src.beye);src.IlluminateOff()
			src.verbs-= /mob/Sharingan/verb/Mind_Genjutsu
			src.verbs-= /mob/Sharingan/verb/Invisibility
			src.verbs-= /mob/Sharingan/verb/False_Bunshin
			for(var/obj/SkillCards/Kamui/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/TimeCollaboration/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Phase/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Amateratsu/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/AmateratsuProjectile/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/WhiteAmateratsuProjectile/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Susanoo/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Tsukiyomi/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/Kamui/A in src.LearnedJutsus)
				del(A)
			for(var/obj/SkillCards/WhiteAmaterasu360/A in src.LearnedJutsus)
				del(A)*/
			for(var/obj/skill/msbasic/I in src.contents)
				del I
			for(var/obj/skill/shisui/T in src.contents)
				del T
			for(var/obj/skill/susanoo/Y in src.contents)
				del Y
			src<<"You release your Mangekyou Sharingan."//;src.ChakraSight(0);src.Phasing=0
			src.overlays-='Icons/Jutsus/SEyes.dmi'
			src.mshar=0
			src.overlays-='Icons/Jutsus/SEyes.dmi'
			/*src.verbs-= /mob/uchiha/verb/Amateratsu
			src.verbs-= /mob/uchiha/verb/Amateratsu
			src.verbs-= /mob/uchiha/verb/Amateratsu
			src.verbs-= /mob/uchiha/verb/Susano
			src.verbs-= /mob/uchiha/verb/tsukuyomi9
			src.verbs-= /mob/uchiha/verb/Susano
			src.verbs-= /mob/uchiha/verb/Susano
			src.verbs -= typesof(/mob/amat/verb)
			src.verbs -= typesof(/mob/ms/verb)
			src.verbs -= typesof(/mob/shisui/verb)*/
			/*if(src.MUses>250)
				var/obj/Mshar/MM=new()
				MM.screen_loc = "1,1 to 19,19"
				src.client.screen+=MM
				if(src.MUses>250&&usr.MUses<350)
					MM.icon_state="weak"
				if(src.MUses>=350&&usr.MUses<500)
					MM.icon_state="strong"
				if(src.MUses>=500)
					MM.icon_state="blinder"
			if(src.SusanooIn)
				for(var/obj/Jutsu/Uchiha/Susanoo/A in world)
					if(A.Owner==src)
						del(A)
				src.SusanooIn=0*/
		else
			//if(src.shari)
				//src.ChangeEyeStyle(src.EyeStyle,src.reye,src.geye,src.beye);src.shari=0;src.IlluminateOff();src.GenjutsuCounterMode=0;src.SharCounter=0;src.CopyMode=0;src.ChakraSight(0);return
			src.mshar=1//;src.ChakraSight(1);src.ChangeEyeStyle(src.EyeStyle,200,0,0)
			src.msprep=0
			if(src.hasems<=0)
				view(9,src)<<"[src]'s pupils spin and transform into the Mangekyou Sharingan!"//;src.Illuminate()
			else
				view(9,src)<<"[src]'s pupils spin and transform into the Eternal Mangekyou Sharingan!"
			//src.mswho=pick("Itachi","Obito","Sasuke","Izuna","Madara")
			src.overlays-='Icons/Jutsus/SEyes.dmi'
			src.overlays+='Icons/Jutsus/SEyes.dmi'
			if(src.mswho=="Itachi"||src.mswho=="Sasuke"||src.mswho=="Madara"||src.mswho=="Shisui")
				src.contents += new /obj/skill/susanoo
				src.contents += new /obj/skill/msbasic/mangekyou4
			if(src.mswho=="Itachi"||src.mswho=="Izuna")
				src.contents += new /obj/skill/msbasic/mangekyou
			if(src.mswho=="Shisui")
				src.contents += new /obj/skill/shisui/mangekyou1
			if(src.mswho=="Sasuke"||src.mswho=="Izuna")
				src.contents += new /obj/skill/msbasic/mangekyou2
			if(src.mswho=="Izuna")
				src.contents += new /obj/skill/msbasic/mangekyou3
			if(src.mswho=="Itachi")
				src.contents += new /obj/skill/msbasic/tsukuyomi
			/*if(src.mswho=="Itachi"||src.mswho=="Sasuke"||src.mswho=="Madara")
				if(src.mswho=="Sasuke")
					src.verbs+= /mob/uchiha/verb/Amateratsu
					src.verbs+= /mob/uchiha/verb/tsukuyomi9
				if(src.mswho=="Itachi")
					src.verbs+= /mob/amat/verb/ProjectileAmaterasu
					src.verbs+= /mob/uchiha/verb/tsukuyomi9
				if(src.mswho=="Madara")
					src.verbs+= /mob/amat/verb/WhiteFireShot
				src.verbs+= /mob/uchiha/verb/Susano
			if(src.mswho=="Izuna")
				src.verbs+= /mob/amat/verb/WhiteProjectileAmaterasu*/
			if(src.mswho=="Obito")
				spawn(1)
					var/WE = 0
					for(var/obj/skill/obito/kamui/T in src.contents)
						WE+=1
						sleep(1)
					if(WE<=0)
						src.contents += new /obj/skill/obito/kamui//make into objects
					WE=0
					for(var/obj/skill/obito/kamui2/T in src.contents)
						WE+=1
						sleep(1)
					if(WE<=0)
						src.contents += new /obj/skill/obito/kamui2
			//if(src.mswho=="Shisui")
				//src.verbs += typesof(/mob/shisui/verb)
			spawn(1)
				if(src.mswho=="Sasuke")
					var/obj/uchiha/sasukemangekyou/A = new()
					src.overlays += A
					sleep(15)
					src.overlays -= A
				if(src.mswho=="Itachi")
					var/obj/uchiha/itachimangekyou/A = new()
					src.overlays += A
					sleep(15)
					src.overlays -= A
				if(src.mswho=="Obito")
					var/obj/uchiha/obitomangekyou/A = new()
					src.overlays += A
					sleep(15)
					src.overlays -= A
				if(src.mswho=="Shisui")
					var/obj/uchiha/shisuimangekyou/A = new()
					src.overlays += A
					sleep(15)
					src.overlays -= A
				if(src.mswho=="Madara")
					var/obj/uchiha/madaramangekyou/A = new()
					src.overlays += A
					sleep(15)
					src.overlays -= A
				if(src.mswho=="Izuna")
					var/obj/uchiha/izunamangekyou/A = new()
					src.overlays += A
					sleep(15)
					src.overlays -= A
				if(src.mswho=="Other")
					var/obj/uchiha/othermangekyou/A = new()
					src.overlays += A
					sleep(15)
					src.overlays -= A
			if(src.hasems<=0)
				src.blindness+=2
			/*for(var/obj/Mshar/MM in src.client.screen)
				del(MM)
			if(findtext(usr.mangekyouC,"madara",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Phase
			if(findtext(usr.mangekyouC,"shuriken",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/TimeCollaboration
			if(findtext(usr.mangekyouC,"itachi",1,0)||findtext(usr.mangekyouC,"sasuke",1,0)||findtext(usr.mangekyouC,"madara",1,0)||findtext(usr.mangekyouC,"star",1,0)||findtext(usr.mangekyouC,"gridlock",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Tsukiyomi
			if(findtext(usr.mangekyouC,"itachi",1,0)||findtext(usr.mangekyouC,"sasuke",1,0)||findtext(usr.mangekyouC,"6 point",1,0)||findtext(usr.mangekyouC,"shuriken",1,0)||findtext(usr.mangekyouC,"niro",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Amateratsu
			if(findtext(usr.mangekyouC,"sasuke",1,0)||findtext(usr.mangekyouC,"6 point",1,0)||findtext(usr.mangekyouC,"star",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/AmateratsuProjectile
			if(findtext(usr.mangekyouC,"gridlock",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/WhiteAmateratsuProjectile
				src.LearnedJutsus+=new/obj/SkillCards/WhiteAmaterasu360
			if(findtext(usr.mangekyouC,"kakashi",1,0)||findtext(usr.mangekyouC,"6 point",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Kamui
			if(findtext(usr.mangekyouC,"itachi",1,0)||findtext(usr.mangekyouC,"sasuke",1,0)||findtext(usr.mangekyouC,"niro",1,0))
				src.LearnedJutsus+=new/obj/SkillCards/Susanoo
			if(findtext(usr.mangekyouC,"shisui",1,0))
				src.verbs+= new /mob/Sharingan/verb/Mind_Genjutsu
				src.verbs+= new /mob/Sharingan/verb/Invisibility
				src.verbs+= new /mob/Sharingan/verb/False_Bunshin*/
			while(src.mshar)
				sleep(50)
				var/A=src.sharM
				if(A<1) A=1
				var/ChakraDrain=(src.Mchakra/(A*21))
				if(ChakraDrain>60)
					ChakraDrain=60
				src.chakra-=ChakraDrain
				//src.chakra-=(src.Mchakra/(src.sharM*10))
				if(src.hasems<=0)
					src.blindness+=1
				else
					src.blindness=0
				src.blinding()
				if(src.hasems<=0)
					if(prob(0.1))
						src<<"You lose control of your mangekyou sharingan!"
						src.blindness+=5
						src.blinding()
						src.MangekyouPrep()
						return
				if(src.hasems<=0)
					if(prob(10))
						src.Blood()
						src.alldamage(src.Mhealth*pick(0.01,0.02,0.03,0.02,0.01),src)
						src.blindness+=1







mob
	var
		tmp/izanamiactive=0
		tmp/koby=null
	proc
		izanami(mob/M)
			if(src&&M)
				//var/mob/M = src.target
				spawn(1)
					if(src.izanamiactive)
						src<<"It's already active."
						return
					var/myloc=src.loc
					var/myhp=src.health
					var/mych=src.chakra
					var/mywon=src.koamm
					var/mydir=src.dir
					var/youwon=M.koamm
					var/youloc=M.loc
					var/youhp=M.health
					var/youch=M.chakra
					var/youdir=M.dir
					var/time=((src.sharM*0.01)+(src.gen*0.01))
					if(time<3)
						time=3
					if(time>180)
						time=180
					src.izanamiactive=1
					src<<"You cast the genjutsu Izanami on [M]([time] seconds)."
					while(M.ko==0&&src&&M&&time>0&&src.izanamiactive>=1)
						if(src.ko&&src.koby==M)
							src<<"Izanami takes effect."
							time=0
							src.Frozen=1
							if(M)
								M.Frozen=1
							sleep(30)
							src.icon_state=""
							src.Frozen=0
							src.loc=myloc
							src.health=myhp
							src.chakra=mych
							src.koamm=mywon
							src.dir=mydir
							src.ko=0
							if(M)
								M.Frozen=0
								M.icon_state=""
								M.loc=youloc
								M.health=youhp
								M.chakra=youch
								M.koamm=youwon
								M.dir=youdir
								M.ko=0
							//src<<"Izanami takes effect."
						if(M.izanagi)
							time=0
							src<<"[M] has escaped your izanami!"
							M<<"Your izanagi was canceled out with [src]'s izanami"
							M.izanagi=0
						if(M.ko)
							time=0
						if(src.ko&&src.koby!=M)
							time=0
						time-=1
						sleep(10)
					src<<"The Izanami has ended."
					src.izanamiactive=0













//impliment
/*mob/UchihaG/verb/FalsePersonGenjutsu()
	set name = "False Person Genjutsu"
	set category="Attacks"
	set desc = "Create an image of any person online right now."
	var/varPeople = list()              // make a new var for the player list
	for(var/mob/T in world) // for each player in the world..
		if(T.client)
			varPeople += T
	var/A = input(usr,"Who do you want the fake person to look like?",) in varPeople
	var/C = input(usr,"Any specific icon state? ie: dead, running, handseals. If not just leave this blank.") as text
	if(usr.SharinganMastery<1000)
		var/mob/npcs/Bunshin/B = new()
		B.x=usr.x-1;B.y=usr.y;B.z=usr.z;B.ImmuneToDeath=1
	else
		var/mob/npcs/KBunshin/B = new()
		B.x=usr.x-1;B.y=usr.y;B.z=usr.z;B.ImmuneToDeath=1;B.AttackDelay=1
		B.name=A:name;B.icon=A:icon;B.overlays=A:overlays;B.icon_state=C;B.RunningSpeed=usr.RunningSpeed;B.Acceleration=usr.Acceleration;B.Owner=src;B.Running=1
*/







///////////////////////////////////////////////////////
///////////////////////-----------Susanoo code------//////////////////
////////////////////////////////////////////////
mob
	var
		tmp/susanoo=0

mob
	npc
		susanoo
			icon='Susanoootherfullmini.dmi'
			icon_state=""
			health=3000
			New()
				..()
				spawn(6000)
					if(src)
						view(src)<<"The Susanoo Fades..."
						del src
				spawn(15)
					var/mob/O = src.owner
					while(O&&src&&O.susanoo>=1&&O.ko<1&&src.health>=1&&O.mshar)//O&&src&&O.susanoo>=1&&O.ko==0&&src.health>=1&&src.mshar>=1)
						if(O.hasems>=1)

						else
							O.blindness+=(0.04*O.susanoo)
						src.loc=O.loc
						src.dir=O.dir
						if(O.susanoo>=2)
							O.run=0
						sleep(1)
					if(O)
						O<<"Susanoo Ends."
						O.susanoo=0
					del src
			Del()
				..()
				var/mob/O = src.owner
				if(O)
					//O<<"Susanoo Ends."
					O.susanoo=0
					//del src
obj
	skill
		susanoo
			verb
				susano()
					set category = "Doujutsu"
					set name = "Susano'o"
					if(usr.mshar==0)
						usr<<"You need to activate the mangekyou sharingan first."
						return
					if(src.cooldown)
						usr<<"You must wait [src.cooldown] seconds before you can use this again."
						return
					if(usr.handseal(75,0))
						src.cooldown=30
						spawn(1)
							while(src.cooldown)
								if(src)
									src.cooldown-=1
								sleep(10)
						if(usr.susanoo==0)
							usr.susanoo=1
							var/mob/npc/susanoo/K=new()
							if(K)
								K.name="Susano'o";K.density=0;K.owner=usr;K.loc=locate(usr.x,usr.y,usr.z)
							usr.susanoo=1
							usr.Frozen=1
							spawn(10)
								usr.Frozen=0
							//K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)
							usr<<"Susano'o forces you to walk."
							usr<<"Hold D then Press Z to advance your susano'o into higher stages."
							usr.icon_state=""
							if(usr.mswho=="Sasuke")
								K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)*1.06
								K.icon='sasukesusanooribs.dmi'
								K.pixel_x -= 32
								K.pixel_y -= 32
							if(usr.mswho=="Itachi")
								K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)*1.3
								K.icon='itachisusanooribs.dmi'
								K.pixel_x -= 32
								K.pixel_y -= 32
							if(usr.mswho=="Madara")
								K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)*2.5
								K.icon='madarasusanooribs.dmi'
								K.pixel_x -= 32
								K.pixel_y -= 32
							if(usr.mswho=="Shisui")
								K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)*0.67
								K.icon='shisuisusanooribs.dmi'
								K.pixel_x -= 32
								K.pixel_y -= 32
							if(usr.mswho=="Other")
								K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)
								K.icon='susanoootherribs.dmi'
								K.pixel_x -= 32
								K.pixel_y -= 32
						else
							usr.susanoo=0
							//use block and somethign else to achive higher stage in susanoo

obj
	blind
		layer=9001
		icon='Effects.dmi'
		screen_loc="SOUTHWEST to NORTHEAST"
		stage1
			icon_state="blind1"



mob
	var
		blindness=0
		eyelimit=30
		eyelimitmulti=1
	proc
		blinding()
			//world<<"Blinding proc called."
			if(src.blindness>=src.eyelimit*src.eyelimitmulti)
				var/blindtype="0"
				if(src.blindness>=src.eyelimit*src.eyelimitmulti)
					blindtype="1"
				if(src.blindness>=((src.eyelimit*src.eyelimitmulti)*2))
					blindtype="2"
				if(src.blindness>=((src.eyelimit*src.eyelimitmulti)*3))
					blindtype="3"
				if(src.blindness>=((src.eyelimit*src.eyelimitmulti)*4))
					blindtype="4"
				if(src.blindness>=((src.eyelimit*src.eyelimitmulti)*5))
					blindtype="5"
				if(src.blindness>=((src.eyelimit*src.eyelimitmulti)*6))
					blindtype="6"
				if(src.blindness>=((src.eyelimit*src.eyelimitmulti)*7))
					blindtype="7"
				for(var/obj/HUD/H in src.client.screen)
					if(istype(H,/obj/HUD/blind))
						H.icon_state="[blindtype]"
						//world<<"[H] has been changed to state [blindtype]"
					sleep(1)
			else
				for(var/obj/HUD/H in src.client.screen)
					if(istype(H,/obj/HUD/blind))
						H.icon_state="0"
						//world<<"[H] has been changed to state 0"










////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////////////////////
obj/HUD
	blind
		layer=9001
		icon='blinding.dmi'
		icon_state="0"
		screen_loc="SOUTHWEST to NORTHEAST"//extends from the very bottom left corner of your screen, to the top right
	//FadeOut
		//layer=9001
		//icon='FadeOut.dmi'
		//screen_loc="SOUTHWEST to NORTHEAST"

/*mob/proc/UnFadeScreen() // This will be used to do a Fade-Out
	var/obj/HUD/FadeOut/f = new //creates HUD
	if(client)
		if(
	.=..()*/

mob/proc/FadeScreen() //This is used for a Fade-In
	//var/obj/HUD/blind/f = new //creates HUD
	if(client)
		src.client.screen+=new/obj/HUD/blind
		//src.client.screen+=f // adds hud to screen // removes hud from screen
//	.=..()







///////////////////////////////////////////////////////
/////////////////////////////////////////////////--------------Amaterasu
//////////////////////////////////////////////////
/*
mob/uchiha
	verb
		Amateratsu2()
			set category = "Doujutsu"
			set name = "Amateratsu Spread"
			set desc = "Spreading Amateratsu"
			if(usingama||resting||cooldown||froze)
				usr<<"Not now."
				return
			usr.usingama = 1
			//usr.inamause = 1
			usr.blindnessing += 18
			//if(!demon)
			//	icon_state="rest"
			view(usr) <<"<font size=1><font face=verdana><b><font color=white>[usr]<font color=green> Says: Amateratsu!"
				//sleep(50)
				//view()<<"<b><font color=red>[src]: Demon Soul Tranfer!"
				//demon=1
			var/T1=new/obj/jutsu/amaterasu(loc)
			T1:owner=src
			var/T6=new/obj/jutsu/amaterasu(locate(x-2,y+3,z))
			T6:owner=src
			var/T2=new/obj/jutsu/amaterasu(locate(x-2,y+3,z))
			T2:owner=src
			var/T3=new/obj/jutsu/amaterasu(locate(x,y+2,z))
			T3:owner=src
			var/T4=new/obj/jutsu/amaterasu(locate(x+2,y-3,z))
			T4:owner=src
			var/T5=new/obj/jutsu/amaterasu(locate(x,y-3,z))
			T5:owner=src
				//icon='trojform.dmi'
			//	overlays=null
			//else
			//	demon=0
			//	if(icon_name=="base")icon='base.dmi'
			//	if(icon_name=="basetan")icon='basetan.dmi'
			//	if(icon_name=="baseblack")icon='baseblack.dmi'
			//	if(icon_name=="basepale")icon='basepale.dmi'
			//	overlay()
			sleep(300)
			usr.usingama = 0
			usr.inamause = 0

*/

obj/jutsu/blackfire
	icon='Effects.dmi'
	icon_state="amat"
	layer=50
	New()
		..()
		icon_state=pick("1","2")
		new/obj/jutsu/bfire2(loc)
		if(prob(40))new/obj/jutsu/bfire2(loc)
		if(prob(40))
			new/obj/jutsu/bfire2(loc)
			new/obj/jutsu/bfire2(loc)
		spawn(rand(40,120))del src
obj/jutsu/blackfdmg
	New()
		spawn(rand(40,120))
			del src
		spawn(3)
			var/mob/O = src.owner
			while(src)
				//if(!owner)del src
				for(var/mob/M in view(0,src))
					if(M==src.owner)

					else
						M.nindamage(src.power,0,O)
				sleep(rand(5,12))
//mob/verb/amaterasujutsu()
	//var/T1=new/obj/amaterasu(loc)
	//T1:owner=src


obj/jutsu/bfire2
	icon='Effects.dmi'
	icon_state="amat"
	layer=15
	//proc/firedie()
		//spawn(rand(0,5))del src
	New()
		pixel_y=rand(-16,16)
		pixel_x=rand(-16,16)
		//icon_state=pick("1","2")
		..()
		spawn(rand(100,250))
			del src
		spawn(3)
			var/mob/O = src.owner
			while(src)
				//if(!owner)del src
				for(var/mob/M in view(0,src))
					if(M==src.owner)

					else
						M.nindamage(src.power,0,O)
				sleep(rand(3,7))
obj/jutsu/bfire1
	icon='Effects.dmi'
	icon_state="amat"
	layer=15
	//proc/firedie()
		//spawn(rand(0,5))del src
	New()
		pixel_y=rand(-28,28)
		pixel_x=rand(-28,28)
		//icon_state=pick("1","2")
		..()
		spawn(rand(100,250))
			del src






obj/jutsu/bfire3
	icon='KatonTechniques.dmi'
	icon_state="WhiteAmatFire"
	layer=16
	//proc/firedie()
		//spawn(rand(0,5))del src
	New()
		pixel_y=rand(-16,16)
		pixel_x=rand(-16,16)
		//icon_state=pick("1","2")
		..()
		spawn(rand(100,250))
			del src
		spawn(3)
			var/mob/O = src.owner
			while(src)
				//if(!owner)del src
				for(var/mob/M in view(0,src))
					if(M==src.owner)

					else
						M.nindamage(src.power,0,O)
				sleep(rand(3,7))
obj/jutsu/bfire4
	icon='KatonTechniques.dmi'
	icon_state="WhiteAmatFire"
	layer=16
	//proc/firedie()
		//spawn(rand(0,5))del src
	New()
		pixel_y=rand(-16,16)
		pixel_x=rand(-16,16)
		//icon_state=pick("1","2")
		..()
		spawn(rand(100,250))
			del src












obj/jutsu/amaterasu
	New()
		..()
		spawn(250)
			del src
		spawn(3)
			var/mob/O = src.owner
			//tryagain
			if(O.target)
				while(src)
					step_towards(src,O.target,16)
					sleep(rand(3,5))
			else
				sleep(30)
				spawn(1)
					walk(src,src.dir,4)
	Move()
		//src.laststep=src.loc
		..()
		//var/obj/jutsu/bfire2/U=new()
		var/obj/jutsu/bfire2/V4=new()
		//V4.owner=owner
		V4.loc=src.loc
		V4.power=src.power*0.60
		V4.owner=src.owner
		if(prob(75))
			var/obj/jutsu/bfire2/U=new()
			U.loc=src.loc
			U.power=src.power*0.30
			U.owner=src.owner
		var/obj/jutsu/bfire1/V5=new()
		V5.loc=src.loc



obj/jutsu/amaterasu2
	New()
		..()
		spawn(250)
			del src
		spawn(3)
			//var/mob/O = src.owner
			var/list/H=list()
			for(var/turf/T in getcircle(src,6))
				if(T.density==0)
					H.Add(T)
				//src.loc=pick(H)
			while(src)
				var/obj/jutsu/bfire2/V4=new()
				V4.loc=pick(H)
				V4.power=src.power*0.60
				V4.owner=src.owner
				if(prob(30))
					var/obj/jutsu/bfire2/V8=new()
					V8.loc=pick(H)
					V8.power=src.power*0.55
					V8.owner=src.owner
				if(prob(15))
					var/obj/jutsu/bfire2/V10=new()
					V10.loc=pick(H)
					V10.power=src.power*0.65
					V10.owner=src.owner
				sleep(rand(1,5))

	Move()
		//src.laststep=src.loc
		..()
		//var/obj/jutsu/bfire2/U=new()
		var/obj/jutsu/bfire2/V4=new()
		//V4.owner=owner
		V4.loc=src.loc
		V4.power=src.power*0.60
		V4.owner=src.owner
		if(prob(75))
			var/obj/jutsu/bfire2/U=new()
			U.loc=src.loc
			U.power=src.power*0.30
			U.owner=src.owner
		var/obj/jutsu/bfire1/V5=new()
		V5.loc=src.loc



obj/jutsu/amaterasu3
	New()
		..()
		spawn(300)
			del src
		spawn(3)
			var/mob/O = src.owner
			//tryagain
			if(O.target)
				while(src)
					step_towards(src,O.target,16)
					sleep(rand(3,5))
			else
				sleep(30)
				spawn(1)
					walk(src,src.dir,4)
	Move()
		//src.laststep=src.loc
		..()
		//var/obj/jutsu/bfire2/U=new()
		var/obj/jutsu/bfire3/V4=new()
		//V4.owner=owner
		V4.loc=src.loc
		V4.power=src.power*0.60
		V4.owner=src.owner
		if(prob(75))
			var/obj/jutsu/bfire3/U=new()
			U.loc=src.loc
			U.power=src.power*0.30
			U.owner=src.owner
			if(prob(45))
				spawn(rand(1,2))
					var/obj/jutsu/bfire3/U1=new()
					U1.loc=src.loc
					U1.power=src.power*0.15
					U1.owner=src.owner
				if(prob(22.5))
					spawn(rand(1,2))
						var/obj/jutsu/bfire3/U2=new()
						U2.loc=src.loc
						U2.power=src.power*0.08
						U2.owner=src.owner
		var/obj/jutsu/bfire4/V5=new()
		V5.loc=src.loc
		var/obj/jutsu/bfire4/V6=new()
		V6.loc=src.loc



















