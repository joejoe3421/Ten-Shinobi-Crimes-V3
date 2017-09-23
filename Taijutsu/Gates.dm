mob
	var
		hasgates=0
		tmp/gates=0
		tmp/gatecharge=0//make it the X button
		HealGateTime=0






mob
	teacher
		gatesteacher///this guy teaches gates
			//human = 1
			density=1
			//NPC = 1
			name="Might Guy"
			icon='Guy.dmi'
			health = 1
			ko=2
			layer=MOB_LAYER
			New()
				..()
				spawn()
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='leeH.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(0,0,0)
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
			verb/Talk()
				set src in oview(1)
				set category = "NPC"
				set name="Speak"
				var/cl=list()
				if(usr)
					if(usr.style=="Basic"&&usr.Mtai>=15&&usr.Mtai>=usr.Mnin&&usr.Mgen)
						cl+="Gouken Ryuu"
					if(usr.style=="Gouken Ryuu")
						if(usr.taiknowledge>=5)
							cl+="Leaf Violent Wind"
						if(usr.Mtai>=20&&usr.taiknowledge>=150)
							cl+="Leaf Rising Wind"
						if(usr.Mtai>=75&&usr.taiknowledge>=250)
							cl+="Leaf Whirlwind"
						if(usr.Mtai>=300&&usr.taiknowledge>=370&&usr.special=="Gates")
							cl+="Leaf Strong Whirlwind"
					if(usr.clan=="None")
						if(usr.special==""||usr.special=="Gates")
							if(usr.taiknowledge>=(225*usr.hasgates)&&usr.Mtai>=(150*usr.hasgates)&&usr.hasgates<8)
								cl+="Gate [usr.hasgates+1]"
				oview(src)<<"[src] Says: I am Might Guy, teacher of the Springtime of YOUTH!"
				var/T = input("What to learn?","Might Guy") in list("Nothing") + cl
				if(T in usr.jutsus)
					oview(src)<<"[src] Says: You already know this technique."
					return
				if(T=="Nothing")
					return
				if(T=="Gate 1"||T=="Gate 2"||T=="Gate 3"||T=="Gate 4"||T=="Gate 5"||T=="Gate 6"||T=="Gate 7"||T=="Gate 8")
					oview(src)<<"[src] teaches [usr] to use [T]."
					usr<<"To use Gates Hold X then Z till you gain a gate.<br>"
					if(usr.hasgates==0)
						usr.jutsus += "Gates"
						usr.special="Gates"
						usr<<"Your specialty is now [usr.special]"
					usr.hasgates+=1
				else if(T=="Gouken Ryuu")
					oview(src)<<"[src] teaches [usr] the [T] fighting style."
					usr.style = "Gouken Ryuu"
					usr.jutsus += T
				else if(T=="Leaf Violent Wind")
					usr.contents += new /obj/skill/leafviolentwind
					oview(src)<<"[src] teaches [usr] the [T]."
					usr.jutsus += T
				else if(T=="Leaf Whirlwind")
					usr.contents += new /obj/skill/leafwhirlwind
					oview(src)<<"[src] teaches [usr] the [T]."
					usr.jutsus += T
				else if(T=="Leaf Rising Wind")
					usr.contents += new /obj/skill/leafrisingwind
					oview(src)<<"[src] teaches [usr] the [T]."
					usr.jutsus += T
				else if(T=="Leaf Strong Whirlwind")
					usr.contents += new /obj/skill/leafstrongwhirlwind
					oview(src)<<"[src] teaches [usr] the [T]."
					usr.jutsus += T
				else
					oview(src)<<"[src] Says: Not right now...."


































mob
	var
		tmp/doing=0





mob/proc
	reppu()
		var/damage=src.tai*pick(0.4,0.5,0.6,0.5);var/A=4//;src.StaminaDrain(40)
		while(A)
			src.doing=1
			src.dir=turn(src.dir,90);flick("roundhouse-kick",src)
			for(var/mob/M in oview(1,src))
				spawn()
					spawn()
						if(M)
							AttackEfx(M.x,M.y,M.z)
					flick("rasenganhit",M);M.taidamage(damage,0,src,"close")
					if(prob(60))
						spawn() M.stepback2(2,src.dir)
			A--
			sleep(1)
		src.doing=0
	senpuu()
		src.doing=1
		if(src.target)
			src.dir=get_dir(src,src.target)
			var/mob/Msgg=src.target
			if(src.run&&Msgg.z==src.z)
				var/Z=rand(1,4)
				if(Z==1) src.loc=locate(Msgg.x,Msgg.y-1,Msgg.z)
				if(Z==2) src.loc=locate(Msgg.x,Msgg.y+1,Msgg.z)
				if(Z==3) src.loc=locate(Msgg.x-1,Msgg.y,Msgg.z)
				if(Z==4) src.loc=locate(Msgg.x+1,Msgg.y,Msgg.z)
		sleep(1);var/A=4//;src.StaminaDrain(100)
		while(A)
			src.dir=turn(src.dir,90);flick("roundhouse-kick",src)
			var/damage=src.tai*pick(0.6,0.7,0.8,0.7)
			for(var/mob/M in oview(1,src))
				spawn()AttackEfx(M.x,M.y,M.z)
				flick("rasenganhit",M);M.taidamage(damage,0,src,"close")
				spawn() M.stepback2(2,src.dir)
			A--
			sleep(1)
		src.doing=0
	konohashofuu()
		var/damage=src.tai*pick(0.6,0.7,0.8,0.7)
		if(src.target)
			var/mob/M=src.target;src.dir=get_dir(src,M)
			sleep(1);flick("crashingleg",src)//var/damage=src.tai*rand(1.4,1.8)
		for(var/mob/M in get_step(src,src.dir))
			spawn()AttackEfx(M.x,M.y,M.z)
			flick("rasenganhit",M);M.taidamage(damage,0,src,"close");M.stepback2(3,src.dir)
	konohadaisenkou()
		if(src.target&&src.run)
			src.dir=get_dir(src,src.target)
		sleep(1);var/damage=src.tai*rand(1.4,1.6)//;src.StaminaDrain(275)
		for(var/mob/M in get_step(src,src.dir))
			M.stun+=10;src.Frozen=1;M.stun+=2;M.taidamage(damage,0,src,"close")
			sleep(1);flick("crashingleg",src);M.stun+=5;src.Frozen=1;M.stun+=2;M.taidamage(damage,0,src,"close")
			sleep(1);flick("highkick",src);M.stun+=2;src.Frozen=1;M.stun+=2;M.taidamage(damage,0,src,"close")
			sleep(1);usr.Frozen=0;M.stun=0
			spawn() M.stepback2(5,src.dir)

















mob/proc/Quick()
	spawn(1)
		flick("zan",src)
mob
	proc
		gatestrike(var/mob/M,var/damage)
			//M.clothingboosts(src,1)
			//if(village=="Leaf"&&leafpriority=="Aggressiveness"||village=="Sand"&&sandpriority=="Aggressiveness"||village=="Sound"&&soundpriority=="Aggressiveness")damage=round(damage*1.15)
			//flick("jyuken",src)
			//M.moving=0
			if(damage<0)
				damage=0
			//M.moving=0
			M.criticaleffect()
			src.dir=get_dir(src,M)
			if(prob(10*src.gates))
				M.stepback2(rand(1,4),src.dir)
			M.taidamage((damage*rand(0.9,1.2))*(1+(src.gates*0.315)),0,src)

obj/ReleaseThingy
	icon='cancel.dmi'
	icon_state="Release"
	layer = MOB_LAYER+9001
	screen_loc="NORTHEAST"
	Click()
		/*if(usr.Pill!="")
			usr.Pill=""
			usr<<"You stop the effects of the pill."*/
		if(usr.gates>0)
			usr<<"You release gate [usr.gates]!"
			usr.gates=0
			usr.icon=usr.Oicon
			usr.overlays-='BEyes.dmi'
			usr.tai=usr.Mtai
			usr.pixel_step_size=0
		del(src)


obj/Gates
	icon='Gatez.dmi'
	icon_state="2"
	layer = MOB_LAYER
	New()
		overlays+=/obj/Gates/A
		overlays+=/obj/Gates/B
		overlays+=/obj/Gates/C
	A
		icon_state="1"
		pixel_x = -32
	B
		icon_state="3"
		pixel_x = 32
	C
		icon_state="4"
		pixel_y = 32
obj/Gates1
	icon='Gatez.dmi'
	icon_state="2A"
	layer = MOB_LAYER
	New()
		overlays+=/obj/Gates1/A
		overlays+=/obj/Gates1/B
		overlays+=/obj/Gates1/C
	A
		icon_state="1A"
		pixel_x = -32
	B
		icon_state="3A"
		pixel_x = 32
	C
		icon_state="4A"
		pixel_y = 32
obj/Gates2
	icon='Gatez.dmi'
	icon_state="2B"
	layer = MOB_LAYER
	New()
		overlays+=/obj/Gates2/A
		overlays+=/obj/Gates2/B
		overlays+=/obj/Gates2/C
	A
		icon_state="1B"
		pixel_x = -32
	B
		icon_state="3B"
		pixel_x = 32
	C
		icon_state="4B"
		pixel_y = 32
obj/Gates3
	icon='Gatez.dmi'
	icon_state="2C"
	layer = MOB_LAYER
	New()
		overlays+=/obj/Gates3/A
		overlays+=/obj/Gates3/B
		overlays+=/obj/Gates3/C
	A
		icon_state="1C"
		pixel_x = -32
	B
		icon_state="3C"
		pixel_x = 32
	C
		icon_state="4C"
		pixel_y = 32


mob
	verb
		X()
			set hidden = 1
			if(src.ko==0)
				src.gatecharge=1
		XRelease()
			set hidden = 1
			src.gatecharge=0
