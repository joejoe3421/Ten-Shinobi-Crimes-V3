mob
	var
		demon=""
		indemon=0//so if they try to relog to get rid of rae it wont work
		demonoverlays=list()

obj/skill/demon
	verb
		powerstateoff()
			set category = "Skills"
			set name = " Demon Mode(Revert)"
			if(src.cooldown)
				usr<<"You must wait [src.cooldown] seconds before you can use this again."
				return
			if(usr.BLC)
				usr<<"You've lost control and someone else must stop you now."
				return
			if(usr.indemon)
				usr<<"You calm down."
				usr.indemon=0
				usr.demonstage=0
				return
		powerstate()
			set category = "Skills"
			set name = " Demon Mode"
			if(usr.demon=="")
				return
			if(src.cooldown)
				usr<<"You must wait [src.cooldown] seconds before you can use this again."
				return
			if(usr.prongseal)
				usr<<"[usr.demon] won't respond for some reason."
				return
			if(usr.BLC)
				usr<<"You've lost control and someone else must stop you now."
				return
			if(usr.handseal(20,1))
				src.cooldown=15//need to be like maybe 3 minutes?
				spawn(1)
					while(src.cooldown)
						if(src)
							src.cooldown-=1
						sleep(10)
				if(usr.demonstage==0)//aura stage
					//usr.overlays+='ShukakuA.dmi'
					usr.indemon=1
					//usr.demonstage+=0.5
					//usr.BLC=1
					usr.formshift(src.level)
					spawn(10)
						while(usr.indemon&&usr.ko==0)
							var/chance=(src.level*8)-(src.mastery*0.75)
							if(chance<0)
								chance=0
							if(chance>=75)
								chance=75
							if(usr.BLC==0&&prob(chance)&&usr.demonstage>=src.level)
								//usr.formshift()
								usr.BLC3()
							else
								if(usr.demonstage>=src.level&&usr.BLC==0)
									src.mastery+=1//make this 1 after testing
									if(prob(3))
										usr<<"Mastery +1([src.mastery])"
									if(src.mastery>=100)
										src.level+=1
										//usr<<"Level +1([src.level])"
										src.mastery=0
										if((src.level-1)>=0)
											usr<<"You mastered form [src.level-1]."
							sleep(rand(30,50))
						usr.overlays-=usr.demonoverlays
						//usr.overlays-='ShukakuA.dmi'
						//usr.overlays-='ShukakuA.dmi'
						usr.indemon=0
						usr.demonstage=0
						usr.BLC=0
						usr.demonoverlays=null
						usr<<"Losing your focus caused you to revert to your normal form."
					return
				if(usr.demonstage==0.5)
					if(src.level<1)
						usr<<"Pushing too hard caused the power to slip from your grasp."
						usr.overlays-=usr.demonoverlays
						//usr.overlays-='ShukakuA.dmi'
						//usr.overlays-='ShukakuA.dmi'
						usr.indemon=0
						usr.demonstage=0
						usr.BLC=0
						usr.demonoverlays=null
						//usr.demoncd=1
						//spawn(1300)
							//usr.demoncd=0
					else
						usr.formshift(src.level)
				else if(usr.demonstage==1)
					if(src.level<2)
						usr<<"Pushing too hard caused the power to slip from your grasp."
						usr.overlays-=usr.demonoverlays
						//usr.overlays-='ShukakuA.dmi'
						//usr.overlays-='ShukakuA.dmi'
						usr.indemon=0
						usr.demonstage=0
						usr.BLC=0
						usr.demonoverlays=null
						//usr.demoncd=1
						//spawn(1300)
							//usr.demoncd=0
					else
						usr.formshift(src.level)
				else if(usr.demonstage==2)
					if(src.level<3)
						usr<<"Pushing too hard caused the power to slip from your grasp."
						usr.overlays-=usr.demonoverlays
						//usr.overlays-='ShukakuA.dmi'
						//usr.overlays-='ShukakuA.dmi'
						usr.indemon=0
						usr.demonstage=0
						usr.BLC=0
						usr.demonoverlays=null
						//usr.demoncd=1
						//spawn(1300)
							//usr.demoncd=0
					else
						usr.formshift(src.level)
				else if(usr.demonstage==3)
					if(src.level<4)
						usr<<"Pushing too hard caused the power to slip from your grasp."
						usr.overlays-=usr.demonoverlays
						//usr.overlays-='ShukakuA.dmi'
						//usr.overlays-='ShukakuA.dmi'
						usr.indemon=0
						usr.demonstage=0
						usr.BLC=0
						usr.demonoverlays=null
						//usr.demoncd=1
						//spawn(1300)
							//usr.demoncd=0
					else
						usr.formshift(src.level)
				else if(usr.demonstage==4)
					if(src.level<5)
						usr<<"Pushing too hard caused the power to slip from your grasp."
						usr.overlays-=usr.demonoverlays
						//usr.overlays-='ShukakuA.dmi'
						//usr.overlays-='ShukakuA.dmi'
						usr.indemon=0
						usr.demonstage=0
						usr.BLC=0
						usr.demonoverlays=null
						//usr.demoncd=1
						//spawn(1300)
							//usr.demoncd=0
					else
						usr.formshift(src.level)
				else if(usr.demonstage==5)
					if(src.level<6)
						usr<<"Pushing too hard caused the power to slip from your grasp."
						usr.overlays-=usr.demonoverlays
						//usr.overlays-='ShukakuA.dmi'
						//usr.overlays-='ShukakuA.dmi'
						usr.indemon=0
						usr.demonstage=0
						usr.BLC=0
						usr.demonoverlays=null
						//usr.demoncd=1
						//spawn(1300)
							//usr.demoncd=0
					else
						usr.formshift(src.level)
				else if(usr.demonstage==7)
					if(src.level<8)
						usr<<"Pushing too hard caused the power to slip from your grasp."
						usr.overlays-=usr.demonoverlays
						//usr.overlays-='ShukakuA.dmi'
						//usr.overlays-='ShukakuA.dmi'
						usr.indemon=0
						usr.demonstage=0
						usr.BLC=0
						usr.demonoverlays=null
						//usr.demoncd=1
						//spawn(1300)
							//usr.demoncd=0
					else
						usr.formshift(src.level)
				else if(usr.demonstage==8)
					if(src.level<9)
						usr<<"Pushing too hard caused the power to slip from your grasp."
						usr.overlays-=usr.demonoverlays
						//usr.overlays-='ShukakuA.dmi'
						//usr.overlays-='ShukakuA.dmi'
						usr.indemon=0
						usr.demonstage=0
						usr.BLC=0
						usr.demonoverlays=null
						//usr.demoncd=1
						//spawn(1300)
							//usr.demoncd=0
					else
						usr.formshift(src.level)
				else if(usr.demonstage==9)
					if(src.level<10)
						usr<<"Pushing too hard caused the power to slip from your grasp."
						usr.overlays-=usr.demonoverlays
						//usr.overlays-='ShukakuA.dmi'
						//usr.overlays-='ShukakuA.dmi'
						usr.indemon=0
						usr.demonstage=0
						usr.BLC=0
						usr.demonoverlays=null
						//usr.demoncd=1
						//spawn(1300)
							//usr.demoncd=0
					else
						usr.formshift(src.level)
				if(usr.nin>usr.Mnin)
					usr.nin=usr.Mnin
				if(usr.tai>usr.Mtai)
					usr.tai=usr.Mtai
				if(usr.gen>usr.Mgen)
					usr.gen=usr.Mgen






mob
	proc
		aurastart()
			if(src.demon=="Shukaku")
				src.overlays+='shukaku1.dmi'
				src.demonoverlays+='shukaku1.dmi'
				//src.demonstage+=1
				src.tai+=src.Mtai*0.1
				src.nin+=src.Mnin*0.1
				src<<"The Shukaku gives you some of his power."
				oview(src)<<"Sand forms around [src]."


mob/proc/ReleaseKyuubi(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Kyuubi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			src.tai+=src.Mtai*0.01
			src.nin+=src.Mnin*0.003
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
		src.icon_state=""
	src.overlays-='kyuubi.dmi'
	src.overlays+='kyuubi.dmi'
	src.indemon=1
	src<<"You release the power of the Kyuubi!"
	src<<"The Kyuubi slightly heals you!"
	if(src.health<=src.Mhealth)
		src.health+=src.Mhealth*0.5
	src.demonstage=0.5
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==0.5)
		//src.tai=300
		src.chakra+=src.Mchakra*0.0006
		if(!Control)
			src.alldamage(src.Mhealth*(0.0040*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	//src.tai=src.Mtai
	src.overlays-='kyuubi.dmi'
	if(src.demonstage==0)
		src.overlays-='kyuubi.dmi'
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.indemon=0
		src.demonstage=0
		src.BLC=0

mob/proc/ReleaseKyuubi2(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Kyuubi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			if(src.demonstage==0.5)
				src.chakra+=50
			src.tai+=src.Mtai*0.02
			src.nin+=src.Mnin*0.006
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
	src.overlays-='kyuubi1.dmi'
	src.overlays+='kyuubi1.dmi'
	src.indemon=1
	src.icon_state=""
	src<<"You release the power of the Kyuubi!"
	src.demonstage=1
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==1)
		//src.icon_state="beastman"
		//src.tai=500
		//src.ChakraArmor=25
		src.chakraarmor=25
		src.chakra+=src.Mchakra*0.0012
		if(!Control)
			src.alldamage(src.Mhealth*(0.0040*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	//src.ChakraArmor=0
	//src.tai=src.Mtai
	src.overlays-='kyuubi1.dmi'
	src.chakraarmor=0
	if(src.demonstage==0)
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.overlays-='kyuubi1.dmi'
		src.indemon=0
		src.demonstage=0
		src.BLC=0


mob/proc/ReleaseKyuubi3(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Kyuubi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			if(src.demonstage==1)
				src.chakra+=50
			src.tai+=src.Mtai*0.04
			src.nin+=src.Mnin*0.012
			src.chakra+=src.Mchakra*0.0012
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
	src.overlays-='kyuubi2.dmi'
	src.overlays+='kyuubi2.dmi'
	src.icon_state=""
	src<<"You release the power of the Kyuubi!"
	src.demonstage=2
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==2)
		//src.icon_state="beastman"
		//src.tai=800
		//src.ChakraArmor=35
		src.chakraarmor=35
		src.chakra+=src.Mchakra*0.0090
		if(!Control)
			src.alldamage(src.Mhealth*(0.0040*src.demonstage),src)
			//src.stamina-=50
		sleep(10)
	//src.ChakraArmor=0
	//src.tai=src.Mtai
	src.overlays-='kyuubi2.dmi'
	src.chakraarmor=0
	if(src.demonstage==0)
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.overlays-='kyuubi2.dmi'
		src.indemon=0
		src.demonstage=0
		src.BLC=0


mob/proc/ReleaseShukaku(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Shukaku!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			src.tai+=src.Mtai*0.012
			src.nin+=src.Mnin*0.009
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
		src.icon_state=""
	src.overlays-='Suna.dmi'
	src.overlays+='Suna.dmi'
	src.indemon=1
	src<<"You release the power of the Shukaku!"
	src.demonstage=0.5
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==0.5)
		//src.tai=300
		src.chakra+=src.Mchakra*0.0006
		if(!Control)
			src.alldamage(src.Mhealth*(0.0040*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	//src.tai=src.Mtai
	src.overlays-='Suna.dmi'
	if(src.demonstage==0)
		src.overlays-='Suna.dmi'
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.indemon=0
		src.demonstage=0
		src.BLC=0



mob/proc/ReleaseNibi(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Nibi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			src.tai+=src.Mtai*0.003
			src.nin+=src.Mnin*0.01
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
		src.icon_state=""
	src.overlays-='cataura.dmi'
	src.overlays+='cataura.dmi'
	src.indemon=1
	src<<"You release the power of the Nibi!"
	src.demonstage=0.5
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==0.5)
		//src.tai=300
		src.chakra+=src.Mchakra*0.0006
		if(!Control)
			src.alldamage(src.Mhealth*(0.0040*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	//src.tai=src.Mtai
	src.overlays-='cataura.dmi'
	if(src.demonstage==0)
		src.overlays-='cataura.dmi'
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.indemon=0
		src.demonstage=0
		src.BLC=0


mob/proc/ReleaseNibi2(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Nibi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			src.tai+=src.Mtai*0.006
			src.nin+=src.Mnin*0.02
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
		src.icon_state=""
	src.overlays-='cataura1.dmi'
	src.overlays+='cataura1.dmi'
	src.indemon=1
	src<<"You release the power of the Nibi!"
	src.demonstage=1
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==1)
		//src.tai=300
		src.chakraarmor=10
		src.chakra+=src.Mchakra*0.0024
		if(!Control)
			src.alldamage(src.Mhealth*(0.0020*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	//src.tai=src.Mtai
	src.overlays-='cataura1.dmi'
	src.chakraarmor=0
	if(src.demonstage==0)
		src.overlays-='cataura1.dmi'
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.indemon=0
		src.demonstage=0
		src.BLC=0



mob/proc/ReleaseNibi3(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Nibi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			src.tai+=src.Mtai*0.012
			src.nin+=src.Mnin*0.04
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
		src.icon_state=""
	src.overlays-='cataura2.dmi'
	src.overlays+='cataura2.dmi'
	src.indemon=1
	src<<"You release the power of the Nibi!"
	src.demonstage=2
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==2)
		//src.tai=300
		src.chakraarmor=30
		src.chakra+=src.Mchakra*0.0048
		if(!Control)
			src.alldamage(src.Mhealth*(0.0040*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	//src.tai=src.Mtai
	src.overlays-='cataura2.dmi'
	src.chakraarmor=0
	if(src.demonstage==0)
		src.overlays-='cataura2.dmi'
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.indemon=0
		src.demonstage=0
		src.BLC=0



mob/proc/ReleaseSanbi(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Sanbi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			src.tai+=src.Mtai*0.01
			src.nin+=src.Mnin*0.003
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
		src.icon_state=""
	src.overlays-='kyuubi.dmi'
	src.overlays+='kyuubi.dmi'
	src.indemon=1
	src<<"You release the power of the Sanbi!"
	src<<"Your skin hardens slightly!"
	src.enduranceaddon+=100
	src.demonstage=0.5
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==0.5)
		//src.tai=300
		src.chakra+=src.Mchakra*0.0006
		if(!Control)
			src.alldamage(src.Mhealth*(0.0060*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	//src.tai=src.Mtai
	src.overlays-='kyuubi.dmi'
	src.enduranceaddon-=100
	if(src.demonstage==0)
		src.overlays-='kyuubi.dmi'
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.indemon=0
		src.demonstage=0
		src.BLC=0


mob/proc/ReleaseSanbi2(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Sanbi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			src.tai+=src.Mtai*0.02
			src.nin+=src.Mnin*0.006
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
		src.icon_state=""
	src.overlays-='kyuubi.dmi'
	src.overlays-='demonturtle.dmi'
	src.overlays+='demonturtle.dmi'
	src.overlays-='demonturtletail1O.dmi'
	src.underlays-='demonturtletail1U.dmi'
	src.overlays+='demonturtletail1O.dmi'
	src.underlays+='demonturtletail1U.dmi'
	src.overlays+='kyuubi.dmi'
	src.indemon=1
	src<<"You release the power of the Sanbi!"
	src<<"Your skin hardens slightly!"
	src.enduranceaddon+=500
	src.demonstage=1
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==1)
		//src.tai=300
		src.chakra+=src.Mchakra*0.0012
		if(!Control)
			src.alldamage(src.Mhealth*(0.0060*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	//src.tai=src.Mtai
	src.overlays-='kyuubi.dmi'
	src.overlays-='demonturtle.dmi'
	src.overlays-='demonturtletail1O.dmi'
	src.underlays-='demonturtletail1U.dmi'
	src.enduranceaddon-=500
	if(src.demonstage==0)
		src.overlays-='kyuubi.dmi'
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.indemon=0
		src.demonstage=0
		src.BLC=0



mob/proc/ReleaseYonbi(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Yonbi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			src.tai+=src.Mtai*0.01
			src.nin+=src.Mnin*0.003
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
		src.icon_state=""
	src.overlays-='kyuubi.dmi'
	src.overlays+='kyuubi.dmi'
	src.indemon=1
	src<<"You release the power of the Yonbi!"
	src.demonstage=0.5
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==0.5)
		//src.tai=300
		src.chakra+=src.Mchakra*0.0006
		if(!Control)
			src.alldamage(src.Mhealth*(0.0070*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	//src.tai=src.Mtai
	src.overlays-='kyuubi.dmi'
	if(src.demonstage==0)
		src.overlays-='kyuubi.dmi'
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.indemon=0
		src.demonstage=0
		src.BLC=0


mob/proc/ReleaseGobi(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Gobi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			src.tai+=src.Mtai*0.01
			src.nin+=src.Mnin*0.003
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
		src.icon_state=""
	src.overlays-='kyuubi.dmi'
	src.overlays+='kyuubi.dmi'
	src.indemon=0.5
	src<<"You release the power of the Gobi!"
	src.demonstage=0.5
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==0.5)
		//src.tai=300
		src.chakra+=src.Mchakra*0.0006
		if(!Control)
			src.alldamage(src.Mhealth*(0.0040*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	//src.tai=src.Mtai
	src.overlays-='kyuubi.dmi'
	if(src.demonstage==0)
		src.overlays-='kyuubi.dmi'
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.indemon=0
		src.demonstage=0
		src.BLC=0

mob/proc/ReleaseGobi2(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Gobi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			if(src.demonstage==0.5)
				src.chakra+=50
			src.tai+=src.Mtai*0.02
			src.nin+=src.Mnin*0.006
			src.chakra+=25
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
	src.overlays-='kyuubi1.dmi'
	src.overlays+='kyuubi1.dmi'
	src.indemon=1
	src.icon_state=""
	src<<"You release the power of the Gobi!"
	src.demonstage=1
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==1)
		//src.icon_state="beastman"
		//src.tai=500
		src.chakraarmor=45
		src.chakra+=src.Mchakra*0.0012
		if(!Control)
			src.alldamage(src.Mhealth*(0.0040*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	src.chakraarmor=0
	//src.tai=src.Mtai
	src.overlays-='kyuubi1.dmi'
	if(src.demonstage==0)
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.overlays-='kyuubi1.dmi'
		src.indemon=0
		src.demonstage=0
		src.BLC=0

mob/proc/ReleaseRokubi(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Rokubi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			src.tai+=src.Mtai*0.01
			src.nin+=src.Mnin*0.003
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
		src.icon_state=""
	src.overlays-='Bijuu1.dmi'
	src.overlays-='kyuubi.dmi'
	src.overlays+='kyuubi.dmi'
	src.indemon=1
	src<<"You release the power of the Rokubi!"
	src.demonstage=0.5
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==0.5)
		//src.tai=300
		src.chakra+=src.Mchakra*0.0006
		if(!Control)
			src.alldamage(src.Mhealth*(0.0040*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	//src.tai=src.Mtai
	src.overlays-='kyuubi.dmi'
	if(src.demonstage==0)
		src.overlays-='kyuubi.dmi'
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.indemon=0
		src.demonstage=0
		src.BLC=0


mob/proc/ReleaseRokubi2(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Rokubi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			src.tai+=src.Mtai*0.02
			src.nin+=src.Mnin*0.006
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
		src.icon_state=""
	src.overlays-='Bijuu1.dmi'
	src.overlays+='Bijuu1.dmi'
	src.indemon=1
	src<<"You release the power of the Rokubi!"
	src.demonstage=1
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==1)
		//src.tai=300
		src.chakraarmor=35
		src.chakra+=src.Mchakra*0.0012
		if(!Control)
			src.alldamage(src.Mhealth*(0.0040*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	//src.tai=src.Mtai
	src.overlays-='kyuubi.dmi'
	src.overlays-='Bijuu1.dmi'
	if(src.demonstage==0)
		src.overlays-='kyuubi.dmi'
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.indemon=0
		src.demonstage=0
		src.BLC=0

mob/proc/ReleaseShichibi(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Shichibi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			src.tai+=src.Mtai*0.01
			src.nin+=src.Mnin*0.003
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
		src.icon_state=""
	src.overlays-='Bijuu1.dmi'
	src.overlays-='kyuubi.dmi'
	src.overlays+='kyuubi.dmi'
	src.indemon=1
	src<<"You release the power of the Shichibi!"
	src.demonstage=0.5
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==0.5)
		//src.tai=300
		src.chakra+=src.Mchakra*0.0006
		if(!Control)
			src.alldamage(src.Mhealth*(0.0040*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	//src.tai=src.Mtai
	src.overlays-='kyuubi.dmi'
	if(src.demonstage==0)
		src.overlays-='kyuubi.dmi'
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.indemon=0
		src.demonstage=0
		src.BLC=0

mob/proc/ReleaseHachibi(Control,Speed)
	if(src.ko)
		return
	src<<"You begin to slip a bit of chakra from the Hachibi!"
	if(!Speed)
		src.icon_state="Power"
		var/X=rand(5,10)
		while(X>0)
			src.chakra+=25
			src.tai+=src.Mtai*0.025
			src.nin+=src.Mnin*0.0063
			if(src.icon_state!="Power")
				src<<"You drop concentration!";X=0
			X--
			sleep(10)
		src.icon_state=""
	src.overlays-='kyuubi.dmi'
	src.overlays+='kyuubi.dmi'
	src.indemon=1
	src<<"You release the power of the Hachibi!"
	src.demonstage=0.5
	if(Speed)
		spawn(600)
			src.demonstage=0
	while(src.demonstage==0.5)
		//src.tai=300
		src.chakra+=src.Mchakra*0.0006
		if(!Control)
			src.alldamage(src.Mhealth*(0.0040*src.demonstage),src)
			//src.stamina-=35
		sleep(10)
	//src.tai=src.Mtai
	src.overlays-='kyuubi.dmi'
	if(src.demonstage==0)
		src.overlays-='kyuubi.dmi'
		src.tai=src.Mtai
		src.nin=src.Mnin
		src.indemon=0
		src.demonstage=0
		src.BLC=0
























mob
	proc
		formshift(level)
			if(src.demon=="Shukaku")
				if(src.demonstage==0)
					var/cancontrol=(level+1)-1
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseShukaku(cancontrol)
					return
				/*if(src.demonstage==0.5)
					var/cancontrol=(level+1)-2
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseNibi2(cancontrol)
					return
				if(src.demonstage==1)
					var/cancontrol=(level+1)-3
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseNibi3(cancontrol)
					return*/
				else// if(src.demonstage==2)
					src.indemon=0
					src.demonstage=0
					src.BLC=0
					src<<"You revert due to the Shukaku not being completely finished."
					return
			if(src.demon=="Nibi")
				if(src.demonstage==0)
					var/cancontrol=(level+1)-1
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseNibi(cancontrol)
					return
				if(src.demonstage==0.5)
					var/cancontrol=(level+1)-2
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseNibi2(cancontrol)
					return
				if(src.demonstage==1)
					var/cancontrol=(level+1)-3
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseNibi3(cancontrol)
					return
				else// if(src.demonstage==2)
					src.indemon=0
					src.demonstage=0
					src.BLC=0
					src<<"You revert due to the Nibi not being completely finished."
					return
			if(src.demon=="Sanbi")
				if(src.demonstage==0)
					var/cancontrol=(level+1)-1
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseSanbi(cancontrol)
					return
				if(src.demonstage==0.5)
					var/cancontrol=(level+1)-2
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseSanbi2(cancontrol)
					return
				/*if(src.demonstage==1)
					var/cancontrol=(level+1)-3
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseNibi3(cancontrol)
					return*/
				else// if(src.demonstage==2)
					src.indemon=0
					src.demonstage=0
					src.BLC=0
					src<<"You revert due to the Sanbi not being completely finished."
					return
			if(src.demon=="Yonbi")
				if(src.demonstage==0)
					var/cancontrol=(level+1)-1
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseYonbi(cancontrol)
					return
				/*if(src.demonstage==0.5)
					var/cancontrol=(level+1)-2
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseNibi2(cancontrol)
					return
				if(src.demonstage==1)
					var/cancontrol=(level+1)-3
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseNibi3(cancontrol)
					return*/
				else// if(src.demonstage==2)
					src.indemon=0
					src.demonstage=0
					src.BLC=0
					src<<"You revert due to the Yonbi not being completely finished."
					return
			if(src.demon=="Gobi")
				if(src.demonstage==0)
					var/cancontrol=(level+1)-1
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseGobi(cancontrol)
					return
				if(src.demonstage==0.5)
					var/cancontrol=(level+1)-2
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseGobi2(cancontrol)
					return
				/*if(src.demonstage==1)
					var/cancontrol=(level+1)-3
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseNibi3(cancontrol)
					return*/
				else// if(src.demonstage==2)
					src.indemon=0
					src.demonstage=0
					src.BLC=0
					src<<"You revert due to the Gobi not being completely finished."
					return
			if(src.demon=="Rokubi")
				if(src.demonstage==0)
					var/cancontrol=(level+1)-1
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseRokubi(cancontrol)
					return
				if(src.demonstage==0.5)
					var/cancontrol=(level+1)-2
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseRokubi2(cancontrol)
					return
				/*if(src.demonstage==1)
					var/cancontrol=(level+1)-3
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseNibi3(cancontrol)
					return*/
				else// if(src.demonstage==2)
					src.indemon=0
					src.demonstage=0
					src.BLC=0
					src<<"You revert due to the Rokubi not being completely finished."
					return
			if(src.demon=="Shichibi")
				if(src.demonstage==0)
					var/cancontrol=(level+1)-1
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseShichibi(cancontrol)
					return
				/*if(src.demonstage==0.5)
					var/cancontrol=(level+1)-2
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseNibi2(cancontrol)
					return
				if(src.demonstage==1)
					var/cancontrol=(level+1)-3
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseNibi3(cancontrol)
					return*/
				else// if(src.demonstage==2)
					src.indemon=0
					src.demonstage=0
					src.BLC=0
					src<<"You revert due to the Shichibi not being completely finished."
					return
			if(src.demon=="Hachibi")
				if(src.demonstage==0)
					var/cancontrol=(level+1)-1
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseHachibi(cancontrol)
					return
				/*if(src.demonstage==0.5)
					var/cancontrol=(level+1)-2
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseNibi2(cancontrol)
					return
				if(src.demonstage==1)
					var/cancontrol=(level+1)-3
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseNibi3(cancontrol)
					return*/
				else// if(src.demonstage==2)
					src.indemon=0
					src.demonstage=0
					src.BLC=0
					src<<"You revert due to the Hachibi not being completely finished."
					return
			if(src.demon=="Kyuubi")
				if(src.demonstage==0)
					var/cancontrol=(level+1)-1
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseKyuubi(cancontrol)
					return
				if(src.demonstage==0.5)
					var/cancontrol=(level+1)-2
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseKyuubi2(cancontrol)
					return
				if(src.demonstage==1)
					var/cancontrol=(level+1)-3
					if(cancontrol<0)
						cancontrol=0
					spawn(1)
						src.ReleaseKyuubi3(cancontrol)
					return
				else// if(src.demonstage==2)
					src.indemon=0
					src.demonstage=0
					src.BLC=0
					src<<"You revert due to the kyuubi not being completely finished."
					return
				/*else if(src.demonstage==8)
					//src.overlays+='shukakufull.dmi'
					//src.demonoverlays+='shukakufull.dmi'
					src.demonstage+=1
					src.tai+=src.Mtai*1.2
					src.nin+=src.Mnin*1.3
					src<<"Remind Joe to add in the third stage for kyuubi bijuu"
					src<<"The the Kyuubi gives you more power."
					oview(src)<<"[src]: Kyuubi Transformation!"
					oview(src)<<"[src] Transforms into the Kyuubi!"
					//src<<"The Shakaku goes on a rampage!"
					//src.BLC3()
					*/



mob
	var
		random
		tmp/BLC=0
		tmp/demonstage=0





mob
	proc
		BLC3()
			//if(src.indemon&&src.BLC)
				//src.overlays-='1.dmi'
			if(src.BLC>=1)
				return
			src.BLC=1
			while(src.indemon&&src.BLC&&src.ko==0)
				src.icon_state="beastman"
				//Recovery(src)
				//src.vaispecial=1
				//src.Intrans=1
				//Takenover(src)
				//src.overlays+='1.dmi'
				//src.attack=src.mattack*3.5
				//src.defence=src.mdefence*2
				//src.rei=src.mrei*2
				//src.rundelay=-4
				src.random=rand(1,10)
				if(src.random==2||src.random==3)
					for(var/mob/M in oview(10))
						src.target=M
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
						src.Attack()
						sleep(1)
						step_rand(src,0)
						sleep(1)
						step_rand(src,0)
				if(src.random==5||src.random==6)
					src.Attack()
					step_rand(src,0)
					sleep(1)
					step_rand(src,0)
					sleep(1)
					step_rand(src,0)
				if(src.random==7)
					//if(src.dir==NORTH)
					//if(src.dir==SOUTH)
					//if(src.dir==WEST)
					//if(src.dir==EAST)
					for(var/mob/M in oview(8))
						src.target=M
						src.Shushin_Behind(M)
						src.Attack()
						step(src,rand(1.10))
						sleep(1)
						step(src,src.dir)
						sleep(1)
						step(src,src.dir)
						sleep(1)
						src.dir=src.dir
						src.Attack()
						sleep(1)
						step_rand(src,0)
						sleep(1)
						step_rand(src,0)
						break
						/*if(src.dir==NORTH)
						if(src.dir==SOUTH)
						if(src.dir==WEST)
						if(src.dir==EAST)*/
				if(src.random==8)
					step(src,rand(1,10))
					sleep(1)
					step(src,rand(1,10))
					sleep(1)
					step(src,rand(1,10))
					sleep(1)
					step(src,rand(1,10))
					src.Attack()
					sleep(1)
					step_rand(src,0)
					sleep(1)
					step_rand(src,0)
				//if(src.random==9)
					//for(var/mob/M in oview(10))
						//src.loc=M.loc
				if(src.random==10)
					//src.icon_state="attack"
					//view(src)<<"<b>[src]:<font color=silver>HAHAHAHAHAHAHA"
					sleep(10)
					src.icon_state=""
					for(var/mob/M in oview(10))
						step_towards(src,M)//take a step towards M
						step_towards(src,M)
						if(prob(40))
							step_rand(src,32)
							step_rand(src,32)
						if(prob(2))
							src.Shushin_Behind(M)
						src.target=M
						if(get_dist(src,M)<=1)//if the distance is 1 or less
							if(prob(97))
								src.dir=get_dir(src,M)//Makes it so T faces M
								src.Attack()//Calls the attack proc
								if(prob(6.5))
									//src.Shushin_Far_Behind(M)
									src.usejutsu()
						//var/damage=rand(100,1000)
						//M.health-=damage
						//view(src,8)<<"<b><font color=red>[src] attacked [M] for [damage] damage!"
						break
						//M.DamageShow(damage,200,0,0)
						//sleep(3)
						//src.icon_state=""
				if(prob(0.3))//was a flat out 0.1
					src<<"You calm down."
					src.overlays-=src.demonoverlays
					//usr.overlays-='ShukakuA.dmi'
					//usr.overlays-='ShukakuA.dmi'
					src.indemon=0
					src.demonstage=0
					src.BLC=0
					src.demonoverlays=null
				sleep(1.5)
			//else
				//return
