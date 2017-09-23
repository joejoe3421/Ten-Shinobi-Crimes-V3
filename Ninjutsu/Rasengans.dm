mob/var/tmp
	rasenganon=0
	rasengancharge=0
	rasenganD=0
	rasengantype=0




mob
	teacher
		rasenganteacher
			//human = 1
			density=1
			//NPC = 1
			name="Yugo Uzumaki"
			icon='Guy.dmi'
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(1,50))
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='RyuzakiH.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(200,200,0)
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
				if(usr.ninknowledge>=10)//was 10
					if(usr.clan=="Uzumaki"&&usr.ninknowledge>=75)
						cl+="Shadow Clone"
					if(usr.ninknowledge>=500)//usr.clan=="Uzumaki"&&usr.ninknowledge>=75)//was 500
						cl+="Shadow Clone"
					if(usr.clan=="Uzumaki"&&usr.ninknowledge>=100&&"Shadow Clone" in usr.jutsus)//was 100
						cl+="Rasengan"
					if(usr.ninknowledge>=200)//was 200
						cl+="Rasengan"
					if(usr.Mchakra>=7000&&usr.ninknowledge>=350&&"Rasengan" in usr.jutsus)
						cl+="Giant Rasengan"
					if(usr.fuutonknowledge>=200&&"Rasengan" in usr.jutsus)
						cl+="Fuuton Rasengan"
				oview(src)<<"[src] Says: Yugo of the Uzumaki clan, at your service."
				var/T = input("What to learn?","[src]") in list("Nothing") + cl
				if(T=="Nothing")
					return
				if(T in usr.jutsus)
					oview(src)<<"[src] Says: You already know this technique."
					return
				if(T=="Rasengan")
					usr.contents += new /obj/skill/rasengan
					oview(src)<<"[src] teaches [usr] the [T]."
					usr.jutsus += T
				else if(T=="Shadow Clone")
					usr.contents += new /obj/skill/shadowclone
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Giant Rasengan")
					usr.contents += new /obj/skill/rasengan2
					oview(src)<<"[src] teaches [usr] the [T] jutsu."
					usr.jutsus += T
				else if(T=="Fuuton Rasengan")
					usr.contents += new /obj/skill/rasengan3
					oview(src)<<"[src] teaches [usr] the [T]."
					usr.jutsus += T
				else
					oview(src)<<"[src] Says: Sorry, I cant teach you that at this time."






obj
	skill
		rasengan
			verb
				rasen1()
					set category = "Skills"
					set name = "Rasengan"
					if(usr.chidorion)
						usr<<"Not while chidori is active."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+1200
					if(usr.handseal(20,0))
						spawn(1)
							usr.ninincrease(2)
						usr<<"Hold down Z to charge your Rasengan!";usr.rasengancharge=1;usr.rasenganon=1;usr.rasengantype=1
						var/A='Icons/Jutsus/Rasengan.dmi';usr.overlays-=A;usr.overlays+=A;flick("Power",A)
						while(usr.rasenganon)
							view(2,usr)<< sound('SFX/RasCharge.wav',0,0,volume=15)
							if(!usr.rasengancharge)
								usr.rasenganD-=10
								//for(var/obj/Jutsu/Kiriame/S2 in src.loc)
									//src.RasenganD=0
								if(usr.rasenganD<=0||usr.ko>0)
									usr.overlays-='Icons/Jutsus/Rasengan.dmi';usr<<"Your Rasengan ran out of energy!";usr.rasenganon=0
							sleep(8)
						usr.rasenganD=0
						usr.rasengancharge=0
						usr.overlays-='FuutonRasengan.dmi'
						usr.overlays-='Icons/Jutsus/Rasengan.dmi'
		rasengan2//giant rasengan
			verb
				rasen2()
					set category = "Skills"
					set name = "Giant-Rasengan"
					if(usr.rasenganon<=0)
						usr<<"You need to use rasengan first."
						return
					if(usr.rasengantype>1)
						usr<<"You can only do this with regular rasengan."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(200,0))
						spawn(1)
							usr.ninincrease(1)
						usr<<"You increase the chakra within the rasengan forcing it to grow in size."
						usr.rasengantype=2
		rasengan3//giant rasengan
			verb
				rasen3()
					set category = "Skills"
					set name = "Fuuton-Rasengan"
					if(usr.rasenganon<=0)
						usr<<"You need to use rasengan first."
						return
					if(usr.rasengantype>1)
						usr<<"You can only do this with regular rasengan."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+300
					if(usr.handseal(15,0))
						spawn(1)
							usr.fincrease(1)
						usr<<"You add some of your Fuuton elemental chakra to the rasengan."
						usr.rasengantype=3
						usr.overlays-='Rasengan.dmi'
						usr.overlays-='FuutonRasengan.dmi'
						usr.overlays+='FuutonRasengan.dmi'


mob
	proc
		rasenhit(mob/M)
			if(!M)
				return
			if(!src.rasenganon)
				return
			src.rasenganon=0
			//view() << "<i><font size = 2>[src] hit [M] with their Rasengan for [damage]!</font></i>"
			var/damage=src.rasenganD+(src.nin*0.05)
			if(damage>=6000&&src.sagemode)
				damage=6000
			else if(damage>=5000)
				damage=5000
			if(damage<0||M.ko)
				damage=0
			view() << "<i><font size = 2>[src] hit [M] with their Rasengan for [damage] damage!</font></i>"
			M.icon_state="rasenganhit"
			M.nindamage(damage,0,src)
			if(M.absorbing)
				damage=0
			src.rasenganD=0
			var/image/I = image('Rasengan.dmi',M,"overlay")
			for(var/mob/P in range(20,M))
				P << I
				spawn(25)
					var/image/Y = image('Rasengan.dmi',M,"explode")
					del(I)
					for(var/mob/G in range(20,M))
						G << Y
					spawn(10)
						del(Y)
			spawn(1)
				var/olddir=src.dir
				M.stepback2(rand(5,10),olddir)
			src.overlays-='Rasengan.dmi'
			src.rasenganon=0//;src.firing=0
			spawn(rand(50,100))
				//var/random=rand(1,5)
				if(!M)
					return
				if(damage>500)
					if(prob(20))
						viewers(M)<<"The rasengan did extensive damage to [M]!"
						M.koamm+=pick(damage*0.005,damage*0.0025,damage*0.003)
						M.alldamage(M.Mhealth*0.04,src)//takes 10% of their max health as extra damage
			return
		rasenhit2(mob/M)//giant rasengan
			if(!M)
				return
			if(!src.rasenganon)
				return
			src.rasenganon=0
			//view() << "<i><font size = 2>[src] hit [M] with their Rasengan for [damage]!</font></i>"
			var/damage=src.rasenganD+(src.nin*0.10)
			if(damage>=12000&&src.sagemode)
				damage=12000
			else if(damage>=10000)
				damage=10000
			if(damage<0||M.ko)
				damage=0
			view() << "<i><font size = 2>[src] hit [M] with their Rasengan for [damage] damage!</font></i>"
			M.icon_state="rasenganhit"
			M.nindamage(damage,0,src)
			if(M.absorbing)
				damage=0
			src.rasenganD=0
			var/image/I = image('Rasengan.dmi',M,"overlay")
			for(var/mob/P in range(20,M))
				P << I
				spawn(25)
					var/image/Y = image('Rasengan.dmi',M,"explode")
					del(I)
					for(var/mob/G in range(20,M))
						G << Y
					spawn(10)
						del(Y)
			spawn(1)
				var/olddir=src.dir
				M.stepback2(rand(7,13),olddir)
			src.overlays-='Rasengan.dmi'
			src.rasenganon=0//;src.firing=0
			spawn(rand(30,70))
				//var/random=rand(1,5)
				if(!M)
					return
				if(damage>2000)
					if(prob(10))
						viewers(M)<<"The rasengan did extensive damage to [M]!"
						M.koamm+=pick(damage*0.005,damage*0.0025,damage*0.003)
						M.alldamage(M.Mhealth*0.07,src)//takes 10% of their max health as extra damage
			return
		rasenhit3(mob/M)//fuuton rasengan
			if(!M)
				return
			if(!src.rasenganon)
				return
			src.rasenganon=0
			//view() << "<i><font size = 2>[src] hit [M] with their Rasengan for [damage]!</font></i>"
			var/damage=src.rasenganD+(src.fuutonknowledge*0.10)
			if(damage>=9000&&src.sagemode)
				damage=9000
			else if(damage>=7500)
				damage=7500
			if(damage<0||M.ko)
				damage=0
			view() << "<i><font size = 2>[src] hit [M] with their Rasengan for [damage] damage!</font></i>"
			M.icon_state="rasenganhit"
			M.nindamage(damage,0,src)
			if(M.absorbing)
				damage=0
			src.rasenganD=0
			var/image/I = image('FuutonRasengan.dmi',M,"overlay")
			for(var/mob/P in range(20,M))
				P << I
				spawn(25)
					var/image/Y = image('FuutonRasengan.dmi',M,"explode")
					del(I)
					for(var/mob/G in range(20,M))
						G << Y
					spawn(10)
						del(Y)
			spawn(1)
				var/olddir=src.dir
				M.stepback2(rand(10,16),olddir)
			src.overlays-='Rasengan.dmi'
			src.overlays-='FuutonRasengan.dmi'
			src.rasenganon=0//;src.firing=0
			spawn(rand(100,200))
				//var/random=rand(1,5)
				if(!M)
					return
				if(damage>3000)
					if(prob(15))
						viewers(M)<<"The rasengan did extensive damage to [M]!"
						M.koamm+=pick(damage*0.005,damage*0.0025,damage*0.003)
						M.alldamage(M.Mhealth*0.13,src)//takes 10% of their max health as extra damage
			return
		chidorihit(mob/M)
			if(!M)
				return
			if(!src.chidorion)
				return
			src.chidorion=0
			//view() << "<i><font size = 2>[src] hit [M] with their Rasengan for [damage]!</font></i>"
			var/damage=src.chidoriD+(src.nin*0.10)
			if(damage>=4000&&src.shari==0)
				damage=4000
			if(damage>=6000)
				damage=6000
			if(damage<0||M.ko)
				damage=0
			view() << "<i><font size = 2>[src] hit [M] with their Chidori for [damage] damage!</font></i>"
			M.nindamage(damage,0,src,"raiton")
			if(M.absorbing==0)
				M.koamm+=pick(damage*0.005,damage*0.0025,damage*0.003)
			src.chidoriD=0
			var/image/I = image('RaitonTechniques.dmi',M,"Nagashi")
			for(var/mob/P in range(20,M))
				P << I
				spawn(25)
					del(I)
			spawn(1)
				var/olddir=src.dir
				M.Blood()
				M.stepback2(rand(1,2),olddir)
			src.overlays-='Icons/Jutsus/Chidori.dmi'
			src.chidorion=0//;src.firing=0
			return
		raikirihit(mob/M)
			if(!M)
				return
			if(!src.chidorion)
				return
			src.chidorion=0
			//view() << "<i><font size = 2>[src] hit [M] with their Rasengan for [damage]!</font></i>"
			var/damage=src.chidoriD+(src.nin*0.10)
			if(damage>=6000&&src.shari==0)
				damage=6000
			if(damage>=8000)
				damage=8000
			if(damage<0||M.ko)
				damage=0
			view() << "<i><font size = 2>[src] hit [M] with their Raikiri for [damage] damage!</font></i>"
			M.nindamage(damage,0,src,"raiton")
			if(M.absorbing==0)
				M.koamm+=pick(damage*0.0075,damage*0.0045,damage*0.004)
			src.chidoriD=0
			var/image/I = image('RaitonTechniques.dmi',M,"Nagashi")
			for(var/mob/P in range(20,M))
				P << I
			spawn(35)
				del(I)
			spawn(1)
				var/olddir=src.dir
				M.Blood()
				M.stepback2(rand(1,2),olddir)
			src.overlays-='Icons/Jutsus/Chidori.dmi'
			src.chidorion=0//;src.firing=0
			return


mob
	Bump(A)
		if(istype(A,/mob/))
			var/mob/M = A
			if(src.rasenganon)
				if(M.rasenganon)
					view(src)<<"[src] clashes their Rasengan with [M]'s Rasengan!"
					if(src.rasenganD>M.rasenganD)
						M.rasenganD=0
						M.rasenganon=0
					else if(src.rasenganD==M.rasenganD)
						view(src)<<"Both Rasengan cancel each other out!"
						src.rasenganD=0
						src.rasenganon=0
						M.rasenganD=0
						M.rasenganon=0
					else
						src.rasenganD=0
						src.rasenganon=0
				if(M.chidorion)
					view(src)<<"[src] clashes their Rasengan with [M]'s Chidori!"
					if(src.rasenganD>M.chidoriD*4)
						M.chidoriD=0
						M.chidorion=0
					else if(M.chidoriD>src.rasenganD*4)
						src.rasenganD=0
						src.rasenganon=0
					else
						view(src)<<"They cancel each other out!"
						src.rasenganD=0
						src.rasenganon=0
						M.chidoriD=0
						M.chidorion=0
			if(src.chidorion)
				if(M.rasenganon)
					view(src)<<"[src] clashes their Chidori with [M]'s Rasengan!"
					if(src.chidoriD>M.rasenganD*4)
						M.rasenganD=0
						M.rasenganon=0
					else if(M.rasenganD>src.chidoriD*4)
						src.chidoriD=0
						src.chidorion=0
					else
						view(src)<<"They cancel each other out!"
						src.chidoriD=0
						src.chidorion=0
						M.rasenganD=0
						M.rasenganon=0
				if(M.chidorion)
					view(src)<<"[src] clashes their Chidori with [M]'s Chidori!"
					if(src.chidoriD>M.chidoriD)
						M.chidoriD=0
						M.chidorion=0
					else if(M.chidoriD>src.chidoriD)
						src.chidoriD=0
						src.chidorion=0
					else
						view(src)<<"They cancel each other out!"
						src.chidoriD=0
						src.chidorion=0
						M.chidoriD=0
						M.chidorion=0
			if(src.rasenganon)
				if(src.rasengantype==1)
					spawn(1)
						src.rasenhit(M)
				if(src.rasengantype==2)
					spawn(1)
						src.rasenhit2(M)
				if(src.rasengantype==3)
					spawn(1)
						src.rasenhit3(M)
			if(src.chidorion)
				if(src.chidoritype==1)
					spawn(1)
						src.chidorihit(M)
				if(src.chidoritype==2)
					spawn(1)
						src.raikirihit(M)
			if(src.intsu)
				var/damage=round(pick(src.tai*0.1,src.tai*0.2,src.tai*0.3,src.tai*0.4,src.tai*0.5,src.tai*0.6,src.tai*0.65))
				if(src.manbeastclaws)
					damage*=1.2
					M.weapondamage(damage*1.2,1,src)
				else
					M.taidamage(damage,0,src)
				//src.DamageProc(damage/(src.Endurance),"Stamina",usr)
				view()<<"[src] hit [M] with their Tsuuga for [damage]!"
				if(M.ko>0||M.Frozen)
					step_rand(src)
					spawn(1)
						if(!M.client)
							M.density=0
							sleep(5)
							M.density=1
						if(istype(M,/mob/npc/trainingbag))
							M.density=0
							sleep(5)
							M.density=1
						if(istype(M,/mob/npc/trainingbag2))
							M.density=0
							sleep(5)
							M.density=1
						if(istype(M,/mob/npc/trainingbag3))
							M.density=0
							sleep(5)
							M.density=1
				else
					step_rand(M)
			if(src.rtornado)
				var/damage=round(pick(src.nin*0.1,src.nin*0.2,src.nin*0.3,src.nin*0.4,src.nin*0.5,src.nin*0.6,src.nin*0.65))
				spawn(1)
					M.nindamage(damage,0,src)
				view()<<"[src] hit [M] with their Raiton Tornado for [damage]!"
				if(M.ko>0||M.Frozen)
					step_rand(src)
					spawn(1)
						if(!M.client)
							M.density=0
							sleep(5)
							M.density=1
						if(istype(M,/mob/npc/trainingbag))
							M.density=0
							sleep(5)
							M.density=1
						if(istype(M,/mob/npc/trainingbag2))
							M.density=0
							sleep(5)
							M.density=1
						if(istype(M,/mob/npc/trainingbag3))
							M.density=0
							sleep(5)
							M.density=1
				else
					step_rand(M)
			if(src.hbolder>0)
				var/damage=round(pick(src.tai*0.5,src.tai*1.3,src.tai*1.2,src.tai*0.8,src.tai*1.6,src.tai*0.6,src.tai*0.65))
				if(src.stomach=="Full")
					damage*=1.5
				if(src.stomach=="Bloated")
					damage*=2
				if(src.hbolder==2)
					M.weapondamage(damage*1.3,1,src)
				else
					M.taidamage(damage,0,src)
				//src.DamageProc(damage/(src.Endurance),"Stamina",usr)
				view()<<"[src] rolled on [M]!"

				if(M.ko>0||M.Frozen)
					step_rand(src)
					spawn(1)
						if(!M.client)
							M.density=0
							sleep(5)
							M.density=1
						if(istype(M,/mob/npc/trainingbag))
							M.density=0
							sleep(5)
							M.density=1
						if(istype(M,/mob/npc/trainingbag2))
							M.density=0
							sleep(5)
							M.density=1
						if(istype(M,/mob/npc/trainingbag3))
							M.density=0
							sleep(5)
							M.density=1
				else
					step_rand(M)




