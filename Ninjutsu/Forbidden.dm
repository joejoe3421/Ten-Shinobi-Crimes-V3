mob
	var
		reanimated=0


obj
	reanimate
		icon = 'Effects.dmi'
		icon_state="Coffin"
		density=0
		layer=MOB_LAYER+1
		New()
			..()
			spawn(45)
				if(src)
					del src
	endreanimate
		icon = 'Effects.dmi'
		icon_state="Coffin2"
		density=0
		layer=MOB_LAYER+1
		New()
			..()
			spawn(45)
				if(src)
					del src
	edowire
		icon='summoningeffect.dmi'
		density=1
		movedelay=1.2
		layer=TURF_LAYER
		var
			nin=10
			prestep=0
			laststep=0
		New()
			..()
			spawn(100)
				if(src)
					del src
		Bump(A)
			if(ismob(A))
				var/mob/M = A
				if(M.corpse)
					M.edome(src.owner,src.level)
				else
					src.density=0
					spawn(3)
						src.density=1
				del(src)
			if(istype(A,/turf/))
				del(src)
			if(istype(A,/obj/))
				del(src)
		Move()
			src.laststep=src.loc
			..()
			var/obj/edowiretrail/U=new()
			U.loc=src.laststep
			U.dir=src.dir
			U.owner=src.owner
	edowiretrail
		icon='summoningeffect.dmi'
		density=0
		layer=TURF_LAYER
		New()
			..()
			spawn(50)
				if(src)
					del src



mob/proc/edome(owner,levelnow)
	var/mob/O = owner
	var/time=0
	var/mob/T = src.owner
	time=levelnow
	spawn(1)
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
		spawn(15)
			var/mob/npc/Edobody/A=new()
			if(A)
				A.target=O.target
				A.name="[T](Edo)"
				A.Mhealth=src.Mhealth*0.75
				A.health=A.Mhealth
				A.Mtai=src.Mtai*0.80
				A.Mnin=src.Mnin*0.80
				A.Mgen=src.Mgen*0.80
				A.tai=A.Mtai
				A.nin=A.Mnin
				A.gen=A.Mgen
				A.attackdelay=src.attackdelay
				A.jutsus=src.jutsus
				A.style=src.style
				A.owner=O
				A.icon=src.icon
				A.dir=SOUTH
				A.overlays+=src.overlays
				A.loc=src.loc
				src.loc=locate(0,0,0)
				A.icon_state=""
				A.run=1
				//bodies+=1
				A.reanimated=1
				if(time<1)
					if(prob(35))
						A.activated=1
				else
					A.activated=1
				A.koamm=100
				if(A.activated==0)
					O<<"[A] won't budge..."
				//del src
				var/endtime=60*time
				if(endtime<60)
					endtime=60
				if(A.activated==0)
					endtime=10
				A.deletetime(endtime)
				sleep(4)
				del src


mob
	proc
		deletetime(timer)
			spawn(1)
				while(timer>0)
					timer-=1
					sleep(10)
				if(src)
					src.Frozen=1
					src.ko=1
					sleep(15)
					del src



obj
	skill
		deadsoul//
			verb
				deadsoul()
					set category = "Skills"
					set name = "Dead Soul Jutsu"
					if(usr.inevent)
						usr<<"Not in an event."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+100
					for(var/mob/npc/Corpse/C in view(1,usr))
						if(usr.handseal(800,7))
							usr.Summoneffect()
							var/mob/npc/DeadSoul/A=new()
							if(A)
								A.name="[usr.name]"
								A.health=(usr.nin*rand(2,4))
								A.owner=usr
								A.icon=usr.icon
								A.dir=usr.dir
								A.overlays+=usr.overlays
								A.loc=C.loc
								A.icon_state=usr.icon_state
								A.run=0
							del C
							break
							//var/obj/smoke/B=new()
							//B.loc=locate(A.x,A.y,A.z)
							//view(A)<< sound('Smoke.wav',0,0,1)
						else
							usr<<"You failed the jutsu."
		edotensai//
			verb
				edo()
					set category = "Skills"
					set name = "Edo Tensai"
					if(usr.inevent)
						usr<<"Not in an event."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(1000,15))
						flick("beastman",usr)
						var/bodies=0
						for(var/mob/npc/Corpse/C in view(9,usr))
							bodies+=1
							var/obj/edowire/U=new()
							U.level=src.level
							U.loc=usr.loc
							U.owner=usr
							U.mastery=src.mastery
							walk_towards(U,C,0,31)
							//bodies+=1
							if(src.level<=9)
								spawn(1)
									var/help=0
									help=(5-src.level)
									if(help<=0)
										help=1
									if(src.level<10)
										src.mastery+=(help)
										if(prob(10))
											usr<<"Your learning how to use Edo Tensai a little better."
										if(src.mastery>=100)
											src.level+=1
											src.mastery-=100
											usr<<"You advance with Edo Tensai and is now able to summon [src.level+1] bodies while they last a 1 minute longer."
												//var/obj/skill/asura2/A=new()
												//A.loc=usr
							if(src.level<10&&bodies>=(src.level+1))
								break
						if(src.level<=9)
							spawn(1)
								var/help=0
								help=(3-src.level)
								if(help<=0)
									help=1
								if(src.level<10)
									src.mastery+=(help)
									if(prob(10))
										usr<<"Your learning how to use Edo Tensai a little better."
									if(src.mastery>=100)
										src.level+=1
										src.mastery-=100
										usr<<"You get better with Edo Tensai and is now able to summon [src.level+1] bodies."
											//var/obj/skill/asura2/A=new()
											//A.loc=usr
					else
						usr<<"You failed the jutsu."
mob
	proc
		edorecover()
			var/x=0
			var/mylook=list()
			mylook+=src.overlays
			src.overlays-=src.overlays
			src.overlays-=src.overlays
			src.overlays-=src.overlays
			while(x<30)
				flick('edoheal.dmi',src)
				x+=1
				if(prob(10))
					sleep(5)
				else
					sleep(10)
			sleep(30)
			src.overlays+=mylook
			src.health=src.Mhealth
			src.icon_state=""
			src.ko=0
			src.WakeUp2()


//for edo u can summon them any time u want if they are yours and the normal timer they stay is 60 second times the level of the jutsu, max level 5
//u can summon them at any time, freeze them, and make their target your target
//born with a ko ammount of 100 when they die they turn stay down and after about 30 seconds paper goes to them and they get abck up at full health
//make a seperate code for them mush like event code but a bit slower so they can be kinda easy to kill
/////////////////////
///////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////


mob
	var
		heart=1
		skinshed=0
		tmp/canshed=0
		skinlayers=0//everylayer is another body, max out at 2
		origoverlays=list()
		skin1overlays=list()
		skin2overlays=list()


mob
	proc
		shinshed()
			src.canshed=10
			src<<"You have 10 seconds to click here to <a href='?[list2params(list("src"="\ref[src]", "action"="Shed_Skin", ""))]'>\[Shed Skin]</a>."
			//src<<"<a href='?[list2params(list("src"="\ref[src]", "action"="Shed_Skin", "name"="[usr.name]"))]'>\[Shed Skin]</a>"
			while(src.canshed>0)
				src.canshed-=1
				sleep(10)
			//src<<"You failed to shed your skin..."
	proc
		skincreate()
			var/mob/npc/Skin/A=new()
			//var/mob/C = src
			A.name="[src.name]'s Skin"
			A.owner="[src]"
			A.Mhealth=src.Mhealth
			A.Mtai=src.Mtai
			A.Mnin=src.Mnin
			A.Mgen=src.Mgen
			A.attackdelay=src.attackdelay
			A.jutsus=src.jutsus
			//A.corpse=1
			A.icon=src.icon
			//A.dir=usr.dir
			A.overlays+=src.overlays
			A.loc=src.loc
			A.icon_state="dead"
			oview(src)<<"[src] Jumps out their own mouth?!?"
			src<<"You shed your skin."
			src.canshed=0
			var/vt=list()
			if(src.skinlayers==2)
				src.overlays-=src.overlays
				src.overlays=vt
				src.overlays+=src.skin1overlays
				//usr.skinlayers-=1
			if(src.skinlayers==1)
				src.overlays-=src.overlays
				src.overlays=vt
				src.overlays+=src.origoverlays
			src.skinlayers-=1
			src.koamm-=src.koamm*0.25
			src.WakeUp2()



obj
	skill
		takeh
			verb
				takeh()
					set category = "Skills"
					set name = "Steal Heart"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+900
					if(usr.handseal(1000,15))
						usr<<"Not yet implimented."

		skintake
			verb
				skintake()
					set category = "Skills"
					set name = "Take Skin"
					if(usr.skinlayers>=2)
						usr<<"You can't take anymore skin."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+600
					if(usr.handseal(1000,15))
						var/vt=list()
						for(var/mob/npc/Corpse/M in get_step(usr,usr.dir))
							if(M.corpse)
								if(usr.skinlayers==0)
									usr.origoverlays=list()
									usr.origoverlays+=usr.overlays
									usr.overlays-=usr.overlays
									usr.overlays=vt
									usr.overlays+=M.overlays
									usr<<"You take [M.owner]'s skin."
									usr.skinlayers+=1
									usr.loc=M.loc
									usr.icon_state=M.icon_state
									oview(usr)<<"[usr] jumped into [M.owner]'s mouth."
									del M
									break
								if(usr.skinlayers==1)
									usr.skin1overlays=list()
									usr.skin1overlays+=usr.overlays
									usr.overlays-=usr.overlays
									usr.overlays=vt
									usr.overlays+=M.overlays
									usr<<"You take [M.owner]'s skin."
									usr.skinlayers+=1
									usr.loc=M.loc
									usr.icon_state=M.icon_state
									oview(usr)<<"[usr] jumped into [M.owner]'s mouth."
									del M
									break

























