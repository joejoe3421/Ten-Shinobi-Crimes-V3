
mob
	teacher
		hyuugateacher
			//human = 1
			density=1
			//NPC = 1
			name="Ryoku Hyuuga"
			icon='Guy.dmi'
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				.=..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='MadaraH.dmi'
					var/Shirt='Shirt.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(0,0,0)
					Shirt+=rgb(0,0,0)
					src.icon=Base
					src.overlays+='Boxers.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays+='BEyes.dmi'
					src.overlays+=Shirt
					src.overlays+='pants.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+='LeafJounin.dmi'
					src.overlays+=Hair
					src.overlays+='NejiHB.dmi'
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr.clan=="Hyuuga")
					if(usr.byaM>=0)
						cl+="Rotation"
					if(usr.byaM>=10&&usr.attackdelay<3.7)
						cl+="Gentle Fist"
					if(usr.byaM>=50&&usr.attackdelay<3.2&&"Gentle Fist" in usr.jutsus)
						cl+="64 Palms"
					if(usr.byaM>=120&&"Gentle Fist" in usr.jutsus)
						cl+="Air Palm"
					if(usr.byaM>=300&&usr.attackdelay<1.2&&"64 Palms" in usr.jutsus)
						cl+="Eight Gates Assult"
					if(usr.byaM>=280&&usr.attackdelay<2&&"64 Palms" in usr.jutsus)
						cl+="128 Palms"
				oview(src)<<"[src] Says: The Hyuuga Clan is a very respectful clan."
				sleep(3)
				if(usr.clan=="Hyuuga")
					oview(src)<<"[src] Says: Ah, I see you're a Hyuuga! Well what would you like to learn?"
					var/T = input("What to learn?","[src]") in list("Nothing") + cl
					if(T=="Nothing")
						return
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
						return
					if(T=="Gentle Fist")
						usr.contents += new /obj/skill/gentlefist
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
					else if(T=="64 Palms")
						usr.contents += new /obj/skill/sixtyfourpalms
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
					else if(T=="Water Dragon")
						usr.contents += new /obj/skill/suiton3
						oview(src)<<"[src] teaches [usr] the [T] jutsu."
						usr.jutsus += T
					else
						oview(src)<<"[src] Says: Hmmm.... i've recived word not to teach anyone that for the time being."


















obj
	hyuuga
		byakugan
			icon = 'HyuugaClan.dmi'
			icon_state = "Byakugon"
			layer = FLOAT_LAYER
			pixel_x = 16
			pixel_y = 18

mob
	var
		tmp/bya=0
		byaM=0
		tmp/delaydown=0
		tmp/dodgeplus=0

obj/skill
	byakugan
		verb
			byakugan()
				set category = "Doujutsu"
				set name = "Byakugan"
				if(src.cooldown-world.time>=0)
					usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
					return
					src.cooldown=world.time+100
				if(usr.handseal(10,1))
					if(usr.bya)
						usr<<"You relax your Byakugan."//;usr.ChangeEyeStyle(usr.EyeStyle,usr.reye,usr.geye,usr.beye);usr.shari=0;usr.IlluminateOff();usr.GenjutsuCounterMode=0;usr.SharCounter=0;usr.CopyMode=0;usr.ChakraSight(0);return
						usr.nin=usr.Mnin
						usr.gen=usr.Mgen
						usr.tai=usr.Mtai
						usr.bya=0
						usr.attackdelay+=usr.delaydown//do same for dodge rate
						usr.dodgerate-=usr.dodgeplus
						usr.delaydown=0
						usr.dodgeplus=0
					else
						if(!usr.bya)
							usr.style="Jyuken"
							//usr.AwardMedal("Byakugan!!!")
							if(usr.byaM==0)
								usr.AwardMedal("Byakugan!!!")
							if(usr.byaM<1000)
								oview(usr)<<"[usr]'s eyes become focused!"
								usr<<"You use Byakugan!"
								spawn(1)
									var/obj/hyuuga/byakugan/A = new()
									usr.overlays += A
									sleep(15)
									usr.overlays -= A
								usr.tai+=usr.tai*0.03
								usr.dodgerate+=0.12
								usr.attackdelay-=0.3
								usr.dodgeplus+=0.12
								usr.delaydown+=0.3
							if(usr.byaM>1000)
								view()<<"[usr]'s eyes shine with intesity!"
								spawn(1)
									var/obj/hyuuga/byakugan/A = new()
									usr.overlays += A
									sleep(15)
									usr.overlays -= A
									//usr.byakucreate()
									//client.addbyakugan()
									//client.byakuganupdate()
								usr.tai+=usr.tai*0.05
								usr.dodgerate+=0.4
								usr.attackdelay-=0.6
								usr.delaydown+=0.6
								usr.dodgeplus+=0.4
							if(usr.byaM>=200)
								usr<<"You can see through taijutsu techniques easily!"//;usr.SharCounter=2
								usr.tai+=usr.Mtai*0.02
								usr.dodgerate+=0.2
								usr.attackdelay-=0.4
								usr.delaydown+=0.4
								usr.dodgeplus+=0.2
							usr.bya=1
							spawn(1)
								while(usr.bya)
									var/A=usr.byaM
									if(A<1) A=1
									var/ChakraDrain=(usr.Mchakra/(A*23))
									if(ChakraDrain>45)
										ChakraDrain=45
									usr.chakra-=ChakraDrain
									if(prob(2))
										usr.byaM+=pick(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
										//usr.clanL()
									sleep(28)


obj/sixtyfour
	icon='64strikes.dmi'
	name=""
	layer=TURF_LAYER
	invisibility=0
	pixel_x=-1
	pixel_y=-5
	New()
		..()
		spawn(1200)
			if(src)
				del src
obj/onetwentyeight
	icon='128strikes.dmi'
	name=""
	layer=TURF_LAYER
	invisibility=0
	pixel_x=-1
	pixel_y=-5
	New()
		..()
		spawn(1200)
			if(src)
				del src



mob
	proc
		strikeblow(var/mob/M,var/damage)
			//M.clothingboosts(src,1)
			//if(village=="Leaf"&&leafpriority=="Aggressiveness"||village=="Sand"&&sandpriority=="Aggressiveness"||village=="Sound"&&soundpriority=="Aggressiveness")damage=round(damage*1.15)
			flick("jyuken",src)
			//M.moving=0
			if(damage<0)
				damage=0
			if(M)
				src.loc=M.loc
			step_rand(src)
			step_rand(src)
			//M.moving=0
			if(M)
				step_towards(src,M)
				src.dir=get_dir(src,M)
			if(prob(round(25*(4-src.attackdelay))))
				src.palmeffect()
				M.chakra-=round(damage*0.90)
				spawn(1)
					view(src)<< sound('JyukenClash.wav',0,0,volume=40)
			if(M)
				M.taidamage(damage*0.40,0,src)
				//M.chakra-=round(damage*0.80)
		strikeblow2(var/mob/M,var/damage)
			if(M)
				//M.clothingboosts(src,1)
				//if(village=="Leaf"&&leafpriority=="Aggressiveness"||village=="Sand"&&sandpriority=="Aggressiveness"||village=="Sound"&&soundpriority=="Aggressiveness")damage=round(damage*1.15)
				flick("jyuken",src)
				//M.moving=0
				if(damage<0)
					damage=0
				//M.moving=0
				src.dir=get_dir(src,M)
				if(prob(round(13*(4-src.attackdelay))))
					src.palmeffect()
					M.chakra-=round(damage*0.75)
					spawn(1)
						view(src)<< sound('JyukenClash.wav',0,0,volume=40)
				M.taidamage(damage*0.40,0,src)
				//M.chakra-=round(damage*0.65)
		ring64create()
			var/C=0
			var/X=0
			var/Y=0
			while(C<155)
				sleep(-1)//was -1
				if(X>16)
					X=0
					Y++
				var/obj/sixtyfour/A=new
				A.owner=src
				if(X>16)X=16
				if(Y>16)Y=16
				A.loc=locate(x+(X-4),y+(Y-4),z)
				A.icon_state="[X],[Y]"
				X++
				C++
		ring128create()
			var/C=0
			var/X=0
			var/Y=0
			while(C<205)
				sleep(-1)//was -1
				if(X>16)
					X=0
					Y++
				var/obj/onetwentyeight/A=new
				A.owner=src
				if(X>16)X=16
				if(Y>16)Y=16
				A.loc=locate(x+(X-4),y+(Y-4),z)
				A.icon_state="[X],[Y]"
				X++
				C++




obj
	skill
		gentlefist
			verb
				gf()
					set category = "Skills"
					set name = "Gentle Fist"
					if(usr.bya<=0)
						usr<<"You need to turn on byakugan first."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+750
					if(usr.handseal(350,0))
						usr.Frozen=1
						usr.ring64create()
						var/L=1
						if(usr.attackdelay<=4)L++
						if(usr.attackdelay<=3)L++
						if(usr.attackdelay<=2)L++
						var/Cdelay=15
						if(L>=2)Cdelay-=5
						if(L==4)Cdelay-=3
						view(8)<<"<b><font color=aqua>[usr]: Eight Trigrams..."
						sleep(Cdelay)
						view(8)<<"<b><font color=aqua>[usr]: Gentle Fist!"
						if(usr.target&&get_dist(usr,usr.target)<=3)
							var/mob/TY = usr.target
							TY.bind+=1
						else
							for(var/mob/A in view(3,usr))
								if(A!=usr&&A.owner!=usr)
									A.bind+=1
						sleep(5)
						//icon_state=""
						var/strikes=0
						var/view=list()
						if(usr.target&&get_dist(usr,usr.target)<=3)
							view+=usr.target
						else
							for(var/mob/A in view(3,usr))
								if(A!=usr&&A.owner!=usr)
									view+=A
						usr.Frozen=0
						var/Y=0
						for(var/mob/A in view)
							Y=1
						if(Y==0)goto skip
						var/OL=usr.loc
						/////////////////////////////////////////////////////////////////////////
						var/damage=usr.tai*0.01
						var/mob/T=pick(view)
						view(8)<<"<b><font color=aqua>[usr]: Two Palms!"
						strikes=2
						while(strikes>0)
							T=pick(view)
							//var/damage=usr.tai*0.50
							if(damage<1)damage=1
							usr.strikeblow(T,damage)
							/*spawn(3)
							if(L>2)
								T=pick(view)
								if(damage<1)damage=1
								usr.strikeblow(T,damage)*/
							strikes-=1
							sleep(usr.attackdelay)
						sleep(5)
						/////////////////////////////////////////////////////////////////////////
						view(8)<<"<b><font color=aqua>[usr]: Four Palms!"
						if(view==null||usr.ko>0)goto skip
						strikes=2
						while(strikes>0)
							T=pick(view)
							if(damage<1)damage=1
							usr.strikeblow(T,damage)
							strikes-=1
							sleep(usr.attackdelay)
						view(8)<<"<b><font color=aqua>[usr]: Eight Palms!"
						if(view==null||usr.ko>0)goto skip
						strikes=4
						while(strikes>0)
							T=pick(view)
							if(damage<1)damage=1
							usr.strikeblow(T,damage)
							strikes-=1
							sleep(usr.attackdelay)
						/////////////////////////////////////////////////////////////////////////
						sleep(5)
						/////////////////////////////////////////////////////////////////////////
						view(8)<<"<b><font color=aqua>[usr]: Sixteen Palms!"
						if(view==null||usr.ko>0)goto skip
						strikes=8
						while(strikes>0)
							T=pick(view)
							if(damage<1)damage=1
							usr.strikeblow(T,damage)
							strikes-=1
							sleep(usr.attackdelay)
						usr.loc=OL
						if(L>=4)
							view(8)<<"<b><font color=aqua>[usr]: Not yet!"
						sleep(20)
						if(L>=4)//make this a 3
							view(8)<<"<b><font color=aqua>[usr]: Thirty Two Palms!"
							if(view==null||usr.ko>0)goto skip
							strikes=16
							while(strikes>0)
								T=pick(view)
								if(damage<1)damage=1
								usr.strikeblow(T,damage)
								strikes-=1
								sleep(usr.attackdelay)
						spawn(3)
						if(T)
							T.stepback2(2,usr.dir)
						sleep(5)
						usr.loc=OL
						for(var/mob/M in view)
							M.bind-=1
						skip
						usr<<"Gentle Fist ends."
						usr.Frozen=0
						/*spawn(250)
							usr.inpalms=0
						if(prob(75))
							usr.palmM+=rand(0.25,0.6)
							usr.clanL()*/
						for(var/obj/sixtyfour/K in world)if(K.owner==usr)del K

obj
	skill
		sixtyfourpalms
			verb
				sixtyfourpalms()
					set category = "Skills"
					set name = "64 Palms"
					if(usr.bya<=0)
						usr<<"You need to turn on byakugan first."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+750
					if(usr.handseal(350,0))
						usr.Frozen=1
						usr.ring64create()
						var/L=1
						if(usr.attackdelay<=4)L++
						if(usr.attackdelay<=3)L++
						if(usr.attackdelay<=2)L++
						var/Cdelay=15
						if(L>=2)Cdelay-=5
						if(L==4)Cdelay-=3
						view(8)<<"<b><font color=aqua>[usr]: Eight Trigrams..."
						sleep(Cdelay)
						//view(8)<<"<b><font color=aqua>[usr]: Gentle Fist!"
						if(usr.target&&get_dist(usr,usr.target)<=3)
							var/mob/TY = usr.target
							TY.bind+=1
						else
							for(var/mob/A in view(3,usr))
								if(A!=usr&&A.owner!=usr)
									A.bind+=1
						sleep(5)
						//icon_state=""
						var/strikes=0
						var/view=list()
						if(usr.target&&get_dist(usr,usr.target)<=3)
							view+=usr.target
						else
							for(var/mob/A in view(3,usr))
								if(A!=usr&&A.owner!=usr)
									view+=A
						usr.Frozen=0
						var/Y=0
						for(var/mob/A in view)
							Y=1
						if(Y==0)goto skip
						var/OL=usr.loc
						/////////////////////////////////////////////////////////////////////////
						var/damage=usr.tai*0.05
						var/mob/T=pick(view)
						view(8)<<"<b><font color=aqua>[usr]: Two Palms!"
						strikes=2
						while(strikes>0)
							T=pick(view)
							//var/damage=usr.tai*0.50
							if(damage<1)damage=1
							usr.strikeblow(T,damage)
							/*spawn(3)
							if(L>2)
								T=pick(view)
								if(damage<1)damage=1
								usr.strikeblow(T,damage)*/
							strikes-=1
							sleep(usr.attackdelay)
						sleep(5)
						/////////////////////////////////////////////////////////////////////////
						view(8)<<"<b><font color=aqua>[usr]: Four Palms!"
						if(view==null||usr.ko>0)goto skip
						strikes=2
						while(strikes>0)
							T=pick(view)
							if(damage<1)damage=1
							usr.strikeblow(T,damage)
							strikes-=1
							sleep(usr.attackdelay)
						view(8)<<"<b><font color=aqua>[usr]: Eight Palms!"
						if(view==null)goto skip
						strikes=4
						while(strikes>0)
							T=pick(view)
							if(damage<1)damage=1
							usr.strikeblow(T,damage)
							strikes-=1
							sleep(usr.attackdelay)
						/////////////////////////////////////////////////////////////////////////
						sleep(5)
						/////////////////////////////////////////////////////////////////////////
						view(8)<<"<b><font color=aqua>[usr]: Sixteen Palms!"
						if(view==null||usr.ko>0)goto skip
						strikes=8
						while(strikes>0)
							T=pick(view)
							if(damage<1)damage=1
							usr.strikeblow(T,damage)
							strikes-=1
							sleep(usr.attackdelay)
						//usr.loc=OL
						view(8)<<"<b><font color=aqua>[usr]: Thirty Two Palms!"
						if(view==null)goto skip
						strikes=16
						while(strikes>0)
							T=pick(view)
							if(damage<1)damage=1
							usr.strikeblow(T,damage)
							strikes-=1
							sleep(usr.attackdelay)
						view(8)<<"<b><font color=aqua>[usr]:Eight Trigrams Sixty Four Palms!"
						if(view==null||usr.ko>0)goto skip
						strikes=32
						while(strikes>0)
							T=pick(view)
							if(damage<1)damage=1
							usr.strikeblow(T,damage)
							strikes-=1
							sleep(usr.attackdelay)
						spawn(3)
						T.stepback2(2,usr.dir)
						sleep(5)
						usr.loc=OL
						for(var/mob/M in view)
							M.bind-=1
						skip
						usr<<"64 palms end."
						usr.Frozen=0
						/*spawn(250)
							usr.inpalms=0
						if(prob(75))
							usr.palmM+=rand(0.25,0.6)
							usr.clanL()*/
						for(var/obj/sixtyfour/K in world)if(K.owner==usr)del K






/*
mob/hyuuga
	verb
		gentlefist()
			set category = "Skills"
			if(usr.inpalms)
				usr<<"You need to wait to use this again!"
				return
			if(!usr.bya)
				return
			if(!usr.dead&&!usr.Frozen)
				usr.inpalms=1
				//prejutsu()
				//handseals(100,0,1)
			//if(!sealpass)return
				//cdelay4=1
			//for(var/obj/jutsu/hyuuga/One_Twenty_Eight_Palms/M in src)M.overlays+='timer.dmi'
				//for(var/obj/jutsu/hyuuga/Sixty_Four_Palms/M in src)M.overlays+='timer.dmi'
					//buttonjam=1
					//busy="addled"
				//usr.icon_state="trigram"
				ring64create()
				var/L=1
				if(Mtai>=20&&rush>=5)L++
				if(Mtai>=40&&rush>=10)L++
				if(Mtai>=80&&rush>=15)L++
				var/Cdelay=15
				if(L>=2)Cdelay-=5
				if(L==4)Cdelay-=3
				view(8)<<"<b><font color=aqua>[usr]: Eight Trigrams..."
				sleep(Cdelay)
				view(8)<<"<b><font color=aqua>[usr]: Gentle Fist!"
				for(var/mob/M in oview(3))
					if(!M.caught)//continue
						M.caught=1
						M.caughtby=usr
				sleep(5)
				//icon_state=""
				var/list/view=view(3,usr)
				for(var/atom/A in view)if(!ismob(A))view-=A
				for(var/mob/A in view)if(A.caughtby!=usr)view-=A
				var/Y=0
				for(var/mob/A in view)
					Y=1
				if(Y==0)goto skip
				var/OL=loc
				/////////////////////////////////////////////////////////////////////////
				view(8)<<"<b><font color=aqua>[usr]: Two Palms!"
				var/target=pick(view)
				var/damage=round((tai/3-(round(target:tai/3)))/2)+2
				//if(village=="Leaf"&&leafpriority=="Aggressiveness"||village=="Sand"&&sandpriority=="Aggressiveness"||village=="Sound"&&soundpriority=="Aggressiveness")damage=round(damage*1.15)
				//if(skillstrplus)damage=round(damage*(1.11+(0.03*(skillstrplus-1))))
				if(damage<1)damage=1
				target:punchanimation()
				new/obj/hit(target:loc)
				target:strikeblow(usr,damage)
				//target:health-=damage
				spawn(3)
				if(L>2)
					target=pick(view)
					damage=round((tai/3-(round(target:tai/3)))/2)+2
					//if(village=="Leaf"&&leafpriority=="Aggressiveness"||village=="Sand"&&sandpriority=="Aggressiveness"||village=="Sound"&&soundpriority=="Aggressiveness")damage=round(damage*1.15)
					//if(skillstrplus)damage=round(damage*(1.11+(0.03*(skillstrplus-1))))
					if(damage<1)damage=1
					target:punchanimation()
					new/obj/hit(target:loc)
					target:strikeblow(usr,damage)
					//target:health-=damage
				sleep(5)
				/////////////////////////////////////////////////////////////////////////
				view(8)<<"<b><font color=aqua>[usr]: Four Palms!"
				if(view==null)goto skip
				target=pick(view)
				damage=round((tai/3-(round(target:tai/3)))/2)+4
				//if(skillstrplus)damage=round(damage*(1.11+(0.03*(skillstrplus-1))))
				//if(village=="Leaf"&&leafpriority=="Aggressiveness"||village=="Sand"&&sandpriority=="Aggressiveness"||village=="Sound"&&soundpriority=="Aggressiveness")damage=round(damage*1.15)
				if(damage<1)damage=1
				target:punchanimation()
				new/obj/hit(target:loc)
				target:strikeblow(usr,damage)
				view(8)<<"<b><font color=aqua>[usr]: Eight Palms!"
				if(view==null)goto skip
				target=pick(view)
				if(L>1)
					target=pick(view)
					damage=round((tai/3-(round(target:tai/3)))/1,5)+6
					//if(skillstrplus)damage=round(damage*(1.11+(0.03*(skillstrplus-1))))
					//if(village=="Leaf"&&leafpriority=="Aggressiveness"||village=="Sand"&&sandpriority=="Aggressiveness"||village=="Sound"&&soundpriority=="Aggressiveness")damage=round(damage*1.15)
					if(damage<1)damage=1
					target:punchanimation()
					new/obj/hit(target:loc)
					target:strikeblow(usr,damage)
				/////////////////////////////////////////////////////////////////////////s
				sleep(5)
				/////////////////////////////////////////////////////////////////////////
				view(8)<<"<b><font color=aqua>[usr]: Sixteen Palms!"
				if(view==null)goto skip
				target=pick(view)
				damage=round((tai/3-(round(target:tai/3)))/1)+8
				//if(skillstrplus)damage=round(damage*(1.11+(0.03*(skillstrplus-1))))
				//if(village=="Leaf"&&leafpriority=="Aggressiveness"||village=="Sand"&&sandpriority=="Aggressiveness"||village=="Sound"&&soundpriority=="Aggressiveness")damage=round(damage*1.15)
				if(damage<1)damage=1
				target:punchanimation()
				new/obj/hit(target:loc)
				target:strikeblow(usr,damage)
				spawn(3)
				//if(L>3)
					//target=pick(view)
					//damage=round((tai/3-(round(target:tai/3)))/1.5)+8
					//if(damage<1)damage=1
					//target:punchanimation()
					//new/obj/hit(target:loc)
					//target:strikeblow(usr,damage)
					//target=pick(view)
					//damage=round((tai/1.5-(round(target:tai/3)))*2.2)+25
					//if(skillstrplus)damage=round(damage*(1.11+(0.03*(skillstrplus-1))))
					//if(village=="Leaf"&&leafpriority=="Aggressiveness"||village=="Sand"&&sandpriority=="Aggressiveness"||village=="Sound"&&soundpriority=="Aggressiveness")damage=round(damage*1.15)
					//if(damage<1)damage=1
					//target:punchanimation()
					//new/obj/hit(target:loc)
					//new/obj/crater(target:loc)
					//target:strikeblow(usr,damage)
				target:stepback(2)
				sleep(5)
				loc=OL
				for(var/mob/M in view)
					M.caughtby=null
					M.caught=0
					spawn(1)
						M.pseal(usr.palmM)
					M.Death(usr)
				skip
				usr<<"Gentle Fist ends."
				spawn(250)
					usr.inpalms=0
				if(prob(75))
					usr.palmM+=rand(0.25,0.6)
					usr.clanL()
				for(var/obj/sixtyfour/K in world)if(K.owner==usr)del K
*/