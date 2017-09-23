mob/test//make this an object later
	verb
		clonesexample()
			set category = "Skills"
			set name = "Clone Jutsu"
			if(usr.handseal(50,3))
				usr<<"success"
				usr.contents += new /obj/skill/clones
				//or if the whole second of clones
				//usr.contents += new /obj/skill/clones
			else
				usr<<"You failed the jutsu."


mob
	verb
		Run_Toggle()
			set category = "Commands"
			set name = "Run Toggle"
			if(src.run)
				src.run=0
				src<<"You stop running."
				//src.icon_state=""
			else
				src.run=1
				src<<"You start running."
				//src.icon_state="running"



mob
	verb
		giveall()
			set category = "Admin"
			set name = "Give All Jutsu"
			//usr.contents += new /obj/skill/rasengan
			//usr.contents += new /obj/skill/rasengan2
			//usr.contents += new /obj/skill/rasengan3
			//usr.contents += new /obj/skill/chidori
			//usr.contents += new /obj/skill/raikiri
			usr.contents += new /obj/skill/sagecharge
			usr.contents += new /obj/skill/sagemode
			if(usr.sagetype=="None")
				usr.sagetype=pick("Slug","Monkey","Dragon","Snake","Dog","Frog","Bird","Wood","Demon")
				var/powermod=rand(11,75)
				var/EU=10+(powermod*0.35)
				powermod=(powermod*0.01)
				EU=(EU*0.01)
				usr.fullsageboost=powermod
				usr.sageenergyuse = EU
				usr<<"You have been given [usr.sagetype] Sage type with a boost of [round(powermod*100)]% and a chakra substitute of [round(EU*100)]%."
			if(usr.key=="Joejoe13")
				usr.contents += new /obj/skill/zetsu1
				usr.contents += new /obj/skill/edotensai
			if(usr.admin)
				usr.contents += new /obj/skill/skintake
			if(usr.clan=="Uchiha")
				if(usr.sharM<5000)
					usr.sharM=5000
					usr.kills+=50
					usr<<"You were given your Mangekyou Sharingan reqz, kill with your sharingan on to get it, its by chance."
			//if(usr.clan=="None")
				/*usr.contents += new /obj/skill/push
				usr.jutsus+="push"
				usr.jutsus+="pull"
				usr.contents += new /obj/skill/push2
				usr.contents += new /obj/skill/push3
				usr.contents += new /obj/skill/absorb
				usr.jutsus+="absorb"
				usr.contents += new /obj/skill/naraka
				usr.contents += new /obj/skill/naraka1
				usr.jutsus+="judgement"
				usr.contents += new /obj/skill/naraka2
				usr.contents += new /obj/skill/naraka3
				usr.contents += new /obj/skill/summon
				usr.contents += new /obj/skill/soulstrike
				usr.contents += new /obj/skill/soulsteal
				usr.contents += new /obj/skill/asura
				usr.jutsus+="missle"
				usr.contents += new /obj/skill/asura2
				usr.jutsus+="missles"*/
				//usr.contents += new /obj/skill/edotensai
			if(usr.clan=="Sand")
				usr.contents += new /obj/skill/sand1
				usr.contents += new /obj/skill/sand2
				usr.contents += new /obj/skill/sand3
			usr.contents += new /obj/skill/demon
			usr.contents += new /obj/skill/deadsoul
			//usr.contents += new /obj/skill/hiddenmist
			//usr.contents += new /obj/skill/katon1
			//usr.contents += new /obj/skill/katon2
			//usr.jutsus+="fireball"
			//usr.contents += new /obj/skill/suiton
			//usr.demon="Kyuubi"
			//var/list/L = usr.summonlist
			//L.Add("Clam")
			usr.summonlist+="Clam"
			usr.summonlist+="Shukaku"
			usr.summonlist+="Kyuubi"
			usr.summonlist+="Dog"
			usr.summonlist+="Giant Dog"
			usr.summonlist+="Slug"
			usr.summonlist+="Frog"
			usr.summonlist+="Snake"
			usr.summonlist+="Bird"
			usr.summonlist+="Lizard"
			usr.summonlist+="Panda"
			usr.summonlist+="Centipede"
			usr.summonlist+="Gedo Statue"//akatsuki npc teach only akatsuki members if thet have no summon unless they are animal path then they can get it regardless of contracts or not
			//usr.tai=10
			//usr.nin=10
			//usr.Mchakra=1000
			//usr.Mhealth=1000
			//usr.chakra=usr.Mchakra
			//usr<<"Given Final"

/*mob/owner
	verb
		giverinne(var/mob/M in world)
			set category = "Admin"
			set name = "Give Rinnegan"
			if(M.rinnegan==0)
				M.rinneactivate()*/
//////////////------------------^^--------------Example 1--------^^----------/////////////////////////
obj
	var
		tmp/cooldown=0
		mastery=3
		level=0
		owner=""








mob
	proc
		cloneAI()
			while(src)
				tryagain
				var/distance = get_dist(src.target,src)
				if(src.target&&distance <=15)
					var/mob/M = src.target
					if(M==src.owner)
						src.target=null
						goto tryagain
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
							step_towards(src,M)
							sleep(1)
							step_towards(src,M)
							sleep(1)
							step_towards(src,M)
							if(prob(85))
								src.Attack()
							else
								src.usejutsu(M)
							sleep(1)
							step_rand(src,0)
							sleep(1)
							step_rand(src,0)
					if(src.random==3)
						if(prob(70))
							src.Attack()
						else
							src.usejutsu(src.target)
						step_rand(src,0)
						sleep(1)
						step_rand(src,0)
						sleep(1)
						step_rand(src,0)
					if(src.random==4)
						if(M)
							//src.target=M
							src.Shushin_Behind(M)
							src.Attack()
							step(src,rand(1.10))
							sleep(1)
							step(src,src.dir)
							sleep(1)
							step(src,src.dir)
							sleep(1)
							src.dir=get_dir(src,M)
							if(prob(67))
								src.Attack()
							else
								src.usejutsu(M)
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
						if(prob(90))
							src.Attack()
						else
							src.usejutsu(src.target)
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
							if(prob(3))
								src.Shushin_Behind(M)
							//src.target=M
							if(get_dist(src,M)<=1)//if the distance is 1 or less
								if(prob(97))
									src.dir=get_dir(src,M)//Makes it so T faces M
									src.Attack()//Calls the attack proc
									if(prob(6.5))
										src.Shushin_Far_Behind(M)
									if(prob(4))
										src.usejutsu(M)
				else
					step_rand(src,0)
					for(var/mob/M in oview(6))
						if(src.owner==M||M==src||M.owner==src.owner)

						else
							src.target=M
					sleep(30)
				sleep(5)





mob
	var
		activated=0








mob
	npc
		New()
			..()
			src.fake=1
		Bunshin
			//human = 1
			density=0
			delonko = 1
			health = 1
			layer=MOB_LAYER
			New()
				..()
				spawn(200)
					if(src)
						del src
			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,volume=10)
				..()
		elementclone
			//human = 1
			density=1
			element="regular"
			delonko = 1
			health = 1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(25,30))
					src.cloneAI2()
				spawn(400)
					if(src)
						del src
			Del()
				var/U = src.element
				var/O=src.owner
				if(U=="regular")
					var/obj/smoke/S=new()
					S.loc=locate(src.x,src.y,src.z)
					view(src)<< sound('Smoke.wav',0,0,volume=10)
				else if(U=="raiton")
					for(var/turf/T in view(src,1))
						if(T.density==0)
							var/obj/jutsu/aftershock/A=new()
							A.power=src.nin*0.40
							A.owner=O;A.loc=locate(T.x,T.y,T.z)
				else if(U=="katon")
					for(var/turf/T in view(src,0))
						if(T.density==0)
							var/obj/jutsu/fire2/A=new()
							A.power=src.nin*0.10
							A.owner=O;A.loc=locate(T.x,T.y,T.z)
				else if(U=="suiton")
					for(var/turf/T in view(src,0))
						if(T.density==0)
							var/obj/jutsu/water/Owater/A=new()
							A.power=src.nin*0.60
							A.owner=O;A.loc=locate(T.x,T.y,T.z)
				else
					var/obj/smoke/S=new()
					S.loc=locate(src.x,src.y,src.z)
					view(src)<< sound('Smoke.wav',0,0,volume=10)
				..()
		trainingbag5
			//human = 1
			name="(Trainer 0.5) Punching Bag"
			icon='DogFusion.dmi'
			density=1
			delonko = 0
			Frozen=1
			moving=1
			health = 20
			Mhealth=20
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(1,50))
					src.overlays+='DogTail.dmi'
			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,volume=10)
				..()
		trainingbag
			//human = 1
			name="(Trainer 1) Punching Bag"
			icon='DogFusion.dmi'
			density=1
			delonko = 0
			Frozen=1
			moving=1
			health = 2000
			Mhealth=2000
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(1,50))
					src.overlays+='DogTail.dmi'
			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,volume=10)
				..()
		trainingbag2
			//human = 1
			name="(Trainer 2) Punching Bag"
			icon='DogFusion.dmi'
			density=1
			delonko = 0
			Frozen=1
			moving=1
			health = 15000
			Mhealth=15000
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(1,50))
					src.overlays+='DogTail.dmi'
			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,volume=10)
				..()
		trainingbag3
			//human = 1
			name="(Trainer 3) Punching Bag"
			icon='DogFusion.dmi'
			density=1
			delonko = 0
			Frozen=1
			moving=1
			health = 30000
			Mhealth=30000
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(1,50))
					src.overlays+='DogTail.dmi'
			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,volume=10)
				..()
		JokiBoi
			//human = 1
			density=0
			//NPC = 1
			health = 1000
			layer=MOB_LAYER
			New()
				..()
				spawn(3000)
					if(src)
						del src
				spawn(1)
					var/mob/O = src.owner
					while(src&&O)
						O.hydration=0
						if(O.usingjokiboi==0)
							del src
							break
						if(src.heatlevel>=100)
							if(O.ko!=1)
								src.explodeme()
						var/newsize=src.heatlevel*0.05
						if(newsize<1)
							newsize=1
						var/matrix/MM = matrix()
						MM.Scale(newsize)
						src.transform = MM
						sleep(10)
			Del()
				if(src.Frozen)
					sleep(60)
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,volume=30)
				var/mob/O = src.owner
				if(O)
					O.usingjokiboi=0
					O<<"The Steam Imp is gone."
				..()
		soulclone
			//human = 1
			density=1
			delonko = 1
			//NPC = 1
			health = 400
			layer=MOB_LAYER
			/*New()
				..()
				spawn(6000)
					if(src)
						del src*/
			Del()
				view(src)<<"[src] has crumbled into dust."
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<<sound('Smoke.wav',0,0,volume=15)
				..()
		Edobody
			//human = 1
			density=1
			//NPC = 1
			health = 100
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(2,10))
					if(src.activated)
						src.cloneAI()
				spawn(9000)
					if(src)
						del src
			Del()
				view(src)<<"[src] has been recalled."
				var/obj/endreanimate/UU = new()
				UU.loc=src.loc
				UU.layer=MOB_LAYER-0.01
				sleep(9)
				UU.layer=MOB_LAYER+1
				sleep(6)
				..()
		CrowBunshin
			//human = 1
			density=1
			delonko = 1
			//NPC = 1
			health = 1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(2,10))
					if(src.target)
						//var/mob/M = src.target
						src.cloneAI()
				spawn(rand(80,150))
					if(src)
						del src
			Del()
				var/x=rand(3,5)
				while(x)
					var/obj/crows/S=new()
					S.loc=locate(src.x,src.y,src.z)
					x-=1
					sleep(1)
				//view(src)<< sound('Smoke.wav',0,0,1)
				..()
		TsukuyomiBunshin
			//human = 1
			density=1
			delonko = 1
			//NPC = 1
			health = 1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(5,10))
					src.cloneAI()
				spawn(rand(150,200))
					if(src)
						del src
			Del()
				for(var/turf/x in view(1,src))
					var/obj/jutsu/tsukuyomiground/SC = new()
					SC.loc=locate(x.x,x.y,x.z)
					//view(src)<< sound('Smoke.wav',0,0,1)
				..()
		PathBody
			//human = 1
			density=1
			var/tmp/Chibaku = 0
			delonko = 1
			//NPC = 1
			health = 1
			layer=MOB_LAYER
			Del()
				if(src.path!=""&&src.path!=null)
					var/mob/npc/Corpse/S=new()
					S.loc=locate(src.x,src.y,src.z)
					S.overlays+=src.overlays
					S.icon=src.icon
					S.name=src.name
					S.icon_state="dead"
				else
					var/obj/smoke/S=new()
					S.loc=locate(src.x,src.y,src.z)
					view(src)<< sound('Smoke.wav',0,0,volume=12)
				..()

		Corpse
			//human = 1
			density=1
			//NPC = 1
			ko=2
			health = 1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(6000,9000))
					if(src)
						del src
		Skin
			//human = 1
			density=1
			//NPC = 1
			ko=2
			health = 1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(3000,6000))
					if(src)
						del src
		DeadSoul
			//human = 1
			density=1
			//NPC = 1
			delonko = 1
			health = 100
			layer=MOB_LAYER
			New()
				..()
				spawn(10)
					while(src)
						step_rand(src,16)
						src.koamm=0
						sleep(rand(1,3))
				spawn(rand(450,600))
					if(src)
						del src
			Del()
				var/mob/npc/Corpse/S=new()
				S.loc=locate(src.x,src.y,src.z)
				S.overlays+=src.overlays
				S.icon=src.icon
				S.name="Corpse"
				S.icon_state="dead"
				..()
		SmokeBunshin
			//human = 1
			density=1
			delonko = 1
			//NPC = 1
			health = 1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(60,100))
					if(src)
						del src
			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,volume=7)
				..()
		Izanagiclone
			//human = 1
			density=0
			delonko = 1
			//NPC = 1
			health = 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
			layer=MOB_LAYER
			New()
				..()
				animate(src, transform = null, alpha = 0, time = 30)
				spawn(rand(65,70))
					if(src)
						del src
		SubLog
			//human = 1
			density=1
			delonko = 1
			icon='NarutoStuff.dmi'
			icon_state="Log"
			name="Log"
			//NPC = 1
			health = 1
			layer=MOB_LAYER
			New()
				..()
				spawn(35)
					if(src)
						del src
			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,volume=20)
				..()
		SubBunshin
			//human = 1
			density=1
			delonko = 1
			//NPC = 1
			health = 200
			layer=MOB_LAYER
			New()
				..()
				spawn(300)
					if(src)
						del src
			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,volume=20)
				var/mob/npc/SubLog/T=new()
				T.loc=locate(src.x,src.y,src.z)
				..()
obj
	smoke
		icon='NarutoStuff.dmi'
		icon_state="Smoke"
		layer=MOB_LAYER+2*8000
		New()
			..()
			spawn(4)
				del src
	crows
		//icon='crows.dmi'
		icon='Crows.dmi'
		icon_state=""
		layer=MOB_LAYER+2
		New()
			..()
			src.icon_state=pick("1","2")
			animate(src, transform = null, alpha = 0, time = 25)
			spawn()
				src.dir=pick(NORTH,NORTHEAST,NORTHWEST,EAST,WEST,SOUTH,SOUTHEAST,SOUTHWEST)
				walk_rand(src,2,16)
			spawn(rand(25,35))
				del src




//mastery of skillls and levels of skills is now achivable
obj
	skill
		clones//this is the line the must only contain one verb after it untill the next jutsu
			verb
				Clones()
					set category = "Skills"
					set name = "Clone jutsu"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal((usr.Mchakra*pick(0.01,0.015)),3))
						spawn(1)
							usr.ninincrease(1)
						var/mob/npc/Bunshin/A=new()
						if(A)
							A.name="[usr]";A.density=0;A.owner=usr;A.icon=usr.icon;A.overlays+=usr.overlays;A.loc=locate(usr.x+1,usr.y,usr.z)
							var/obj/smoke/B=new()
							B.loc=locate(A.x,A.y,A.z)
							view(A)<< sound('Smoke.wav',0,0,volume=30)
							usr.AwardMedal("Two of me!")
					else
						usr<<"You failed the jutsu."
		henge
			verb
				Henge()
					set category = "Skills"
					set name = "Henge"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+200
					if(usr.handseal((usr.Mchakra*pick(0.02,0.025)),1))
						src<<"Not yet implimented."


					else
						usr<<"You failed the jutsu."
		kawa
			verb
				substi()
					set category = "Skills"
					set name = "Kawarimi"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal(200,2))
						spawn(1)
							usr.ninincrease(2)
						if(src.level>=1)
							var/mob/npc/SubBunshin/A=new()
							if(A)
								A.name="[usr.name]"
								A.owner=usr
								A.icon=usr.icon
								A.icon_state="Block"
								A.dir=usr.dir
								A.overlays+=usr.overlays
								A.loc=usr.loc
								if(prob(50))
									A.icon_state="Block"
								else
									A.icon_state=usr.icon_state
								usr.AwardMedal("HA that's not me!")
							usr.invisibility=1
							usr.see_invisible=1
							spawn(1)
								for(var/mob/O in view())
									if(O.target==usr)
										var/chance=(O.gen/(usr.gen+O.gen))*50
										if(chance<=0)
											chance=1
										if(chance>=100)
											chance=99
										if(prob(chance))
											if(O.client)
												O.DeleteTarget()
												var/image/I = image('target.dmi',A)
												O<<I
												O.target=A
											else
												O.target=A
							spawn(1)
								usr.stepback(4)
								sleep(10)
								usr.invisibility=0
								usr.see_invisible=0
						else
							var/mob/npc/SubLog/A=new()
							spawn(1)
								src.levelgain(4,0,usr,"Kawarimi")
							if(A)
								//A.name="[src.name]"
								A.owner=usr
								//A.icon=src.icon
								//A.dir=src.dir
								//A.overlays+=src.overlays
								A.loc=usr.loc
								//A.icon_state=""
								usr.AwardMedal("Psych")
							usr.invisibility=1
							usr.see_invisible=1
							spawn(1)
								for(var/mob/O in view())
									if(O.target==usr)
										var/chance=(O.gen/(usr.gen+O.gen))*50
										if(chance<=0)
											chance=1
										if(chance>=100)
											chance=99
										if(prob(chance))
											if(O.client)
												O.DeleteTarget()
												var/image/I = image('target.dmi',A)
												O<<I
												O.target=A
											else
												O.target=A
							spawn(1)
								usr.stepback(4)
								sleep(5)
								usr.invisibility=0
								usr.see_invisible=0
							if(src.mastery<100)
								if(prob(30))
									src.mastery+=4
									if(src.mastery>=100)
										usr<<"You mastered the substitution jutsu. Now a clone will apear instead of a log."
										src.level=1

					else
						usr<<"You failed the jutsu."
		crowclone
			verb
				CrowClone()
					set category = "Skills"
					set name = "Crow Clone"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					if(usr.crowgen>0)
						usr<<"You still have [usr.crowgen] crow clone(s) set up, no need to worry."
						return
					src.cooldown=world.time+600
					if(usr.handseal(200,6))
						if(src.level==0)
							src.level=1
						src.levelgain(5,src.level,usr,"Crow Clone")
						usr<<"You set up [src.level] Crow Clones."
						usr.crowgen=src.level
					else
						usr<<"You failed the jutsu."


obj
	proc
		levelgain(gain,minus,mob/M,name)
			spawn(1)
				var/expgain=gain-minus
				if(expgain<1)
					expgain=0
				src.mastery+=expgain
				if(src.mastery>=100)
					if(M&&name)
						M<<"[name] has advanced"
					//usr<<"You mastered the substitution jutsu. Now a clone will apear instead of a log."
					//world<<"[src] gained a level!([src.level])"
					src.mastery=0
					src.level+=1