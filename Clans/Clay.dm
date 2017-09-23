mob
	var
		artmastery=0
		explosivemastery=0

mob
	teacher
		Clayteacher
			//human = 1
			density=1
			//NPC = 1
			name="Art Teacher"
			icon='Guy.dmi'
			clan="Clay"
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				.=..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='KakashiH.dmi'
					var/Shirt='Shirt.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(50,50,50)
					Shirt+=rgb(0,75,0)
					src.icon=Base
					src.overlays+='Boxers.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+='pants.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+='RockJounin.dmi'
					src.overlays+=Shirt
					src.overlays+=Hair
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr.clan==src.clan)
					if(usr.artmastery>=0)
						cl+="C1"
					if("C1" in usr.jutsus)
						if(usr.artmastery>=0)
							cl+="C1: Birds"
						if(usr.artmastery>=1)
							cl+="C1: Flower"
						if(usr.artmastery>=2&&usr.explosivemastery>=10)
							cl+="C1: Spiders"
						if(usr.artmastery>=3&&usr.explosivemastery>=15)
							cl+="C1: Snake"
						if(usr.artmastery>=5&&usr.explosivemastery>=25)
							cl+="C1: Mine"
						if(usr.artmastery>=7&&usr.explosivemastery>=30)
							cl+="C1: Kunai"
						if(usr.artmastery>=10&&usr.explosivemastery>=35)
							cl+="C1: Senbon"
						if(usr.artmastery>=25)
							cl+="C2"
					if(findtextEx(usr.jutsus,"C2",1,0))// in usr.jutsus)
						cl+="C2: Birds"
					if(usr.artmastery>=32&&"C2" in usr.jutsus)
						cl+="C2: Trap"
					if(usr.artmastery>=32&&"C2" in usr.jutsus&&"C1: Mine" in usr.jutsus)
						cl+="C2: Mine"
					if(usr.artmastery>=35&&usr.explosivemastery>=45&&"C2" in usr.jutsus)
						cl+="C2: Spiders"
					if(usr.artmastery>=37&&"C2" in usr.jutsus&&"C1: Flower" in usr.jutsus)
						cl+="C2: Flower"
					if(usr.artmastery>=40&&usr.explosivemastery>=60&&"C2" in usr.jutsus)
						cl+="C2: Spear"
					if(usr.artmastery>=70&&"C2" in usr.jutsus)
						cl+="C2: Giant Bird"
					if(usr.artmastery>=50&&usr.explosivemastery>=80&&"C2" in usr.jutsus)
						cl+="C2: Dragon"
					if(usr.artmastery>=55&&"C1" in usr.jutsus&&"C2" in usr.jutsus)
						cl+="C3"
					if(usr.artmastery>=75&&usr.explosivemastery>=80&&"C3" in usr.jutsus)
						cl+="C3 Explosive"
					if(usr.artmastery>=100&&usr.explosivemastery>=100&&usr.ninknowledge>=300&&"C1" in usr.jutsus&&"C2" in usr.jutsus&&"C3" in usr.jutsus)
						cl+="C4"
					if(usr.artmastery>=100&&usr.explosivemastery>=100&&usr.ninknowledge>=500&&"C1" in usr.jutsus&&"C2" in usr.jutsus&&"C3" in usr.jutsus&&"C4" in usr.jutsus)
						cl+="C0"
				oview(src)<<"[src] Says: This is true art."
				sleep(3)
				if(usr.clan==src.clan)
					oview(src)<<"[src] Says: Hello, I am a teacher of the clay arts. Do you wish to learn the ephemeral art of explosions? I can show you that art....is a bang."
					var/T = input("What to learn?","[src]") in list("Nothing") + cl
					if(T=="Nothing")
						return
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
						return
					if(T=="C1"||T=="C2"||T=="C3")
						oview(src)<<"[src] teaches [usr] how to use [T]."
						usr.jutsus += T
					else if(T=="C1: Birds")
						usr.contents += new /obj/skill/clay1
						oview(src)<<"[src] teaches [usr] how to make [T]."
						usr.jutsus += T
					else if(T=="C1: Flower")
						usr.contents += new /obj/skill/clayflower
						oview(src)<<"[src] teaches [usr] how to make [T]s."
						usr.jutsus += T
					else if(T=="C1: Kunai")
						usr.contents += new /obj/skill/claykunai
						oview(src)<<"[src] teaches [usr] how to make [T]."
						usr.jutsus += T
					else if(T=="C1: Senbon")
						usr.contents += new /obj/skill/claysenbon
						oview(src)<<"[src] teaches [usr] how to make [T]."
						usr.jutsus += T
					else if(T=="C1: Spiders")
						usr.contents += new /obj/skill/clay2
						oview(src)<<"[src] teaches [usr] how to make [T]."
						usr.jutsus += T
					else if(T=="C2: Birds")
						usr.contents += new /obj/skill/clay3
						oview(src)<<"[src] teaches [usr] how to make [T]."
						usr.jutsus += T
					else if(T=="C2: Spiders")
						usr.contents += new /obj/skill/clay4
						oview(src)<<"[src] teaches [usr] how to make [T]."
						usr.jutsus += T
					else if(T=="C2: Dragon")
						usr.contents += new /obj/skill/clay5
						oview(src)<<"[src] teaches [usr] how to make [T]s."
						usr.jutsus += T
					else
						oview(src)<<"[src] Says: Uhhh... no, Deidara would kill me if I taught you that.."








obj/jutsu
	C1
		icon='Explosion(1).dmi'
		icon_state="Explode"
		//JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		New()
			..()
			spawn()
				sleep(1)
				for(var/mob/M in view(1,src))
					spawn()
						if(M)
							var/mob/O=src.owner
							//M.taidamage(O.tai*1.5,0,O)
							//var/damage=M.Mhealth*0.06
							view(M)<<"<font color=red>[M] has been hit by the explosion!</font>"
							//M.nindamage(M.Mhealth*0.12,0,src.owner)
							M.nindamage(src.power*rand(1.1,1.6),0,O)
							view(3,src)<< sound('SFX/Bang.wav',0,0,volume=20)
							if(O)
								O.AwardMedal("Art is a BOOM!")
								if(prob(60))
									if(O.explosivemastery<100)
										O.explosivemastery+=0.01
							//M.Death(M)

			spawn(5)
				del(src)

obj/jutsu
	C2
		icon='Explosion(1).dmi'
		icon_state="ExplodeMiddle"
		//JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		New()
			..()
			overlays+=/obj/jutsu/Explosion/A
			overlays+=/obj/jutsu/Explosion/B
			overlays+=/obj/jutsu/Explosion/C
			overlays+=/obj/jutsu/Explosion/D
			overlays+=/obj/jutsu/Explosion/E
			overlays+=/obj/jutsu/Explosion/F
			overlays+=/obj/jutsu/Explosion/G
			overlays+=/obj/jutsu/Explosion/H
			spawn()
				sleep(1)
				spawn(1)
					var/z=rand(2,5)
					while(z>0)
						var/obj/s=new/obj/Ashes2
						s.loc=src.loc
						z--
						sleep(1)
				for(var/mob/M in view(1,src))
					spawn()
						if(M)
							var/mob/O=src.owner
							//M.taidamage(O.tai*1.5,0,O)
							//var/damage=M.Mhealth*0.06
							view(M)<<"<font color=red>[M] has been hit by the explosion!</font>"
							//M.nindamage(M.Mhealth*0.12,0,src.owner)
							M.nindamage(src.power*rand(1.1,1.5),0,O)
							view(3,src)<< sound('SFX/Bang.wav',0,0,volume=40)
							if(prob(70))
								if(O.explosivemastery<100)
									O.explosivemastery+=0.02
							//M.Death(M)

			spawn(5)
				del(src)
		A
			icon_state="ExplodeTopLeft"
			pixel_x = -32
			pixel_y = 32
			layer=MOB_LAYER+1
		B
			icon_state="ExplodeTopMiddle"
			pixel_y = 32
			layer=MOB_LAYER+1
		C
			icon_state="ExplodeTopRight"
			pixel_x = 32
			pixel_y = 32
			layer=MOB_LAYER+1
		D
			icon_state="ExplodeMiddleLeft"
			pixel_x = -32
			layer=MOB_LAYER+1
		E
			icon_state="ExplodeMiddleRight"
			pixel_x = 32
			layer=MOB_LAYER+1
		F
			icon_state="ExplodeBottomLeft"
			pixel_x = -32
			pixel_y = -32
			layer=MOB_LAYER+1
		G
			icon_state="ExplodeBottomMiddle"
			pixel_y = -32
			layer=MOB_LAYER+1
		H
			icon_state="ExplodeBottomRight"
			pixel_x = 32
			pixel_y = -32
			layer=MOB_LAYER+1



obj/jutsu
	C3
		icon='Explosion(1).dmi'
		icon_state="ExplodeMiddle"
		//JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		New()
			..()
			overlays+=/obj/jutsu/Explosion/A
			overlays+=/obj/jutsu/Explosion/B
			overlays+=/obj/jutsu/Explosion/C
			overlays+=/obj/jutsu/Explosion/D
			overlays+=/obj/jutsu/Explosion/E
			overlays+=/obj/jutsu/Explosion/F
			overlays+=/obj/jutsu/Explosion/G
			overlays+=/obj/jutsu/Explosion/H
			spawn()
				sleep(1)
				spawn(1)
					var/z=rand(2,5)
					while(z>0)
						var/obj/s=new/obj/Ashes2
						s.loc=src.loc
						z--
						sleep(1)
				for(var/mob/M in view(1,src))
					spawn()
						if(M)
							var/mob/O=src.owner
							//M.taidamage(O.tai*1.5,0,O)
							//var/damage=M.Mhealth*0.06
							view(M)<<"<font color=red>[M] has been hit by the explosion!</font>"
							//M.nindamage(M.Mhealth*0.12,0,src.owner)
							M.nindamage(src.power*10,0,O)
							view(3,src)<< sound('SFX/Bang.wav',0,0,volume=60)
							if(prob(75))
								if(O.explosivemastery<100)
									O.explosivemastery+=0.03
							//M.Death(M)

			spawn(5)
				del(src)
		A
			icon_state="ExplodeTopLeft"
			pixel_x = -32
			pixel_y = 32
			layer=MOB_LAYER+1
		B
			icon_state="ExplodeTopMiddle"
			pixel_y = 32
			layer=MOB_LAYER+1
		C
			icon_state="ExplodeTopRight"
			pixel_x = 32
			pixel_y = 32
			layer=MOB_LAYER+1
		D
			icon_state="ExplodeMiddleLeft"
			pixel_x = -32
			layer=MOB_LAYER+1
		E
			icon_state="ExplodeMiddleRight"
			pixel_x = 32
			layer=MOB_LAYER+1
		F
			icon_state="ExplodeBottomLeft"
			pixel_x = -32
			pixel_y = -32
			layer=MOB_LAYER+1
		G
			icon_state="ExplodeBottomMiddle"
			pixel_y = -32
			layer=MOB_LAYER+1
		H
			icon_state="ExplodeBottomRight"
			pixel_x = 32
			pixel_y = -32
			layer=MOB_LAYER+1



obj/jutsu
	C4
		icon='Explosion(1).dmi'
		icon_state="ExplodeMiddle"
		//JutsuLevel=150
		layer=MOB_LAYER+2
		dir=NORTH
		New()
			..()
			overlays+=/obj/jutsu/Explosion/A
			overlays+=/obj/jutsu/Explosion/B
			overlays+=/obj/jutsu/Explosion/C
			overlays+=/obj/jutsu/Explosion/D
			overlays+=/obj/jutsu/Explosion/E
			overlays+=/obj/jutsu/Explosion/F
			overlays+=/obj/jutsu/Explosion/G
			overlays+=/obj/jutsu/Explosion/H
			spawn()
				sleep(1)
				spawn(1)
					var/z=rand(2,5)
					while(z>0)
						var/obj/s=new/obj/Ashes2
						s.loc=src.loc
						z--
						sleep(1)
				for(var/mob/M in view(1,src))
					spawn()
						if(M)
							var/mob/O=src.owner
							//M.taidamage(O.tai*1.5,0,O)
							//var/damage=M.Mhealth*0.06
							view(M)<<"<font color=red>[M] has been hit by the explosion!</font>"
							//M.nindamage(M.Mhealth*0.12,0,src.owner)
							M.nindamage(src.power*17,0,O,"clay")
							view(3,src)<< sound('SFX/Bang.wav',0,0,volume=100)
							if(prob(70))
								if(O.explosivemastery<100)
									O.explosivemastery+=0.03
							//M.Death(M)

			spawn(5)
				del(src)
		A
			icon_state="ExplodeTopLeft"
			pixel_x = -32
			pixel_y = 32
			layer=MOB_LAYER+1
		B
			icon_state="ExplodeTopMiddle"
			pixel_y = 32
			layer=MOB_LAYER+1
		C
			icon_state="ExplodeTopRight"
			pixel_x = 32
			pixel_y = 32
			layer=MOB_LAYER+1
		D
			icon_state="ExplodeMiddleLeft"
			pixel_x = -32
			layer=MOB_LAYER+1
		E
			icon_state="ExplodeMiddleRight"
			pixel_x = 32
			layer=MOB_LAYER+1
		F
			icon_state="ExplodeBottomLeft"
			pixel_x = -32
			pixel_y = -32
			layer=MOB_LAYER+1
		G
			icon_state="ExplodeBottomMiddle"
			pixel_y = -32
			layer=MOB_LAYER+1
		H
			icon_state="ExplodeBottomRight"
			pixel_x = 32
			pixel_y = -32
			layer=MOB_LAYER+1



obj
	jutsu
		c1
			density=1
			bird
				icon='Clayset.dmi'
				icon_state="c1bird"//put most of clay techs in same icon file
				New()
					..()
					spawn(rand(30,40))
						del(src)
			kunai
				icon='Clayset.dmi'
				icon_state="Kunai"//put most of clay techs in same icon file
				New()
					..()
					spawn(rand(30,40))
						del(src)
			senbon
				icon='Clayset.dmi'
				icon_state="Senbon"//put most of clay techs in same icon file
				New()
					..()
					spawn(rand(30,40))
						del(src)
			spider
				icon='Clayset.dmi'
				icon_state="c1spider"

			mine
				icon='Clayset.dmi'
				icon_state="bigmine"
				density=0
			flower
				icon='Clayset.dmi'
				icon_state="Flower"
				density=0
			snake
				icon='Clayset.dmi'
				icon_state="Snake head"
				density=1
				New()
					..()
					spawn(rand(100,150))
						del(src)
			New()
				..()
				spawn(rand(300,600))
					if(src)
						del src
			Bump(A)
				if(ismob(A))
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/))
					del(src)
			Del()
				var/obj/jutsu/C1/K=new()
				var/myp=src.power
				K.power=myp
				K.loc=src.loc
				K.owner=src.owner
				..()
		c1mine
			density=0
			mine
				icon='Clayset.dmi'
				icon_state="mine"
			New()
				spawn(rand(1800,3000))
					if(src)
						del(src)
			Bump(A)
				if(ismob(A))
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/))
					del(src)
			Del()
				var/obj/jutsu/C1/K=new()
				var/myp=src.power
				K.power=myp
				K.loc=src.loc
				K.owner=src.owner
				..()
		c2mine
			density=0
			mine
				icon='Clayset.dmi'
				icon_state="hugemine"
			New()
				spawn(rand(1800,3000))
					del(src)
			Bump(A)
				if(ismob(A))
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/))
					del(src)
			Del()
				var/obj/jutsu/C2/K=new()
				var/myp=src.power
				K.power=myp
				K.loc=src.loc
				K.owner=src.owner
				..()
		c2
			density=1
			bird
				icon='Clayset.dmi'
				icon_state="c2bird"
				movedelay=1.2
			spider
				icon='Clayset.dmi'
				icon_state="c2spider"
				movedelay=1.6
			New()
				spawn(rand(30,40))
					del(src)
			Bump(A)
				if(ismob(A))
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/))
					del(src)
			Del()
				var/obj/jutsu/C2/K=new()
				var/myp=src.power
				K.power=myp
				K.loc=src.loc
				K.owner=src.owner
				..()
		dragonbird
			icon='Clayset.dmi'
			icon_state="bigbird"
			density=1
			movedelay=1
			New()
				..()
				spawn(rand(30,40))
					del(src)
			Bump(A)
				if(ismob(A))
					del(src)
				if(istype(A,/turf/))
					var/turf/T = A
					if(T.density)
						del(src)
				if(istype(A,/obj/))
					del(src)
			Del()
				var/obj/jutsu/C2/K=new()
				var/myp=src.power
				K.power=myp
				K.loc=src.loc
				K.owner=src.owner
				..()

mob
	var
		clay=0


obj
	skill
		clay1
			verb
				bird()
					set category = "Skills"
					set name = "C1 Birds"
					if(usr.clay<2)
						usr<<"You dont have enough clay prepared."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+100
					if(usr.handseal(50,1))//200 chakra cost
						//usr.Frozen=1
						if(src.level==0)
							src.level=1
						src.levelgain(8,src.level,usr,"Clay Birds")
						spawn(1)
							if(prob(20))
								if(usr.artmastery<100)
									usr.artmastery+=0.1
						usr.clay-=2
						usr.claybirds(src.level)
						//usr.Frozen=0
						//usr.Summoneffect()
						//var/obj/smoke/B=new()
						//B.loc=locate(A.x,A.y,A.z)
						//view(A)<< sound('Smoke.wav',0,0,1)
					else
						usr<<"You failed the jutsu."
				prepareclay()
					set category = "Commands"
					set name = "Prepare Clay"
					var/preparing=0
					for(var/obj/materials/clay/O in usr.contents)
						preparing+=O.ammount
						del O
					usr<<"You prepare [preparing] amount/s of clay."
					usr.clay+=preparing
		clay2
			verb
				spider()
					set category = "Skills"
					set name = "C1 Spiders"
					if(usr.clay<2)
						usr<<"You dont have enough clay prepared."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+100
					if(usr.handseal(100,2))//200 chakra cost
						if(src.level==0)
							src.level=1
						src.levelgain(15,src.level,usr,"Clay Spiders")
						spawn(1)
							if(prob(20))
								if(usr.artmastery<100)
									usr.artmastery+=0.1
						usr.clay-=2
						usr.clayspiders(src.level)
						//usr.Frozen=0
					else
						usr<<"You failed the jutsu."
		claykunai
			verb
				kunai()
					set category = "Skills"
					set name = "C1 Kunai"
					if(usr.clay<1)
						usr<<"You dont have enough clay prepared."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+70
					if(usr.handseal(80,1))//200 chakra cost
						//usr.Frozen=1
						if(src.level==0)
							src.level=1
						spawn(1)
							if(prob(10))
								if(usr.artmastery<100)
									usr.artmastery+=0.1
						usr.clay-=1
						var/obj/jutsu/c1/kunai/A=new()
						A.power=usr.artmastery+usr.explosivemastery+(usr.nin*0.08)
						A.loc=usr.loc
						A.dir=usr.dir
						flick("Attack2",usr)
						walk(A,A.dir)
		claysenbon
			verb
				senbon()
					set category = "Skills"
					set name = "C1 Senbon"
					if(usr.clay<1)
						usr<<"You dont have enough clay prepared."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+100
					if(usr.handseal(90,1))//200 chakra cost
						//usr.Frozen=1
						if(src.level==0)
							src.level=1
						spawn(1)
							if(prob(10))
								if(usr.artmastery<100)
									usr.artmastery+=0.1
						usr.clay-=1
						var/obj/jutsu/c1/senbon/A=new()
						A.power=usr.artmastery+usr.explosivemastery+(usr.nin*0.10)
						A.loc=usr.loc
						A.dir=usr.dir
						flick("Attack2",usr)
						walk(A,A.dir)
		clayflower
			verb
				flower()
					set category = "Skills"
					set name = "C1 Flower"
					if(usr.clay<1)
						usr<<"You dont have enough clay prepared."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal(100,2))//200 chakra cost
						//usr.Frozen=1
						if(src.level==0)
							src.level=1
						spawn(1)
							if(prob(10))
								if(usr.artmastery<100)
									usr.artmastery+=0.1
						usr.clay-=1
						var/obj/jutsu/c1/flower/A=new()
						A.power=usr.artmastery+usr.explosivemastery+(usr.nin*0.15)
						A.loc=usr.loc
						flick("beastman",usr)
		clay3
			verb
				bird2()
					set category = "Skills"
					set name = "C2 Birds"
					if(usr.clay<4)
						usr<<"You dont have enough clay prepared."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal(250,3))//200 chakra cost
						if(src.level==0)
							src.level=1
						src.levelgain(6,src.level,usr,"Clay Birds")
						spawn(1)
							if(prob(12))
								if(usr.artmastery<100)
									usr.artmastery+=0.2
						usr.clay-=4
						usr.claybirds2(src.level)
						//usr.Frozen=0
						//usr.Summoneffect()
						//var/obj/smoke/B=new()
						//B.loc=locate(A.x,A.y,A.z)
						//view(A)<< sound('Smoke.wav',0,0,1)
					else
						usr<<"You failed the jutsu."
		clay4
			verb
				spider2()
					set category = "Skills"
					set name = "C2 Spiders"
					if(usr.clay<4)
						usr<<"You dont have enough clay prepared."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+200
					if(usr.handseal(120,3))//200 chakra cost
						if(src.level==0)
							src.level=1
						src.levelgain(15,src.level,usr,"Clay Spiders")
						spawn(1)
							if(prob(12))
								if(usr.artmastery<100)
									usr.artmastery+=0.2
						usr.clay-=4
						usr.clayspiders2(src.level)
						//usr.Frozen=0
					else
						usr<<"You failed the jutsu."
		clay5
			verb
				dragon()
					set category = "Skills"
					set name = "C2 Dragon"
					if(usr.clay<10)
						usr<<"You dont have enough clay prepared."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+2000
					if(usr.handseal(2000,5))//200 chakra cost
						spawn(1)
							if(prob(30))
								if(usr.artmastery<100)
									usr.artmastery+=0.5
						usr.clay-=10
						var/mob/claydragon/A=new()
						A.owner=usr;A.loc=usr.loc
						A.health+=usr.nin*10
						A.nin=usr.nin*4
						A.dir=SOUTH
						A.density=1
					else
						usr<<"You failed the jutsu."






mob
	proc
		claybirds(number)
			//src.icon_state="Attack2"
			//view(src)<<"[src] opens up his catridges and lets out missiles!"
			sleep(5)
			var/X=number
			while(X)
				spawn(1)
					var/obj/jutsu/c1/bird/A=new()
					A.power=src.artmastery+src.explosivemastery+(src.nin*0.30)
					A.owner=src;A.loc=src.loc
					A.dir=src.dir
					spawn(1)
						while(A)
							//A.dir=src.dir
							flick("Attack2",src)
							step(A,A.dir)
							if(src.target)
								if(prob(35))//was 23
									if(A)
										A.dir=get_dir(A,src.target)
							sleep(1.2)
				X-=1
				sleep(2)//was 5
			//src.icon_state=""


mob
	proc
		clayspiders(number)
			src.icon_state="Power"
			//view(src)<<"[src] opens up his catridges and lets out missiles!"
			sleep(5)
			var/X=number
			while(X)
				spawn(1)
					var/obj/jutsu/c1/spider/A=new()
					A.power=src.artmastery+src.explosivemastery+(src.nin*0.20)
					A.owner=src;A.loc=src.loc
					A.dir=pick(NORTH,NORTHEAST,NORTHWEST,SOUTH,SOUTHEAST,SOUTHWEST,EAST,WEST)//src.dir
					spawn(1)
						while(A)
							//A.dir=src.dir
							step_rand(A)
							if(src.target)
								if(prob(3))//was 45
									if(A)
										A.dir=get_dir(A,src.target)
							sleep(1.4)
				X-=1
				sleep(2)//was 5
			src.icon_state=""




mob
	proc
		claybirds2(number)
			//src.icon_state="Attack2"
			//view(src)<<"[src] opens up his catridges and lets out missiles!"
			sleep(5)
			var/X=number
			while(X)
				spawn(1)
					var/obj/jutsu/c2/bird/A=new()
					A.power=src.artmastery+src.explosivemastery+(src.nin*0.60)
					A.owner=src;A.loc=src.loc
					A.dir=src.dir
					spawn(1)
						while(A)
							//A.dir=src.dir
							flick("Attack2",src)
							step(A,A.dir)
							if(src.target)
								if(prob(36))//was 45
									if(A)
										A.dir=get_dir(A,src.target)
							sleep(1.8)
				X-=1
				sleep(4)//was 5
			src.icon_state=""


mob
	proc
		clayspiders2(number)
			src.icon_state="Power"
			//view(src)<<"[src] opens up his catridges and lets out missiles!"
			sleep(5)
			var/X=number
			while(X)
				spawn(1)
					var/obj/jutsu/c2/spider/A=new()
					A.power=src.artmastery+src.explosivemastery+(src.nin*0.40)
					A.owner=src;A.loc=src.loc
					A.dir=pick(NORTH,NORTHEAST,NORTHWEST,SOUTH,SOUTHEAST,SOUTHWEST,EAST,WEST)//src.dir
					spawn(1)
						while(A)
							//A.dir=src.dir
							step_rand(A)
							if(src.target)
								if(prob(6))//was 45
									if(A)
										A.dir=get_dir(A,src.target)
							sleep(1.5)
				X-=1
				sleep(3)//was 5
			src.icon_state=""


































//add eye piece, able to break the user out of most genjutsu if they can move their arms to use jutsu


































mob
	claydragon
		density=1
		icon='Claydragon.dmi'
		icon_state="Idle"
		health = 10000
		layer=EFFECTS_LAYER
		New()
			..()
			src.pixel_y-=188
			src.pixel_x-=188
			src.fake=1
			flick("create",src)
			sleep(3)
			spawn(600)
				del src
			spawn(5)
				src.claydragonproc()



mob
	proc
		claydragonproc()
			while(src)
				if(src.target&&src.target in view(15,src))
					var/X=rand(1,3)
					if(X==1||X==3)
						src.tailswing()
						sleep(2)
					else
						var/whichone=pick("mine","bird")
						if(whichone=="mine")
							src.landminemake()
						if(whichone=="bird")
							src.birdmake()
						//clay animals
					src.icon_state = "Idle"
					sleep(20)
				else
					for(var/mob/M in oview(9,src))
						if(M!=src.owner)
							src.target=M
					var/X=rand(1,3)
					if(X==1||X==3)
						src.tailswing()
						sleep(2)
					else
						var/whichone=pick("mine","bird")
						if(whichone=="mine")
							src.landminemake()
						if(whichone=="bird")
							src.birdmake()
						//clay animals
					src.icon_state = "Idle"
					sleep(10)

		tailswing()
			src.icon_state = "Idle"
			flick("tail swing",src)
			for(var/mob/M in orange(4))
				if(M!=src.owner)
					spawn(1)
						view(src)<<sound('KickHit.ogg',0,0,volume=100)
					M.taidamage(src.nin*1.4,0,src.owner)
					spawn(1)
						M.dir=get_dir(M,src)
						M.stepback(15)
				//if(M.client)spawn() M.ScreenShake(5)
		landminemake()
			var/whichone=pick("big","normal","small")
			src.icon_state = "mouth open"
			var/howmany=rand(1,10)
			if(whichone=="small")
				while(howmany)
					var/obj/jutsu/c1mine/mine/A=new()
					A.power=(src.nin*0.30)
					A.owner=src.owner;A.loc=src.loc
					A.dir=src.dir
					A.density=1
					spawn(1)
						walk(A,pick(SOUTH,EAST,WEST,SOUTHEAST,SOUTHWEST),3,16)
					howmany-=1
					sleep(3)
			if(whichone=="normal")
				while(howmany)
					var/obj/jutsu/c1/mine/A=new()
					A.power=(src.nin*0.50)
					A.owner=src.owner;A.loc=src.loc
					A.dir=src.dir
					A.density=1
					spawn(1)
						walk(A,pick(SOUTH,EAST,WEST,SOUTHEAST,SOUTHWEST),3,16)
					howmany-=1
					sleep(3)
			if(whichone=="big")
				while(howmany)
					var/obj/jutsu/c2mine/mine/A=new()
					A.power=(src.nin*0.70)
					A.owner=src.owner;A.loc=src.loc
					A.dir=src.dir
					A.density=1
					spawn(1)
						walk(A,pick(SOUTH,EAST,WEST,SOUTHEAST,SOUTHWEST),3,16)
					howmany-=1
					sleep(3)

		birdmake()
			var/whichone=pick("c1","c2","custom")
			src.icon_state = "mouth open"
			var/howmany=rand(2,10)
			if(whichone=="c1")
				while(howmany)
					var/obj/jutsu/c1/bird/A=new()
					A.power=(src.nin*0.30)
					A.owner=src.owner;A.loc=src.loc
					A.dir=pick(SOUTH,EAST,WEST,SOUTHEAST,SOUTHWEST)
					spawn(1)
						while(A)
							//A.dir=src.dir
							step(A,A.dir)
							if(src.target)
								if(prob(43))//was 45
									if(A)
										A.dir=get_dir(A,src.target)
							sleep(1.4)
					howmany-=1
					sleep(2)//was 5
			if(whichone=="c2")
				while(howmany)
					var/obj/jutsu/c2/bird/A=new()
					A.power=(src.nin*0.60)
					A.owner=src.owner;A.loc=src.loc
					A.dir=pick(SOUTH,EAST,WEST,SOUTHEAST,SOUTHWEST)
					spawn(1)
						while(A)
							//A.dir=src.dir
							step(A,A.dir)
							if(src.target)
								if(prob(43))//was 45
									if(A)
										A.dir=get_dir(A,src.target)
							sleep(1.6)
					howmany-=1
					sleep(2)//was 5
			if(whichone=="custom")
				while(howmany)
					var/obj/jutsu/dragonbird/A=new()
					A.power=(src.nin*0.75)
					A.owner=src.owner;A.loc=src.loc
					A.dir=pick(SOUTH,EAST,WEST,SOUTHEAST,SOUTHWEST)
					spawn(1)
						while(A)
							//A.dir=src.dir
							step(A,A.dir)
							if(src.target)
								if(prob(53))//was 45
									if(A)
										A.dir=get_dir(A,src.target)
							sleep(1.5)
					howmany-=1
					sleep(2)//was 5










