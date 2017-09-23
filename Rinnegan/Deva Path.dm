

//think about making push and pull for singular targets too



obj
	skill
		push//this is the line the must only contain one verb after it untill the next jutsu
			verb
				push()
					set category = "Skills"
					set name = "Shinra Tensei"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(200,0))
						view()<<"[usr]: Shinra Tensei!"
						usr.Frozen=1
						spawn(1)
							if(src.level<1)
								src.mastery+=2
								if(prob(10))
									usr<<"Your getting better with gravity."
								if(src.mastery>=100)
									src.level+=1
									src.mastery-=100
									if(src.level==1)
										usr<<"You learned to alter gravity on a larger scale."
										var/obj/skill/push2/A=new()
										A.loc=usr
						spawn(18)
							usr.Frozen=0
						for(var/obj/jutsu/J in oview(3))
							spawn(1)
								if(J.owner==usr)

								else
									while(get_dist(usr,J)<5)
										step_away(J,usr,5,31)
										sleep(1)
						for(var/mob/M in oview(3))
							spawn()
								if(M.ko==0)
									M.dir=get_dir(M,src)
									flick("hit",M)
								M.stepback(6)
								M.nindamage(usr.nin*0.50,0,usr)
								//M.icon_state=""
						//var/obj/smoke/B=new()
						//B.loc=locate(A.x,A.y,A.z)
						//view(A)<< sound('Smoke.wav',0,0,1)
					else
						usr<<"You failed the jutsu."
				pushtest()
					set category = "Skills"
					set name = "Shinra Tensei 2"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(200,0))
						usr.whatcharges="Shinra Tensei"
						usr<<"Shinra Tensei has been set as your S button Charge Attack."
					else
						usr<<"You failed the jutsu."
			verb
				pull()
					set category = "Skills"
					set name = "Bansho Tenin"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(200,0))
						view()<<"[usr]: Bansho Tenin!"
						usr.Frozen=1
						spawn(15)
							usr.Frozen=0
						for(var/mob/M in oview(6))
							spawn()
								if(M.ko==0)
									M.dir=get_dir(M,src)
									M.icon_state="jump"
								var/banshotimer=10
								while(get_dist(usr,M)>1&&M&&banshotimer>1)
									step_towards(M,usr,32)
									banshotimer-=1
									sleep(1)
								//M.stepback(20)
								spawn(5)
									M.icon_state=""
						//var/obj/smoke/B=new()
						//B.loc=locate(A.x,A.y,A.z)
						//view(A)<< sound('Smoke.wav',0,0,1)
					else
						usr<<"You failed the jutsu."
		push2//this is the line the must only contain one verb after it untill the next jutsu
			verb
				push()
					set category = "Skills"
					set name = "Shinra Tensei(Almightly)"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+1800
					if(usr.handseal(2000,0))
						view()<<"[usr]: Shinra..."
						usr.Frozen=1
						sleep(20)
						flick("Power",usr)
						view()<<"[usr]: Tensei!"
						spawn(25)
							usr.Frozen=0
						for(var/obj/jutsu/J in oview(6))
							spawn(1)
								if(J.owner==usr)
									return
								else
									while(get_dist(usr,J)<10)
										step_away(J,usr,10,31)
										sleep(1)
						for(var/mob/M in oview(10))
							spawn()
								if(M.ko==0)
									M.dir=get_dir(M,src)
									flick("hit",M)
								M.stepback(25)
								M.nindamage(usr.nin*8,0,usr)
								//M.icon_state=""
						//var/obj/smoke/B=new()
						//B.loc=locate(A.x,A.y,A.z)
						//view(A)<< sound('Smoke.wav',0,0,1)
					else
						usr<<"You failed the jutsu."
		push3//this is the line the must only contain one verb after it untill the next jutsu
			verb
				chikabu()
					set category = "Skills"
					set name = "Chibaku Tensai"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+3000
					if(usr.handseal(200,0))
						src.cooldown=300//make this 120
						usr.Frozen=1
						sleep(20)
						flick("Power",usr)
						view()<<"[usr]: Chibaku Tensei!"
						spawn(25)
							usr.Frozen=0
						var/obj/jutsu2/chibaku/A=new()
						//A.power=((usr.nin*0.20)*src.level)
						A.owner=usr;A.loc=usr.loc
						A.dir=usr.dir
						walk(A,A.dir)
					else
						usr<<"You failed the jutsu."







obj
	jutsu2
		chibaku
			icon = 'Effects.dmi'
			icon_state="kamui"
			density=0
			movedelay=2
			layer=99999
			New()
				..()
				spawn(30)
					src.Frozen=1
					src.chibakuproc()
				spawn(1200)
					del src
obj
	proc
		chibakuproc()
			spawn(1)
				var/last=600
				while(src&&last>0)
					for(var/mob/M in oview(src))
						spawn(1)
							if(M!=src.owner)
								while(get_dist(M,src)>1)
									step_towards(M,src,32)
									sleep(rand(1,3))
					if(prob(10))
						for(var/obj/jutsu/H in oview(src))
							spawn(1)
								while(get_dist(H,src)>0)
									step_towards(H,src,32)
									sleep(rand(2,4))
								if(H.loc==src.loc)
									src.power+=H.power
									del H
					last-=1
					sleep(2)







