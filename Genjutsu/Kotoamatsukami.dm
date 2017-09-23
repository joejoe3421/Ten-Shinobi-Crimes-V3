obj/koto
	move1
		icon='Skillcards.dmi'
		icon_state="RapidStrike"
		layer = MOB_LAYER+9001
		screen_loc="1,2"
		Click()
			if(src.cooldown<=0)
				src.cooldown=10
				spawn(1)
					while(src.cooldown)
						if(src)
							src.cooldown-=1
						sleep(10)
				usr.kotogen1()
			else
				usr<<"This skill is on cooldown."
	move2
		icon='Skilltree.dmi'
		icon_state="Kasegui"
		layer = MOB_LAYER+9001
		screen_loc="2,2"
		Click()
			if(src.cooldown<=0)
				src.cooldown=35
				spawn(1)
					while(src.cooldown)
						if(src)
							src.cooldown-=1
						sleep(10)
				usr.kotogen2()
			else
				usr<<"This skill is on cooldown."
	move3
		icon='Skillcards.dmi'
		icon_state="FireMode"
		layer = MOB_LAYER+9001
		screen_loc="3,2"
		Click()
			if(src.cooldown<=0)
				src.cooldown=25
				spawn(1)
					while(src.cooldown)
						if(src)
							src.cooldown-=1
						sleep(10)
				usr.kotogen3()
			else
				usr<<"This skill is on cooldown."
	move4
		icon='Skilltree.dmi'//when they think they hear something but don't, a genjutsu
		icon_state="SuperHearing"
		layer = MOB_LAYER+9001
		screen_loc="4,2"
		Click()
			usr.kotogen4()
	move5//fake explode
		icon='Skilltree.dmi'
		icon_state="ExplosiveMastery"
		layer = MOB_LAYER+9001
		screen_loc="5,2"
		Click()
			if(src.cooldown<=0)
				src.cooldown=30
				spawn(1)
					while(src.cooldown)
						if(src)
							src.cooldown-=1
						sleep(10)
				usr.kotogen5()
			else
				usr<<"This skill is on cooldown."
	move6
		icon='Skillcards.dmi'//mess with their screen direction for a short time
		icon_state="GyakuBijon"
		layer = MOB_LAYER+9001
		screen_loc="1,3"
		Click()
			/*if(usr.Pill!="")
				usr.Pill=""
				usr<<"You stop the effects of the pill."*/
	move7
		icon='Skillcards.dmi'//make a person in game but a fake
		icon_state="Bunshin"
		layer = MOB_LAYER+9001
		screen_loc="1,4"
		Click()
			var/ty=list()
			for(var/mob/Y in world)
				ty+=Y
			var/mob/M = input("Who do you want to create?","Creation") in ty + list("Cancel")
			if(M=="Cancel")
				return
			usr.kotogen7(M)
	move8
		icon='Skillcards.dmi'//when they think they hear something but don't, a genjutsu
		icon_state="SuperHearing"
		layer = MOB_LAYER+9001
		screen_loc="1,5"
		Click()
			/*if(usr.Pill!="")
				usr.Pill=""
				usr<<"You stop the effects of the pill."*/
	move9
		icon='Skillcards.dmi'//warp their minds to different maps and make it as if they were moved but their real bodies weren't
		icon_state="ZeroVoidBarrier"
		layer = MOB_LAYER+9001
		screen_loc="1,6"
		Click()
			/*if(usr.Pill!="")
				usr.Pill=""
				usr<<"You stop the effects of the pill."*/
	move10
		icon='Skillcards.dmi'//illusionary amaterasu
		icon_state="Amaterasu"
		layer = MOB_LAYER+9001
		screen_loc="1,7"
		Click()
			/*if(usr.Pill!="")
				usr.Pill=""
				usr<<"You stop the effects of the pill."*/


mob
	var
		tmp/inkoto=list()

obj
	skill
		shisui//for the ones who get amaterasu etc
			mangekyou1
				verb
					kotoAmat()
						set category = "Doujutsu"
						set name = "Kotoamatsukami"
						if(usr.mshar<=0)
							usr<<"You need to activate the mangekyou sharingan first."
							return
						if(src.cooldown-world.time>=0)
							usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
							return
						src.cooldown=world.time+1500
						if(usr.handseal(600,0))//600 chakra
							usr.usekoto()
mob
	proc
		usekoto()
			src.blindness+=20
			src<<"You activate Kotoamatsukami."
			src.client.screen+=new/obj/koto/move1
			src.client.screen+=new/obj/koto/move2
			src.client.screen+=new/obj/koto/move3
			src.client.screen+=new/obj/koto/move4
			src.client.screen+=new/obj/koto/move5
			src.client.screen+=new/obj/koto/move6
			src.client.screen+=new/obj/koto/move7
			src.client.screen+=new/obj/koto/move8
			src.client.screen+=new/obj/koto/move9
			src.client.screen+=new/obj/koto/move10
			sleep(1200)
			for(var/obj/koto/T in src.client.screen)
				del T
				sleep(1)
			src<<"Kotoamatsukami wears off."






mob
	proc
		kotogen1()//hit
			src<<"You cast a Cutting Genjutsu."
			for(var/mob/M in oview(src))
				if(M.ko<=0&&M.owner!=src)
					var/num=rand(2,3)
					spawn(1)
						while(M&&num>0)
							if(prob(45))
								M<<"[src] slashes you!"
							M.gendamage((src.gen*0.10),src)
							M.koamm+=0.25
							M<<sound('SFX/Slice.wav',0)
							num-=1
							sleep(3)
						src<<"[M] was hurt by the genjutsu."
					sleep(10)
		kotogen2()//hit
			src<<"You cast the Chain Binding Genjutsu on a 3 tile radius."
			for(var/mob/M in oview(3,src))
				if(M.ko<=0&&M.owner!=src)
					var/num=(src.gen*5)/M.gen
					if(num<5)
						num=5
					if(num>30)
						num=30
					var/image/I = image('GenjutsuTechniques.dmi',M,"chain",MOB_LAYER+1)
					M << I
					M.bind+=1
					M.ingenjutsu=1
					spawn(1)
						while(M&&num>0)
							if(prob(20))
								M<<"The Chains get tighter."
								M.gendamage((src.gen*0.03),src)
								M.koamm+=0.10
							if(M.ko>0)
								num=0
							//M<<sound('SFX/Slice.wav',0)
							num-=1
							sleep(10)
						del I
						if(M)
							M.bind-=1
							M.ingenjutsu=0
						src<<"[M] was free'd from the genjutsu."
					sleep(10)
		kotogen3()
			src<<"You cast the Fire Genjutsu."
			for(var/mob/M in oview(src))
				if(M.ingenjutsu==0)
					if(M.ko<=0&&M.owner!=src)
						spawn(10)
							src<<"You set [M] on fire!"
							var/image/I = image('GenjutsuTechniques.dmi',M,"Fire",MOB_LAYER+1)
							M << I
							var/time=rand(5,7)
							while(M&&time>0)
								if(prob(3))
									M.Say("Ahh!")
								M.ingenjutsu=1
								step_rand(M)
								M.gendamage((src.gen*0.25),src)
								time-=1
								sleep(rand(5,10))
							del I
							if(M)
								M.ingenjutsu=0
				sleep(2)
		kotogen4()
			if(src.target)
				var/mob/M = src.target
				src<<"You cast a Mental Genjutsu on [M]."
				var/A=input(src,"What do you want to make those around you think that they are hearing?",) as text
				var/B=input(src,"Who is going to say it?",) as text
				M<<"<font face=trebuchet MS><b><font color=red>[B] Says:<font color=white> [A]"
				src<<"<font face=trebuchet MS><b><font color=red>[B] Says:<font color=white> [A]"
			else
				src<<"You need a target!"
		kotogen5()
			src<<"You cast the Explosion Genjutsu."
			for(var/mob/M in oview(src))
				if(M&&M.ko<=0&&M.owner!=src)
					spawn(10)
						src<<"[M] Exploded!"
						var/image/I = image('Explosion(1).dmi',M,"Explode",MOB_LAYER+1)
						M << I
						step_rand(M)
						if(M)
							M.gendamage((src.gen*2.50),src)
						M<<"You Suddenly Explode?!"
						if(prob(5))
							if(M&&M.client)
								M.Say("What the F***?!?!")
				sleep(rand(5,30))
		kotogen7(mob/A)
			var/mob/npc/PathBody/M=new()
			M.name=A.name;M.icon=A.icon;M.overlays=A.overlays;M.owner=src;M.health=1000;M.density=1
			M.x=src.x-1;M.y=src.y;M.z=src.z
			M.delonko=1
			M.delme(1800)
			src<<"You alter reality to create a copy of [A.name]."




mob
	proc
		delme(time)
			spawn(1)
				sleep(time)
				if(src)
					del src