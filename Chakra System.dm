mob
	var
		tmp/chakracharge=0
		chakrapool=0
		chakrapoolmax=10
		tmp/moldcd=0

mob/verb
	Z()
		set hidden=1
		if(usr.moldcd>=1)
			return
		if(usr.charging)
			return
		if(src.chakracharge==0&&src.ko==0&&src.doingseals==0)
			if(src.guard)
				src.icon_state="Power"
				if(src.susanoo)
					for(var/mob/npc/susanoo/K in world)
						if(K.owner==src)
							if(src.susanoo==1)
								src<<"You advance your Susano'o defenses."
								src.susanoo=2
								src.icon_state=""
								if(src.mswho=="Sasuke")
									K.health+=((src.nin+src.gen+src.sharM)*src.susanoo)*1.06
									K.icon='sasukesusanooribs.dmi'
									//K.pixel_x -= 32
									//K.pixel_y -= 32
								if(src.mswho=="Itachi")
									K.health+=((src.nin+src.gen+src.sharM)*src.susanoo)*1.3
									K.icon='itachisusanooribs.dmi'
									//K.pixel_x -= 32
									//K.pixel_y -= 32
								if(src.mswho=="Madara")
									K.health+=((src.nin+src.gen+src.sharM)*src.susanoo)*2.5
									K.icon='madarasusanooribs.dmi'
									//K.pixel_x -= 32
									//K.pixel_y -= 32
								if(src.mswho=="Shisui")
									K.health+=((src.nin+src.gen+src.sharM)*src.susanoo)*0.67
									K.icon='shisuisusanooribs.dmi'
									//K.pixel_x -= 32
									//K.pixel_y -= 32
								if(src.mswho=="Other")
									K.health+=((src.nin+src.gen+src.sharM)*src.susanoo)
									K.icon='susanoootherribs.dmi'
									//K.pixel_x -= 32
									//K.pixel_y -= 32
							else if(src.susanoo==2)
								src<<"You push your Susano'o to it's final form."
								src.susanoo=3
								src.icon_state=""
								if(src.mswho=="Sasuke")
									K.health+=((src.nin+src.gen+src.sharM)*src.susanoo)*1.06
									K.icon='Susanoo Warrior.dmi'
									//K.pixel_x -= 32
									K.pixel_y += 32
								if(src.mswho=="Itachi")
									K.health+=((src.nin+src.gen+src.sharM)*src.susanoo)*1.3
									K.icon='itachisusanoofull2.dmi'
									//K.pixel_x -= 32
									K.pixel_y += 32
								if(src.mswho=="Madara")
									K.health+=((src.nin+src.gen+src.sharM)*src.susanoo)*2.5
									K.icon='madarasusanoofull.dmi'
									K.pixel_x -= 64
									K.pixel_y -= 32
								if(src.mswho=="Shisui")
									K.health+=((src.nin+src.gen+src.sharM)*src.susanoo)*0.67
									K.icon='shisuisusanooribs.dmi'
									//K.pixel_x -= 32
									//K.pixel_y -= 32
								if(src.mswho=="Other")
									K.health+=((src.nin+src.gen+src.sharM)*src.susanoo)
									K.icon='susanoootherfullmini.dmi'
									K.pixel_x += 32
									K.pixel_y += 32
			else
				if(src.rasengancharge==0&&src.chidoricharge==0&&src.gatecharge==0)
					if(src.gates>=3)
						src<<"<b>Your hands slipped! Your muscles are twitching too quickly to form handseals!</b>"
						return
					src.chakracharge=1
					while(src.chakracharge)
						src.icon_state="handseal"
						if(src.chakrapool<=0)
							src.chakrapool=0
							src<<"You have no chakra left to draw out!"
							src.health-=(src.Mhealth/63)
							return
						var/nogo=2
						if(src.prongseal>0)
							nogo=1
						if(src.chakra<src.Mchakra*(0.50*nogo))
							var/divby=src.skinlayers+1
							if(divby<1)
								divby=1
							var/Drain=((((src.Mchakra*0.015)+(src.CC*0.025))+(src.gen*0.35))/divby)//(src.CC*pick(0.5,1))+src.Mgen
							src.chakra+=(Drain+(src.CC*0.10))
							src.chakrapool-=Drain
							if(src.chakra>src.Mchakra)
								src.chakra=src.Mchakra
							if(src.health<src.Mhealth)
								if("Senju" in src.implants||src.clan=="Senju")
									src.health+=(src.Mhealth*0.003)+src.CC*0.25
								if(src.clan=="Senju")
									src.health+=(src.Mhealth*0.003)+src.CC
									if(prob(3))
										src<<"You absorb some of the life energy around you."
							if(src.levelcapped==0)
								if(prob(80))
									src.exp+=pick(0.5,1)
						sleep(2+src.poolmulti)
					src.chakracharge=0
				else
					src.icon_state="Power"
					if(src.rasengancharge)
						src<<"You begin charging your rasengan, Make sure to Hold Z."
						while(src.icon_state=="Power")
							src.rasenganD+=((src.chakra/25)+src.CC)*3
							src.chakra-=((src.chakra/25)+src.CC)/4
							sleep(5)
						src<<"You stop charging your rasengan."
						src.rasengancharge=0
						return
					if(src.chidoricharge)
						src<<"You begin charging your chidori, Make sure to Hold Z."
						while(src.icon_state=="Power")
							src.chidoriD+=((src.chakra/15)+src.CC)*1.2
							src.chakra-=((src.chakra/15)+src.CC)/3
							sleep(4)
						src<<"You stop charging your chidori."
						src.chidoricharge=0
						return
					if(src.gates<=0&&src.HealGateTime>0&&src.gatecharge&&src.sagecharge==0)
						src<<"You body is still recovering from the last time you used the inner gates."
						return
					if(src.hasgates&&src.gatecharge&&src.sagecharge==0)//has gates is the number of gates the person has if any
						var/chargetime=0
						var/needtime=1+src.gates
						while(src.gatecharge&&chargetime<needtime&&src.icon_state=="Power")
							chargetime+=1
							sleep(10)
						if(chargetime>=needtime)
							chargetime=0
						else
							return
						//src.gatecharge=0
						//src.GateCharging+=1
						if(src.gates<src.hasgates)
							if(src.gates==0)
								src<<"You unlock the first gate!"
								view(src)<<"[src]: Initial gate, OPEN!"
								src.gates+=1
								//src.GateCharging=0
								//src.GateIn="Initial"
								src.koamm+=5
								src.HealGateTime++
								var/count=0
								if(src.client)
									for(var/obj/ReleaseThingy/A in src.client.screen)
										count=1
									if(count==0)
										src.client.screen+=new/obj/ReleaseThingy
								return
							if(src.gates==1)
								src<<"You unlock the second gate!"
								view(src)<<"[src]: Heal gate, OPEN!"
								src.gates+=1
								//src.GateCharging=0
								//src.GateIn="Heal"
								//src.health=src.Mhealth
								if(src.health<src.Mhealth)
									src.health+=src.Mhealth*0.50
									if(src.health>src.Mhealth)
										src.health=src.Mhealth
								var/count=0
								if(src.client)
									for(var/obj/ReleaseThingy/A in src.client.screen)
										count=1
									if(count==0)
										src.client.screen+=new/obj/ReleaseThingy
								while(src.gates>=2)
									if(src.health>src.Mhealth*0.05)
										src.alldamage(src.Mhealth*0.01,src)
									src.koamm+=0.3
									src.HealGateTime++
									//src.chakra-=1
									sleep(10)
									//src.Death(src)
								return
							if(src.gates==2)
								src<<"You unlock the third gate!"
								view(src)<<"[src]: Life gate, OPEN!"
								src.gates+=1
								var/I='Base.dmi'
								I += rgb(120,0,0)
								src.Oicon=src.icon
								src.icon=I
								src.overlays+='BEyes.dmi'
								//src.GateIn="Life"
								src.HealGateTime++
								src.tai+=src.tai/8
								src.koamm+=10
								src.overlays+=/obj/Gates
								var/count=0
								if(src.client)
									for(var/obj/ReleaseThingy/A in src.client.screen)
										count=1
									if(count==0)
										src.client.screen+=new/obj/ReleaseThingy
								spawn(30)
									src.overlays-=/obj/Gates
								while(src.gates>=3)
									if(src.health>src.Mhealth*0.05)
										src.alldamage(src.Mhealth*0.005,src)
									src.koamm+=0.6
									src.HealGateTime++
									sleep(10)
								return
							if(src.gates==3)
								src<<"You unlock the fourth gate!"
								view(src)<<"[src]: Wound gate, OPEN!"
								src.gates+=1
								//src.GateIn="Wound"
								src.tai=src.Mtai
								src.HealGateTime++
								src.koamm+=15
								src.tai+=src.tai/6
								src.overlays+=/obj/Gates1
								var/count=0
								if(src.client)
									for(var/obj/ReleaseThingy/A in src.client.screen)
										count=1
									if(count==0)
										src.client.screen+=new/obj/ReleaseThingy
								spawn(30)
									src.overlays-=/obj/Gates1
								while(src.gates>=4)
									if(src.health>src.Mhealth*0.05)
										src.alldamage(src.Mhealth*0.005,src)
									src.koamm+=3
									src.HealGateTime++
									sleep(10)
								return
							if(src.gates==4)
								src<<"You unlock the fifth gate!"
								view(src)<<"[src]: Limit gate, OPEN!"
								src.gates+=1
								//src.GateIn="Limit"
								src.tai=src.Mtai
								src.tai+=src.tai/5
								src.HealGateTime++
								src.koamm+=20
								src.overlays+=/obj/Gates2
								var/count=0
								if(src.client)
									for(var/obj/ReleaseThingy/A in src.client.screen)
										count=1
									if(count==0)
										src.client.screen+=new/obj/ReleaseThingy
								spawn(30)
									src.overlays-=/obj/Gates2
								while(src.gates>=5)
									if(src.health>src.Mhealth*0.05)
										src.alldamage(src.Mhealth*0.005,src)
									src.koamm+=1
									src.HealGateTime++
									sleep(10)
								return
							if(src.gates==5)
								src<<"You unlock the sixth gate!"
								view(src)<<"[src]: View gate, OPEN!"
								src.gates+=1
								//src.GateIn="View"
								src.tai=src.Mtai
								src.koamm+=10
								src.HealGateTime++
								src.tai+=src.tai/3
								src.pixel_step_size=32
								src.overlays+=/obj/Gates3
								var/count=0
								if(src.client)
									for(var/obj/ReleaseThingy/A in src.client.screen)
										count=1
									if(count==0)
										src.client.screen+=new/obj/ReleaseThingy
								spawn(30)
									src.overlays-=/obj/Gates3
								while(src.gates>=6)
									if(src.health>src.Mhealth*0.05)
										src.alldamage(src.Mhealth*0.03,0,src)
									src.koamm+=4
									src.HealGateTime++
									sleep(10)
								return
					else if(src.sagecharge)
						src.icon_state="rest"
						src<<"You began gathering natural energy"
						if(src.nenergy<0)
							src.nenergy=0
						while(src.icon_state=="rest"&&src.sagemode==0)
							if(src.nenergy<src.Mnenergy)
								src.nenergy+=(src.CC*0.01)+src.Mnenergy*0.0025
								if("Senju" in src.implants)
									src.nenergy+=(src.CC*0.005)+src.Mnenergy*0.0008
								if(src.clan=="Senju")
									src.nenergy+=(src.CC*0.05)+src.Mnenergy*0.0035
								src.chakra-=1
								if(prob(1))
									if(src.levelcapped==0)
										src.exp+=pick(0.5,1)
							sleep(2)






mob/verb/ZRelease()
	set hidden=1
	src.chakracharge=0
	src.moldcd=1
	spawn(15)
		usr.moldcd=0
	if(src.ko==0)
		src.icon_state=""
	//usr.client.removeGrid()
	/*if(usr.InEisou)
		for(var/obj/Jutsu/Elemental/Raiton/EisouHead/A in world)
			if(A.Owner==usr)
				del(A)
	if(usr.inchoke)
		return
	if(usr.KaitenCharge&&!src.Kaiten)
		usr.KaitenCharge+=1
	if(src.Mogu)
		return
	if(src.Clan=="Kiro")
		for(var/obj/Jutsu/Kiro/ShurikenStar/S in world)
			if(S.Owner==src)
				src.chakra+=100
				del(S)
	if(src.Clan=="Sabaku")
		for(var/obj/Jutsu/Sand/kyuu/K in world)
			if(K.Owner==usr)
				del(K)
		for(var/obj/Jutsu/Sand/kyuutrail/K in world)
			if(K.Owner==usr)
				del(K)
		for(var/obj/Jutsu/Sand/SandWave/S in world)
			if(S.Owner==usr)
				del(S)
		for(var/obj/Jutsu/Sand/SandTurf/S2 in world)
			if(S2.Owner==usr)
				del(S2)
	if(src.Clan=="Nara")
		for(var/obj/Nara/KageNui/A in world)
			if(A.Owner==src)
				del(A)
	if(src.doingG)
		return
	if(usr.CastingGenjutsu)
		usr.GenjutsuCanceling()
	usr.Charging=0
	if(usr.TimeToAttack==9)
		src.TimeToAttack=10
		var/style = "<style>BODY {margin:0;font:arial;background:black;\
			color:white;}</style>"
		sd_Alert(usr, "You charged your chakra!","[src]",,,,0,"400x150",,style)
		for(var/obj/Effects/ZMash/AAC in src.client.screen)
			del(AAC)
	if(usr.IntensityChakra)
		if(usr.FrozenBind=="Dead")
			usr<<"Nupe, can't do this while you're dead.";return
		for(var/obj/BarSlider/B in usr.client.screen)
			if(B.Amount>0)
				usr<<"You were only [B.Amount] off from the middle!!"
				usr.chakra-=rand(30,80)
				usr.IntensityCombos=0
			if(B.Amount<=8&&B.Amount>=-8&&B.Amount!=0)
				usr<<"You still gained some EXP!"
				usr.IntensityCombos+=1
				if(usr.IntensityCombos>3) usr.IntensityCombos=3
				usr.exp+=rand(10,50)

			else if (B.Amount==0)
				usr<<"You hit the dead middle!!!"
				usr.IntensityCombos+=2
				if(prob(5))
					usr.ChakraC++
					if(usr.ChakraC>100)
						usr.ChakraC=100
				if(usr.IntensityCombos>3) usr.IntensityCombos=3
				if(prob(10))
					if(src.Clan=="Fuuma")
						usr.ChakraControl+=1
						if(usr.ChakraControl>10) usr.ChakraControl=10
				if(usr.TypeLearning!="Taijutsu")
					usr.exp+=(rand(100,250))*usr.IntensityCombos;usr.chakra+=100
				if(usr.IntensityCombos>1)
					usr.client.screen+=new/obj/BarCombo

			else
				if(B.Amount<=8&&B.Amount>=-8&&B.Amount!=0)
					usr<<"You still gained some EXP!"
					usr.IntensityCombos+=1
					usr.exp+=rand(10,50)
				else
					var/V = 0-B.Amount
					usr<<"You were only [V] off from the middle!!"
					usr.chakra-=rand(30,80)
					usr.IntensityCombos=0

	if(usr.Guarding)
		usr.icon_state="Block"
	else
		usr.icon_state=""
	if(usr.ChargingRaikyuu)
		for(var/obj/Jutsu/Elemental/Raiton/Raikyuu/A in oview(3))
			if(A.Owner==usr)
				walk(A,usr.dir)
				flick("Attack1",usr)
				usr.ChargingRaikyuu=0
	if(usr.RasenganCharge)
		usr.RasenganCharge=0
	if(usr.intank&&usr.GatheredUpMeatTankCalories>=1)
		usr.Constant()
		var/A=usr.GatheredUpMeatTankCalories
		if(A>10)
			A=10
		while(A>0)
			A--;step(usr,usr.dir);sleep(1)
	if(usr.ChidoriCharge)
		usr.ChidoriCharge=0
		usr.icon_state="running"
		usr.Constant()
	if(usr.UserChargingForChakraPunch)
		usr.UserChargingForChakraPunch=0
		usr<<output("You have 30 seconds to utilize the chakra charged into your punch before it ends!","Attack")
		usr<<"Click X+A/S to strike the ground but end your Chakra Punch energy."
		spawn(300)
			usr.ChargedChakraForPunch=0
	if(usr.ChargingForBaikaNoJutsu)
		var/obj/SmokeCloud/A=new();A.loc=usr.loc
		usr.ChargingForBaikaNoJutsu=0;view()<<"<font color=silver><b><font face=verdana>[usr]: Baika No Jutsu!!"
		usr<<output("You have 100 seconds until the jutsu ends, if you don't already waste your calories!","Attack")
		spawn(1000)
			if(usr&&usr.BaikaCharged)
				usr.BaikaCharged=0;usr<<output("Your technique ended.","Attack")






















//////////////////////////////////
////////////////////////////////////////////
////////////////////////////////// back up
/*

mob/verb
	Z()
		set hidden=1
		if(usr.chakracharge==0&&src.ko==0&&src.doingseals==0)
			if(usr.guard)
				usr.icon_state="Power"
				if(usr.susanoo)
					for(var/mob/npc/susanoo/K in world)
						if(K.owner==usr)
							if(usr.susanoo==1)
								usr<<"You advance your Susano'o defenses."
								usr.susanoo=2
								usr.icon_state=""
								if(usr.mswho=="Sasuke")
									K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)*1.06
									K.icon='sasukesusanooribs.dmi'
									//K.pixel_x -= 32
									//K.pixel_y -= 32
								if(usr.mswho=="Itachi")
									K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)*1.3
									K.icon='itachisusanooribs.dmi'
									//K.pixel_x -= 32
									//K.pixel_y -= 32
								if(usr.mswho=="Madara")
									K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)*2.5
									K.icon='madarasusanooribs.dmi'
									//K.pixel_x -= 32
									//K.pixel_y -= 32
								if(usr.mswho=="Shisui")
									K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)*0.67
									K.icon='shisuisusanooribs.dmi'
									//K.pixel_x -= 32
									//K.pixel_y -= 32
								if(usr.mswho=="Other")
									K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)
									K.icon='susanoootherribs.dmi'
									//K.pixel_x -= 32
									//K.pixel_y -= 32
							else if(usr.susanoo==2)
								usr<<"You push your Susano'o to it's final form."
								usr.susanoo=3
								usr.icon_state=""
								if(usr.mswho=="Sasuke")
									K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)*1.06
									K.icon='Susanoo Warrior.dmi'
									//K.pixel_x -= 32
									K.pixel_y += 32
								if(usr.mswho=="Itachi")
									K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)*1.3
									K.icon='itachisusanoofull2.dmi'
									//K.pixel_x -= 32
									K.pixel_y += 32
								if(usr.mswho=="Madara")
									K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)*2.5
									K.icon='madarasusanoofull.dmi'
									K.pixel_x -= 64
									K.pixel_y -= 32
								if(usr.mswho=="Shisui")
									K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)*0.67
									K.icon='shisuisusanooribs.dmi'
									//K.pixel_x -= 32
									//K.pixel_y -= 32
								if(usr.mswho=="Other")
									K.health+=((usr.nin+usr.gen+usr.sharM)*usr.susanoo)
									K.icon='susanoootherfullmini.dmi'
									K.pixel_x += 32
									K.pixel_y += 32
			else
				if(usr.rasengancharge==0&&usr.chidoricharge==0&&usr.gatecharge==0)
					if(usr.gates>=3)
						usr<<"<b>Your hands slipped! Your muscles are twitching too quickly to form handseals!</b>"
						return
					usr.chakracharge=1
					while(usr.chakracharge)
						usr.icon_state="handseal"
						if(usr.chakrapool<=0)
							usr.chakrapool=0
							usr<<"You have no chakra left to draw out!"
							usr.health-=(usr.Mhealth/63)
							return
						if(usr.chakra<usr.Mchakra)
							var/divby=usr.skinlayers+1
							if(divby<1)
								divby=1
							var/Drain=((((usr.Mchakra*0.015)+(usr.CC*0.025))+(usr.gen*0.35))/divby)//(usr.CC*pick(0.5,1))+src.Mgen
							usr.chakra+=Drain
							usr.chakrapool-=Drain
							if(usr.chakra>usr.Mchakra)
								usr.chakra=usr.Mchakra
							if(src.health<src.Mhealth)
								if("Senju" in src.implants||src.clan=="Senju")
									src.health+=(src.Mhealth*0.003)+src.CC*0.25
								if(src.clan=="Senju")
									src.health+=(src.Mhealth*0.003)+src.CC
									if(prob(3))
										src<<"You absorb some of the life energy around you."
							if(prob(80))
								usr.exp+=pick(0.5,1)
						sleep(5+usr.poolmulti)
					usr.chakracharge=0
				else
					usr.icon_state="Power"
					if(usr.rasengancharge)
						usr<<"You begin charging your rasengan, Make sure to Hold Z."
						while(usr.icon_state=="Power")
							usr.rasenganD+=((usr.chakra/25)+usr.CC)*3
							usr.chakra-=((usr.chakra/25)+usr.CC)/4
							sleep(5)
						usr<<"You stop charging your rasengan."
						usr.rasengancharge=0
					if(usr.chidoricharge)
						usr<<"You begin charging your chidori, Make sure to Hold Z."
						while(usr.icon_state=="Power")
							usr.chidoriD+=((usr.chakra/15)+usr.CC)*1.2
							usr.chakra-=((usr.chakra/15)+usr.CC)/3
							sleep(4)
						usr<<"You stop charging your chidori."
						usr.chidoricharge=0
					if(usr.gates<=0&&usr.HealGateTime>0&&usr.gatecharge)
						usr<<"You body is still recovering from the last time you used the inner gates."
						return
					if(usr.hasgates&&usr.gatecharge)//has gates is the number of gates the person has if any
						var/chargetime=0
						var/needtime=1+usr.gates
						while(usr.gatecharge&&chargetime<needtime&&src.icon_state="Power")
							chargetime+=1
							sleep(10)
						if(chargetime>=needtime)
							chargetime=0
						else
							return
						//usr.gatecharge=0
						//usr.GateCharging+=1
						if(usr.gates<usr.hasgates)
							if(usr.gates==0)
								usr<<"You unlock the first gate!"
								usr.gates+=1
								//usr.GateCharging=0
								//usr.GateIn="Initial"
								usr.HealGateTime++
								var/count=0
								for(var/obj/ReleaseThingy/A in usr.client.screen)
									count=1
								if(count==0)
									usr.client.screen+=new/obj/ReleaseThingy
								return
							if(usr.gates==1)
								usr<<"You unlock the second gate!"
								usr.gates+=1
								//usr.GateCharging=0
								//usr.GateIn="Heal"
								//usr.health=usr.Mhealth
								if(usr.health<usr.Mhealth)
									usr.health+=usr.Mhealth*0.50
									if(usr.health>usr.Mhealth)
										usr.health=usr.Mhealth
								var/count=0
								for(var/obj/ReleaseThingy/A in usr.client.screen)
									count=1
								if(count==0)
									usr.client.screen+=new/obj/ReleaseThingy
								while(usr.gates>=2)
									if(usr.health>100)
										usr.alldamage(4,0,usr)
									usr.koamm+=0.3
									usr.HealGateTime++
									usr.chakra-=1
									sleep(10)
									//usr.Death(usr)
								return
							if(usr.gates==2)
								usr<<"You unlock the third gate!"
								usr.gates+=1
								var/I='Base.dmi'
								I += rgb(120,0,0)
								usr.Oicon=usr.icon
								usr.icon=I
								usr.overlays+='BEyes.dmi'
								//usr.GateIn="Life"
								usr.HealGateTime++
								usr.tai+=usr.tai/8
								usr.koamm+=10
								usr.overlays+=/obj/Gates
								var/count=0
								for(var/obj/ReleaseThingy/A in usr.client.screen)
									count=1
								if(count==0)
									usr.client.screen+=new/obj/ReleaseThingy
								spawn(30)
									usr.overlays-=/obj/Gates
								while(usr.gates>=3)
									if(usr.health>100)
										usr.alldamage(6,0,usr)
									usr.koamm+=0.6
									usr.HealGateTime++
									sleep(10)
								return
							if(usr.gates==3)
								usr<<"You unlock the fourth gate!"
								usr.gates+=1
								//usr.GateIn="Wound"
								usr.tai=usr.Mtai
								usr.HealGateTime++
								usr.koamm+=15
								usr.tai+=usr.tai/6
								usr.overlays+=/obj/Gates1
								var/count=0
								for(var/obj/ReleaseThingy/A in usr.client.screen)
									count=1
								if(count==0)
									usr.client.screen+=new/obj/ReleaseThingy
								spawn(30)
									usr.overlays-=/obj/Gates1
								while(usr.gates>=4)
									if(usr.health>100)
										usr.alldamage(4,0,usr)
									usr.koamm+=3
									usr.HealGateTime++
									sleep(10)
								return
							if(usr.gates==4)
								usr<<"You unlock the fifth gate!"
								usr.gates+=1
								//usr.GateIn="Limit"
								usr.tai=usr.Mtai
								usr.tai+=usr.tai/5
								usr.HealGateTime++
								usr.koamm+=20
								usr.overlays+=/obj/Gates2
								var/count=0
								for(var/obj/ReleaseThingy/A in usr.client.screen)
									count=1
								if(count==0)
									usr.client.screen+=new/obj/ReleaseThingy
								spawn(30)
									usr.overlays-=/obj/Gates2
								while(usr.gates>=5)
									if(usr.health>100)
										usr.alldamage(6,0,usr)
									usr.koamm+=1
									usr.HealGateTime++
									sleep(10)
								return
							if(usr.gates==5)
								usr<<"You unlock the sixth gate!"
								usr.gates+=1
								//usr.GateIn="View"
								usr.tai=usr.Mtai
								usr.koamm+=10
								usr.HealGateTime++
								usr.tai+=usr.tai/3
								usr.pixel_step_size=32
								usr.overlays+=/obj/Gates3
								var/count=0
								for(var/obj/ReleaseThingy/A in usr.client.screen)
									count=1
								if(count==0)
									usr.client.screen+=new/obj/ReleaseThingy
								spawn(30)
									usr.overlays-=/obj/Gates3
								while(usr.gates>=6)
									if(usr.health>100)
										usr.alldamage(10,0,usr)
									usr.koamm+=4
									usr.HealGateTime++
									sleep(10)
								return



*/
	*/