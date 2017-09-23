mob
	var
		tmp/inmindtransfer=0
		tmp/mindcaught=0
		tmp/mindcontroller=null
		mindrange=2
		mindtime=30
		mindmastery=0//can go to 100, used to learn mind techniques





mob
	teacher
		Yamanakateacher
			//human = 1
			density=1
			//NPC = 1
			name="Suilo Yamanaka"
			icon='Guy.dmi'
			clan="Yamanaka"
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				.=..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='PainbodyH.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(250,0,140)
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
					src.overlays+='headband.dmi'
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr.clan==src.clan)
					if(usr.mindmastery>=0)
						cl+="Mind Transfer"
					if(usr.mindmastery>=1&&"Mind Transfer" in usr.jutsus)
						if(usr.mindmastery>=15&&usr.CC>=40)
							cl+="Mind Destruction"
						if(usr.mindmastery>=45)
							cl+="Mind clone Transfer"
						if(usr.mindmastery>=50&&"Mind Destruction" in usr.jutsus)
							cl+="Mind Tag Sealing"
						if(usr.mindmastery>=75&&"Mind Tag Sealing" in usr.jutsus)
							cl+="Mind Swap Puppet"
				oview(src)<<"[src] Says: I bet your thinking you want to learn something new."
				sleep(3)
				if(usr.clan==src.clan)
					oview(src)<<"[src] Says: Ah, it's true then? A fellow Yamanaka?"
					var/T = input("What to learn?","[src]") in list("Nothing") + cl
					if(T=="Nothing")
						return
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
						return
					if(T=="Mind Transfer")
						usr.contents += new /obj/skill/mindtrans
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else if(T=="Man Beast Claws")
						usr.contents += new /obj/skill/beastclaws
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
					else if(T=="Tsuuga")
						usr.contents += new /obj/skill/tsuuga
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else
						oview(src)<<"[src] Says: I'm not suppose to teach that move, sorry."
































mob
	mindtransfer
		layer=TURF_LAYER+1
		density=1
		health=999999
		New()
			..()
			spawn(3000)
				if(src)
					del src
		Bump(A)
			if(ismob(A))
				//M.nin=0
				var/mob/M = A
				var/mob/O=src.owner
				spawn(1)
					var/tempo=10
					while(tempo>1)
						if(M)
							src.loc=M
						tempo-=1
						sleep(5)
				src.nin=0
				src.inmindtransfer=1
				O<<"You caught [M] with your mind transfer."
				if(M.mindcaught==0)
					src.loc=M
					while(src&&O&&src.loc==M)
						if(O)
							M.mindcontroller=O
							O.icon_state="dead"
						M.mindcaught=1
						sleep(7)
					M<<"You're free from the jutsu."
					O<<"The Jutsu Ended."
					M.mindcontroller=null
					M.mindcaught=0
					O.client.perspective = MOB_PERSPECTIVE
					O.client.eye=O
					if(!O)
						del src
				else
					src.loc=M
					src.nin=0
					O<<"[M]'s mind is already being controlled, all you can manage to do is watch."
			if(isobj(A))
				src.density=0
				sleep(1)
				src.density=1
		Del()
			//var/mob/U = src.owner
			for(var/mob/T in world)
				if(src.owner==T)
					if(T.client)
						T.client.perspective = MOB_PERSPECTIVE
						T.client.eye=T
					T.inmindtransfer=0
			src.loc=null
			sleep(10)
			..()



obj
	skill
		mindtrans
			verb
				Mshot()
					set category = "Skills"
					set name = "Mind Transfer"
					if(src.cooldown)
						usr<<"You must wait [src.cooldown] seconds before you can use this again."
						return
					if(usr.handseal(usr.Mchakra*0.10,2))
						src.cooldown=20
						spawn(1)
							while(src.cooldown)
								if(src)
									src.cooldown-=1
								sleep(10)
						var/i=src.level
						if(i<1)
							i=1
						if(i>2)
							i=2
						spawn(1)
							if(usr.mindmastery<100)
								if(prob(65))
									usr.mindmastery+=1
						src.levelgain(2,src.level)
						var/mob/mindtransfer/A=new()
						usr.inmindtransfer=1
						usr.client.perspective = EYE_PERSPECTIVE
						usr.client.eye=A
						A.nin=2+(src.level*2) // maybe make it so if they have higher stats or somethign they ca shake it off faster
						A.owner=usr;A.loc=usr.loc
						A.dir=usr.dir//;walk(A,A.dir)
						//var/range=5+src.level
						var/time=300*src.level
						if(time<300)
							time=300
						if(time>1200)
							time=1200
						spawn(time)
							usr.icon_state=""
							usr.client.eye=usr
							usr.client.perspective = MOB_PERSPECTIVE
							//usr<<"The Mind transfer ended."
							del A
						spawn(1)
							while(A)
								usr.client.eye=A
								sleep(3)
								usr.client.eye=usr
						while(A.nin>=1)
							step(A,A.dir)
							A.nin-=1
							sleep(3)
						spawn(10)
							if(A.inmindtransfer==0)
								A.density=0
								usr<<"Your mind didn't hit a target and is now lost in the world, you must now wait for it to return."
								sleep(rand(150,300))
								del A
