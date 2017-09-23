
mob
	proc
		mokuincrease(number)//all element mixes harder to get knowledge for
			if(src.mokutonknowledge<5001)
				if(prob(30))
					if(prob(12))
						src.mokutonknowledge+=rand(1,number)
					else
						src.mokutonknowledge+=pick(0.1,0.2,0.1)





mob
	teacher
		Senjuteacher
			//human = 1
			density=1
			//NPC = 1
			name="Hirashi Senju"
			icon='Guy.dmi'
			clan="Senju"
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				.=..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='SpikeyH.dmi'
					var/UchihaShirt='SasukeShirt.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(0,0,50)
					UchihaShirt-=rgb(0,0,200)
					src.icon=Base
					src.overlays+='Boxers.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+=UchihaShirt
					src.overlays+='pants.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+=Hair
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr.clan==src.clan&&usr.mokutonknowledge>0)
					if(usr.mokutonknowledge>=1)
						cl+="Razor Leaves"
					if(usr.mokutonknowledge>=30&&usr.CC>=40&&"Razor Leaves" in usr.jutsus)
						cl+="Vine Wip"
					if(usr.mokutonknowledge>=50&&usr.attackdelay<3.8&&"Vine Wip" in usr.jutsus)
						cl+="Vine Grip"
					if(usr.mokutonknowledge>=100&&"Vine Wip" in usr.jutsus&&"Vine Grip" in usr.jutsus)
						cl+="Vine Forest"
					if(usr.mokutonknowledge>=150)
						cl+="Wood Shield"
					if(usr.mokutonknowledge>=200)
						cl+="Wood Spikes"
					if(usr.mokutonknowledge>=350&&"Wood Shield" in usr.jutsus)
						cl+="Wood Forest"
					if(usr.mokutonknowledge>=500&&"Wood Forest" in usr.jutsus)
						cl+="Wood Forest Bloom"
				oview(src)<<"[src] Says: The beginning of our beautiful clan was started by a man with a wonderful ambition!"
				sleep(3)
				if(usr.clan==src.clan)
					oview(src)<<"[src] Says: Oh, you're of the [src.clan] Clan? Have you gained control over Wood?"
					var/T = input("What to learn?","[src]") in list("Nothing") + cl
					if(T=="Nothing")
						return
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
						return
					if(T=="Razor Leaves")
						usr.contents += new /obj/skill/senju1
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else if(T=="Vine Wip")
						usr.contents += new /obj/skill/senju2
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
					else if(T=="Vine Grip")
						usr.contents += new /obj/skill/senju3
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else if(T=="Vine Forest")
						usr.contents += new /obj/skill/senju4
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else if(T=="Wood Shield")
						usr.contents += new /obj/skill/senju5
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else if(T=="Wood Spikes")
						usr.contents += new /obj/skill/senju6
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else if(T=="Wood Forest")
						usr.contents += new /obj/skill/senju7
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
					else
						oview(src)<<"[src] Says: Hmmm.... i've recived word not to teach anyone that for the time being."













obj
	jutsu
		razorleaf
			icon='Icons/Jutsus/KusakinTechniques.dmi'
			density=1
			layer=MOB_LAYER+1
			//Move_Delay=0
			New()
				..()
				spawn(45)
					del(src)
			Bump(A)
				..()
				if(ismob(A))
					var/mob/M = A
					var/mob/O = src.owner
					var/damage=round(rand(M.Mhealth*0.01,M.Mhealth*0.15));M.nindamage(damage*0.90,O);M.taidamage(damage*0.10,O);view(M)<<"[M] was hit by the leaves!([damage])"
					spawn() viewers()<<sound('Slice.wav',0);M.Blood()
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/))
					var/obj/O=A
					if(findtext(O.icon_state,"RazorLeaf",1,0)==1)
						src.loc=O.loc
						return
					else
						del(src)
			RazorLeaf1 icon_state="RazorLeaf1"
			RazorLeaf2 icon_state="RazorLeaf2"
			RazorLeaf3 icon_state="RazorLeaf3"
			RazorLeaf4 icon_state="RazorLeaf4"
		KusakinW2
			icon='Icons/Jutsus/KusakinTechniques.dmi'
			icon_state = "WhipHead"
			density=1
			//Move_Delay=1
			New()
				..()
				spawn(50)
				del(src)
			Move()
				var/prevloc=src.loc
				..()
				var/prevdir=src.dir
				var/obj/jutsu/WhipTrail/A=new(prevloc)
				A.icon_state="Whip";A.dir=prevdir;A.owner=src.owner
				..()
			Bump(A)
				..()
				if(ismob(A))
					var/mob/M = A
					var/mob/O=src.owner
					var/damage=round((O.nin+O.tai)*pick(0.5,1,0.6,0.4,0.45,0.55,0.5))
					M.nindamage(damage*0.75,1,O);M.taidamage(damage*0.23,0,O);view(M)<<"[M] was whipped!([damage])"
					if(prob(50)) M.stepback2(1,src.dir)
					spawn() M.Blood()
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/))
					del(src)
			Del()
				for(var/obj/jutsu/WhipTrail/A in world)
					if(A.owner==src.owner)
						del(A)
				..()
		WhipTrail
			icon='Icons/Jutsus/KusakinTechniques.dmi'
			density=0
		KusaHand
			icon='Icons/Jutsus/KusakinTechniques.dmi'
			density=1
			icon_state = ""
			layer = 5
			var/tmp/CapturePerson
			New()
				..()
				spawn()
					for(var/mob/M in src.loc)
						M<<"You've been binded by the Leaves!"
						src.CapturePerson=M
						M.bind+=1
						break
					while(src)
						sleep(2)
						if(src.icon_state=="VineGuard")
							for(var/mob/M in src.loc)
								var/mob/O=src.owner
								if(M==O)
									return
								if(O.guard)
									O<<"You tighten the grip on [M]!"
									M<<"The grip tightens on you!"
									M.nindamage(O.nin*0.12,0,O)
						sleep(10)
				spawn(120)
					del(src)
			Del()
				var/mob/M=src.CapturePerson
				//var/mob/O=src.owner
				if(M)
					M<<"You've been freed!"
					if(M.bind>0)
						M.bind-=1
					//M.Death(O)
				sleep(2)
				..()
		VineForest
			icon='Icons/Jutsus/KusakinTechniques.dmi'
			icon_state = "VineForest"
			density=0
			layer = 5
			New()
				..()
				spawn()
					while(src)
						for(var/mob/M in src.loc)
							var/mob/O=src.owner
							if(M==O)
								return
							if(prob(75))
								M.nindamage(M.Mhealth*0.03,1,O)
								M.taidamage(M.Mhealth*0.003,0,O)
							M.stun+=3
						sleep(50)
				spawn(600)
					del(src)
		WoodSpikes1
			icon='Mokuton.dmi'
			icon_state="1stay"
			density=1
			layer=MOB_LAYER+1
			New()
				.=..()
				spawn()
					flick("1",src)
					for(var/mob/M in src.loc)
						var/mob/O=src.owner
						var/damage=M.Mhealth*0.03
						M.nindamage(damage,3,O)
						view(src)<<sound('Slice.wav',0,0,1)
				spawn(300)
					flick("1del",src);del(src)
		WoodSpikes2
			icon='Mokuton.dmi'
			icon_state="3"
			density=1
			layer=MOB_LAYER+1
			New()
				spawn(4)
					del(src)
mob
	npc
		WoodBarrier
			icon='Mokuton.dmi'
			icon_state="cmid"
			density=1
			health=1000
			delonko=1
			layer=MOB_LAYER+1
			New()
				.=..()
				spawn()
					flick("mid",src);sleep(1)
					spawn(1)
						while(src)
							src.icon_state="cmid"
							sleep(30)
				spawn(300)
					if(src)
						flick("emid",src);del(src)
		JukaiKoutan
			icon='Mokuton.dmi'
			name="Woodland"
			density = 1
			health=100
			delonko=1
			layer = MOB_LAYER+1
			pixel_step_size=32
			New()
				.=..()
				spawn()
					if(prob(50))
						src.icon_state="EntangleBottom2";var/obj/jutsu/A=new();A.layer=src.layer;A.icon=src.icon;A.icon_state="EntangleTop2";A.pixel_y+=32;A.animate_movement=SYNC_STEPS;src.overlays+=A
					else
						src.icon_state="EntangleBottom";var/obj/jutsu/A=new();A.layer=src.layer;A.icon=src.icon;A.icon_state="EntangleTop";A.pixel_y+=32;A.animate_movement=SYNC_STEPS;src.overlays+=A
					spawn(rand(450,600))
						if(src)
							del(src)
					spawn(1)
						//var/conect=list()
						var/mob/other=null
						for(var/mob/npc/JukaiKoutan/M in view(src))
							if(src.owner==M.owner&&M!=src)
								other=M
								break
						if(other==null)
							return
						for(var/turf/Y in getline(src,other))
							if(src)
								var/mob/npc/JukaiKoutan2/A=new()
								A.health+=src.health*1.8657
								A.loc=Y;A.owner=src.owner
								A.Frozen=1
							sleep(1)
						//usr.chakra-=100

		JukaiKoutan2
			name="Woodland"
			icon='Mokuton.dmi'
			icon_state="Entangle"
			health=500
			delonko=1
			density=1
			opacity=1
			New()
				..()
				spawn(rand(1700,1800))
					if(src)
						del src

mob
	var
		delonko=0
		tmp/woodmode=0













obj
	skill
		senju1
			verb
				senjuL()
					set category = "Skills"
					set name = "Ravor Leaves"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal(90,2))
						spawn(1)
							usr.mokuincrease(1)
						var/obj/jutsu/razorleaf/RazorLeaf1/A=new();A.owner=usr;A.dir=usr.dir;A.loc=usr.loc;walk(A,A.dir)
						sleep(1);var/obj/jutsu/razorleaf/RazorLeaf2/B=new();B.owner=usr;B.dir=usr.dir;B.loc=usr.loc
						spawn(3)
							if(B)
								B.dir=turn(B.dir,-45);walk(B,B.dir)
						sleep(1);var/obj/jutsu/razorleaf/RazorLeaf3/C=new();C.owner=usr;C.dir=usr.dir;C.loc=usr.loc
						spawn(3)
							if(C)
								C.dir=turn(C.dir,-45);walk(C,C.dir)
						sleep(1);var/obj/jutsu/razorleaf/RazorLeaf4/D=new();D.owner=usr;D.dir=usr.dir;D.loc=usr.loc;walk(D,D.dir)
		senju2
			verb
				senjuV()
					set category = "Skills"
					set name = "Vine Wip"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(200,1))
						spawn(1)
							usr.mokuincrease(2.5)
						var/number=3
						usr.Frozen=1
						while(number>0)
							var/obj/jutsu/KusakinW2/B=new();B.owner=usr;B.loc=locate(usr.x,usr.y,usr.z);B.dir=usr.dir
							if(usr.target)
								var/mob/M = usr.target
								walk_towards(B,M)
							else
								walk(B,B.dir)
							number-=1
							sleep(3)
						usr.Frozen=0
		senju3
			verb
				senjuG()
					set category = "Skills"
					set name = "Vine-Grip"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+600
					if(usr.handseal(300,5))
						spawn(1)
							usr.mokuincrease(1.5)
						if(usr.target&&usr.target in view(usr))
							var/mob/M = usr.target
							usr<<"The vines form around [M]! Hold D to damage [M] while they are captured!";var/obj/jutsu/KusaHand/A=new();A.icon_state="VineStarting";A.loc=M.loc;A.owner=usr;sleep(6);A.icon_state="VineGuard"
		senju4
			verb
				senjuL()
					set category = "Skills"
					set name = "Green Forest"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+1200
					if(usr.handseal(1000,7))
						spawn(1)
							usr.mokuincrease(2)
						for(var/turf/T in getcircle(usr,10))
							if(!T.density)
								var/obj/jutsu/VineForest/A=new();A.owner=usr;A.loc=T
		senju5
			verb
				senjuL()
					set category = "Skills"
					set name = "Wood Shield"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+450
					if(usr.handseal(300,3))
						spawn(1)
							usr.mokuincrease(1)
						var/mob/npc/WoodBarrier/A=new/mob/npc/WoodBarrier(usr.loc)
						A.health+=(usr.suitonknowledge+usr.dotonknowledge)*10;A.owner=usr
						A.dir=usr.dir
						sleep(1)
						step(A,usr.dir)
						A.Frozen=1
						sleep(1)
						spawn(5) usr.icon_state=""
		senju6
			verb
				senjuL()
					set category = "Skills"
					set name = "Wood-Spikes"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+400
					if(usr.handseal(450,2))
						spawn(1)
							usr.mokuincrease(2)
						usr.icon_state="beastman";usr.Frozen=1
						spawn(9)
							usr.icon_state="";usr.Frozen=0
						var/a=10
						var/prevloc=get_step(usr,usr.dir)
						while(a>0)
							var/b=rand(3,5)
							while(b>0)
								sleep(1)
								var/obj/jutsu/WoodSpikes1/O=new /obj/jutsu/WoodSpikes1/;var/obj/jutsu/WoodSpikes2/O2=new /obj/jutsu/WoodSpikes1/
								O.layer=5;O2.layer=5;O2.icon_state="3";O.loc=prevloc;O2.loc=prevloc;var/c=round(32/b);O.pixel_x=c
								O.owner=usr;O2.owner=usr
								if(usr.dir==WEST)
									O.pixel_x=(c*-1)
								O2.pixel_x=O.pixel_x;var/d=((11-a)*(6-b))+(10-(2*a));O.pixel_y=rand(-1*d,d);O2.pixel_y=O.pixel_y;b--
									//sleep(0.001)
							prevloc=get_step(prevloc,usr.dir);a--
		senju7
			verb
				senjuL()
					set category = "Skills"
					set name = "Forest-Emergance"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+450
					if(usr.handseal(10,10))
						usr.woodmode=1
						usr<<"You enter Mokuton creation mode, double click anywhere to create wood."
						sleep(rand(250,300))
						usr.woodmode=0
						usr<<"You exit Mokuton mode."
		/*senju8
			verb
				senjuL()
					set category = "Skills"
					set name = "Nature-Connection"
					if(src.cooldown)
						usr<<"You must wait [src.cooldown] seconds before you can use this again."
						return
					if(usr.handseal(1,0))
						src.cooldown=1//20
						spawn(1)
							while(src.cooldown)
								if(src)
									src.cooldown-=1
								sleep(10)
						for(var/mob/npc/JukaiKoutan/M in world)//getline(usr,M))
							var/mob/npc/JukaiKoutan/A=new()
							A.health+=(usr.suitonknowledge+usr.dotonknowledge)*1.5
							A.loc=src;A.owner=usr
							A.Frozen=1
							usr.chakra-=100*/

