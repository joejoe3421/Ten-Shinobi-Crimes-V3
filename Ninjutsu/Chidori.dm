mob/var/tmp
	chidorion=0
	chidoricharge=0
	chidoriD=0
	chidoritype=0



mob
	teacher
		chidoriteacher
			//human = 1
			density=1
			//NPC = 1
			name="Kakashi Hatake"
			icon='Guy.dmi'
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='KakashiH.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(180,180,180)
					var/Shirt='cvest.dmi'
					Shirt+=rgb(61,100,60)
					src.icon=Base
					src.overlays+='Boxers.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+='pants.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+='LeafJounin.dmi'
					src.overlays+='kakashi mask.dmi'
					src.overlays+=Shirt
					src.overlays+=Hair
					src.overlays+='Icons/New Base/Clothing/Headbands/KakashiHeadband.dmi'
					//src.overlays+='headband.dmi'
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr.ninknowledge>=30)
					if(usr.raitonknowledge>=50)
						cl+="Chidori"
					if("Chidori" in usr.jutsus&&usr.Mnin>500)
						if(usr.raitonknowledge>100&&"Raiton Current" in usr.jutsus)
							cl+="Chidori Nagashi"
						if(usr.raitonknowledge>=150&&usr.element=="Raiton")
							cl+="Chidori Spear"
						if(usr.raitonknowledge>=205&&"Chidori Spear" in usr.jutsus&&usr.element=="Raiton")
							cl+="Chidori Senbon"
					if("Chidori" in usr.jutsus&&usr.raitonknowledge>=400&&usr.element=="Raiton"&&usr.Mnin>300)
						cl+="Raikiri"
					if("Raikiri" in usr.jutsus&&usr.raitonknowledge>=650&&usr.Mnin>400)
						cl+="Raiton Wolf"
					if("Chidori" in usr.jutsus&&usr.raitonknowledge>=1250&&usr.element=="Raiton"&&usr.hasraiton>=1&&usr.Mnin>750)
						cl+="Kirin"
				oview(src)<<"[src] Says: Hm?"
				var/T = input("What to learn?","[src]") in list("Nothing") + cl
				if(T=="Nothing")
					return
				if(T=="Chidori")
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
					else
						usr.contents += new /obj/skill/chidori
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
				else if(T=="Chidori Nagashi")
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
					else
						usr.contents += new /obj/skill/chidorinagashi
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
				else if(T=="Raikiri")
					if(T in usr.jutsus)
						oview(src)<<"[src] Says: You already know this technique."
					else
						usr.contents += new /obj/skill/raikiri
						oview(src)<<"[src] teaches [usr] the [T]."
						usr.jutsus += T
				else
					oview(src)<<"[src] Says: Sorry, I cant teach you that at this time."














obj
	skill
		chidori
			verb
				chidori()
					set category = "Skills"
					set name = "Chidori"
					if(usr.rasenganon)
						usr<<"Not while Rasengan is active."
						return
					if(src.cooldown)
						usr<<"You must wait [src.cooldown] seconds before you can use this again."
						return
					if(usr.handseal(20,0))
						src.cooldown=90
						spawn(1)
							while(src.cooldown)
								if(src)
									src.cooldown-=1
								sleep(10)
						spawn(1)
							usr.rincrease(1)
						usr<<"Hold down Z to charge your Chidori!";usr.chidoricharge=1;usr.chidorion=1;usr.chidoritype=1
						var/A='Icons/Jutsus/Chidori.dmi';usr.overlays-=A;usr.overlays+=A;flick("Power",A)
						while(usr.chidorion)
							view(3,usr)<< sound('SFX/LightningSFX.wav',0,0,volume=15)
							if(!usr.chidoricharge)
								usr.chidoriD-=10
								//usr.icon_state="weapon"
								//for(var/obj/Jutsu/Kiriame/S2 in src.loc)
									//src.RasenganD=0
								if(usr.chidoriD<=0||usr.ko>0)
									usr.overlays-='Icons/Jutsus/Chidori.dmi';usr<<"Your Chidori ran out of energy!";usr.chidorion=0
							sleep(6)
						usr.chidoriD=0
						usr.chidoricharge=0
						usr.overlays-='Icons/Jutsus/Chidori.dmi'
		raikiri//giant rasengan
			verb
				raikiri()
					set category = "Skills"
					set name = "Raikiri"
					if(usr.chidorion<=0)
						usr<<"You need to use Chidori first."
						return
					if(usr.chidoritype>1)
						usr<<"You can only do this with regular chidori."
						return
					if(src.cooldown)
						usr<<"You must wait [src.cooldown] seconds before you can use this again."
						return
					if(usr.handseal(200,0))
						src.cooldown=30
						spawn(1)
							while(src.cooldown)
								if(src)
									src.cooldown-=1
								sleep(10)
						spawn(1)
							usr.rincrease(1.5)
						usr<<"You force your chakra into the chidori focing it into a Raikiri."
						usr.chidoritype=2