mob
	var
		tmp/takingcd=0

mob/owner
	verb
		testparty()
			set name = "Test Party System"
			set category = "Testing"
			src.Refresh_Squad_Verbs()
		testbountyhunter(mob/M in world)//in case i forget this will become a self used kage verb so M would become user etc
			set name = "Test Bounty Hunting"//also i didn't put in the part if they fail the villages get their money back well half of the money so recheck it
			set category = "Testing"
			var/huntable=0
			for(var/mob/T in world)
				if(T.client&&T.bounty>=1&&T.village!=M.village)
					huntable+=1
					sleep(1)
			if(huntable>=1)
				M.bountyhunterhire(rand(1,10000),M.loc)
			else
				M<<"Sorry no bountys to hunt."
		givebounty(mob/M in world)
			set name = "Give bounty"
			set category = "Admin"
			var/levelreach=input("How large") as num
			if(levelreach<=0)
				usr<<"You decide not to place the bounty."
				return
			if(levelreach>=60000)
				levelreach=60000
			M.bounty+=levelreach
		giveskill(mob/M in world) //works fine, just unneeded
			set name = "Give Skill"
			set category = "Admin"
			var/varItem
			var/varType = "Skill"
			if(varType == "Cancel")
				return
			if(varType == "Skill")
				varItem = input(usr,"What do you want to make?","Create obj") in list("Cancel") + typesof(/obj/skill) //+ list("Cancel")
			if(varItem == "Cancel")
				return
			var/atom/O = new varItem(M)//locate(src.x,src.y,src.z))
			if(usr.key!="Joejoe13")
				world<<"[usr] waves their hand and [O] appears in [M]'s skills."
				usr<<"This verb is only tempt, so don't get used to it."
			//O.loc=usr
		giverinne(mob/M in world)
			set category = "Admin"
			set name  = "Give Rinnegan"
			if(M.clan!="Uchiha")
				M.rinnepoten=1
				usr<<"You give [M] rinnegan potenial."
			else
				usr<<"Uchiha can gain rinnegan on their own, this would just bug them."
		clearcd(mob/M in world)
			set category = "Admin"
			set name  = "Take Cooldowns"
			if(usr.takingcd)
				usr<<"It's working just wait so you don't cause lag."
				return
			usr.takingcd=1
			for(var/obj/skill/T in M.contents)
				if(T.cooldown>5)
					T.cooldown=5
					M<<"[T] cooldown set to 5."
				sleep(1)
			usr.takingcd=0
		spawncode()
			set category = "Admin"
			set name  = "Spawn Promo Code"
			if(usr.key=="Joejoe13")
				global.promopick()
				usr<<"Path of the Shinobi has relased the following Promo Code...([promocode])."
				sleep(50)
				usr<<"The reward is [promoreward]."
		checkpromo()
			set category = "Admin"
			set name  = "Promo Code(Who)"
			for(var/T in gotpromo)
				if(T)
					usr<<"[T] used the Promo Code."
		stripjutsu(mob/M in world)//-----------------------------NOTE: Erase this after testing, will cause buggs. might anyway
			set category = "Admin"
			set name  = "Jutsu Removal"
			if(M.client)
				var/PupList = list()
				for(var/obj/skill/C in M.contents)
					PupList += C
				//goon
				goon
				var/T=input("Remove which jutsu?","Jutsu Removal") in list("Done","Cancel") + PupList + list("All")
				if(T=="Cancel")
					return
				if(T=="All")
					if(M!=usr)
						usr<<"Asking [M] if they would like their jutsu taken."
					switch(input(M,"Would you like to have all your jutsu taken?")in list ("No","Yes"))
						if("Yes")
							M.jutsus=list()
							for(var/obj/skill/S in M.contents)
								if(M!=usr)
									usr<<"[S] removed."
								M<<"[S] removed."
								del S
								sleep(1)
							world<<"[M] has been stripped of all their jutsu."
				if(T=="Done")
					//var/list/last
					pic
					var/last=input("Remove the jutsu again from their justus list (if it's there).") in list("Done") + M.jutsus
					//last+=D
					if(last=="Done")
						usr<<"Done."
					else
						if(last in M.jutsus)
							usr<<"[last] removed from jutsulist."
							M.jutsus-= last
						goto pic
				else
					if(M!=usr)
						usr<<"[T] removed from [M]'s contents."
					M<<"[T] removed."
					del T
					goto goon
		masterjutsu(mob/M in world)//-----------------------------NOTE: Erase this after testing, will cause buggs. might anyway
			set category = "Admin"
			set name  = "Jutsu Mastery +1"
			if(M.client)
				var/PupList = list()
				for(var/obj/skill/C in M.contents)
					PupList += C
				//goon
				var/obj/T=input("Master which jutsu?","Jutsu Master") in list("Done","Cancel") + PupList
				if(T=="Cancel")
					return
				T.level+=1
		testizanami()
			set category = "Testing"
			set name  = "Test Izanami"
			//usr.sharM=1000
			//usr.gen=2000
			if(usr.target!=null)//give a cooldown of 5 minutes
				spawn(1)
					var/mob/O = usr.target
					usr.izanami(O)
			else
				usr<<"You need a target!"
				return
		testmistjutsu()
			set category = "Admin"
			set name  = "Test Hidden Mist Jutsu"
			var/where=usr.loc
			var/levelreach=input("How far") as num
			if(levelreach<=0)
				levelreach=1
			if(levelreach>=15)
				levelreach=15
			var/level=0
			while(level<=levelreach)
				var/control=usr.CC
				if(control==100)
					control=99
				for(var/turf/T in getcircle(where,level))
					if(prob(95))
						var/obj/jutsu/mist/A=new()
						A.owner=src;A.loc=locate(T.x,T.y,T.z)
					//sleep(1)
				level+=1
				sleep(20)
		testmistjutsu2()
			set category = "Admin"
			set name  = "Test Hidden Mist Jutsu 2"
			var/where=usr.loc
			var/levelreach=input("How far") as num
			if(levelreach<=0)
				levelreach=1
			if(levelreach>=15)
				levelreach=15
			var/level=0
			while(level<=levelreach)
				var/control=usr.CC
				if(control==100)
					control=99
				for(var/turf/T in getring(where,level))
					if(prob(95))
						var/obj/jutsu/mist/A=new()
						A.owner=src;A.loc=locate(T.x,T.y,T.z)
						A.icon_state="heavy"
					//sleep(1)
				level+=1
				sleep(20)
		testimmortal()
			set category = "Admin"
			set name  = "Add Immortal Time"
			usr.immortality+=10
			usr<<"You gained 10 seconds of immortality ([usr.immortality])"
		killeffects(mob/M in world)
			set category = "Admin"
			set name  = "Kill Effects"
			M.killactivates()
		weaken(mob/M in world)
			set category = "Admin"
			set name = "Weaken"
			M.health=10
		koedyou(mob/M in world)
			set category = "Admin"
			set name = "Koed By"
			usr.koby=M
			usr<<"Your koby is now [usr.koby]."
		givebijuu(mob/M in world)
			set category = "Admin"
			set name = "Give Bijuu"
			var/U = input("Which one?(use what it is called exactly)") as text
			M.demon="[U]"
			usr<<"[M] Now has [U]"
		Giveems(mob/M in world)
			set category = "Admin"
			set name = "Give EMS"
			if(M.hasems<=0)
				M.hasems=1
				M.blindness=0
				spawn(1)
					M.blinding()
				M<<"You have attained Eteranl light and shal never go blind using your mangekyou."
			else
				usr<<"You take thier EMS."
				M.hasems=0
		changeelement(mob/M in world)
			set category = "Admin"
			set name = "Change Element"
			var/U = input("Which one?(use what it is called exactly)") as text
			M.element="[U]"
		giverandomms(mob/M in world)
			set category = "Admin"
			set name = "Random MS"
			M.mswho = pick("Madara","Sasuke","Itachi","Shisui","Obito","Other","Izuna")
			M<<"You now have a mangekyou sharingan similar to that of [M.mswho]."
			usr<<"[M] now has a mangekyou sharingan similar to that of [M.mswho]."

//use var time
obj
	skill
		acooldowntest
			verb
				cooldowntest()
					set category = "Skills"
					set name = "Test cooldown"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					if(usr.handseal(10,3))
						src.cooldown=world.time+50

					else
						usr<<"You failed the jutsu."


mob/admin7
	verb
		wipeall()
			set category = "Admin"
			set name  = "Wipe Server"
			var/U = input("Are you sure you want to delete all saves?(Type Yes)") as text
			if(U=="Yes")
				for(var/mob/M in world)
					if(M.client)
						M.cansave=0
				world<<"[usr]([usr.key]) is deleting all savefiles."
				if(fexists("World Save Files/"))
					fdel("World Save Files/")
					world<<"World Saves deleted!"
				if(fexists("TSCv3 players/"))
					fdel("TSCv3 players/")
					world<<"Player Saves deleted!"
				//fdel("[directory]/")
		wipereports()
			set category = "Admin"
			set name  = "Delete Reports"
			var/U = input("Are you sure you want to delete all reports?(Type Yes)") as text
			if(U=="Yes")
				usr<<"You deleted all reports."
				if(fexists("FileReports/"))
					fdel("FileReports/")
		maketester(mob/M in world)
			set category = "Admin"
			set name  = "Make Tester"
			if(M.key in testers)
				usr<<"They are already a current tester."
			else
				testers+=M.key
				usr<<"[M] is now a tester till the next reboot and is able to pick clans in testing."
				M<<"You are now a tester till the next reboot."
				world<<"[M] has achived Tester status."
		checkfor()
			set category = "Admin"
			set name  = "Check For Skill"
			var/U = input("What's the Jutsu name exactly?") as text
			if(U==""||U==null)
				return
			else
				usr<<"Checking mobs for the Jutsu [U]."
				for(var/mob/M in world)
					if(U in M.jutsus)
						usr<<"[M] has [U]."
					sleep(1)
mob/admin8
	verb
		makeadmin(mob/M in world)
			set category = "Admin"
			set name = "Make Admin"
			if(usr.admin<8)
				usr<<"You aren't qualified to use this verb."
				return
			if(M==usr)
				usr<<"You can't promote yourself."
				if(usr.admin<11)
					world<<"<b><font color=red>[usr] tried to promote themself as admin and badly failed, You may laugh."
					world<<"<b><font color=red>[usr] has been booted."
					del src
					return
			if(!M.client)
				usr<<"They need to be a actual player."
				return
			if(M.admin&&M.admin<usr.admin-1)
				world<<"<b><font color=red>[M] has been promoted as admin from level [M.admin] to level [M.admin+1]"
				M.admin+=1
			if(M.admin&&M.admin>usr.admin)
				usr<<"You can't promote someone who's a higher admin level than you."
				return
			if(M.admin==0)
				var/newlevel=input("What level admin?") as num
				newlevel=round(newlevel)
				if(newlevel<=0)
					newlevel=0
				if(newlevel<=0)
					return
				if(newlevel>usr.admin-1)
					usr<<"You can't bring them any higher than one level below yourself."
					newlevel=usr.admin-1
				world<<"<b><font color=red>[M] has been hired to the admin team as a level [newlevel] admin."
				M.admin=newlevel
		Create() //works fine, just unneeded
			set name = "Create"
			set category = "Admin"
			var/varItem
			var/varType = input(usr,"What do you want to create?","Create") in list("Object","Mob","Turf","Cancel")
			if(varType == "Cancel")
				return
			if(varType == "Object")
				varItem = input(usr,"What do you want to make?","Create obj") in list("Cancel") + typesof(/obj) //+ list("Cancel")
			if(varType == "Mob")
				varItem = input(usr,"What do you want to make?","Create mob") in list("Cancel") + typesof(/mob) //+ list("Cancel")
			if(varType == "Turf")
				varItem = input(usr,"What do you want to make?","Create turf") in list("Cancel") + typesof(/turf) //+ list("Cancel")
			if(varItem == "Cancel")
				return
			var/atom/O = new varItem(locate(src.x,src.y,src.z))
			view(usr)<<"[usr] waves their hand and [O] appears."

mob/tester
	verb
		healme()
			set category = "Tester"
			set name  = "Full Chakra"
			usr.chakra=usr.Mchakra
			usr.chakrapool=usr.chakrapoolmax
			usr<<"Your chakra has been restored."
		teleport(mob/M in world)
			set category = "Tester"
			set name  = "Teleport"
			usr.loc=M.loc
			usr<<"[usr] Tester teleported to [M]."
		getmoneyz()
			set category = "Tester"
			set name  = "Give Money"
			var/ammount=input("How Much") as num
			if(ammount>10000)
				usr<<"You can only give yourself 10,000 at a time."
				ammount=10000
			if(ammount<0)
				ammount=0
			ammount=round(ammount)
			usr<<"You give yourself [ammount] Yen."
			usr.yen+=ammount
		grablevels()
			set category = "Tester"
			set name  = "Gain Levels"
			if(usr.level>=31)
				usr<<"You don't need the levels now."
				return
			while(usr.level<=31)
				if(usr.level<=31)
					usr.exp+=usr.Mexp
					usr.level()
				sleep(1)
			world<<"[usr] Got their tester levels."




mob/owner
	verb
		givelevels(mob/M in world)
			set category = "Admin"
			set name  = "Give Levels"
			var/ammount=input("How many") as num
			if(ammount<=0)
				ammount=0
			if(ammount>300)
				ammount=300
			if(usr.key!="Joejoe13"&&ammount>200)
				ammount=200
			if(usr.key!="Joejoe13"&&M.level>=200)
				ammount=0
			while(ammount>0&&M.level<=299)
				M.exp+=M.Mexp
				M.level()
				ammount-=1
				sleep(1)
		makesosp(mob/M in world)
			set category = "Admin"
			set name  = "Make SOSP"
			if(usr.key!="Joejoe13")
				usr<<"This is really just a testing verb ask Joejoe13 about it, he can give you this."
				return
			else
				if(src.rikudoumode==0)
					var/Base='Icons/New Base/Base.dmi'
					Base+=rgb(156,156,156)
					M.icon=Base
					M.rikudoumode=1
					world<<"<font color = red><font size= 3>[M] <font color = green><font size= 2>has become a Sage of Six Paths!"
				else
					M.icon=M.Oicon
					world<<"<font color = red><font size= 3>[M] <font color = green><font size= 2>has lost their Sage of Six Paths powers!"
					M.rikudoumode=0
		checkowns(mob/M in world)
			set category = "Admin"
			set name  = "Who Owns"
			if(M.owner!="")
				usr<<"[M.owner] owns [M]."
			else
				usr<<"[M] has no owner."
		creatcorpse(mob/M in world)
			set category = "Admin"
			set name = "Create Corpse of"
			var/oldloc=M.loc
			M.loc=usr.loc
			M.corpsecreate()
			M.loc=oldloc
		koperson(mob/M in world)
			set category = "Admin"
			set name = "KO mob"
			if(M.client)
				M.chakra-=600000
			else
				M.health-=600000
			spawn(1)
				M.Death(usr)
		changeclan()
			set category = "Admin"
			set name  = "Change Clan"
			var/towhat=input("Change your clan to?") as text
			usr.clan=towhat
		changevillage()
			set category = "Admin"
			set name  = "Change Village"
			var/towhat=input("Change your Village to?") as text
			usr.village=towhat
		givemoney(mob/M in world)
			set category = "Admin"
			set name  = "Give Money"
			var/ammount=input("How Much") as num
			if(ammount>100000)
				usr<<"You can only give 100,000 at a time."
				ammount=100000
			if(ammount<0)
				ammount=0
			ammount=round(ammount)
			usr<<"You give [M] [ammount] Yen."
			M<<"[usr] gave you [ammount] Yen."
			M.yen+=ammount
		economy()
			set category = "Admin"
			set name  = "Check Economy"
			switch(input(usr,"What village would you like to see?")in list ("Leaf","Rain","Rock","Sound","Sand","Waterfall","Cloud","Mist"))
				if("Leaf")
					usr<<"Leaf has [LeafVillagePool] yen in it's village pool."
					usr<<"Leaf has a [LeafMissionTax]% tax on all it's missions."
					usr<<"Leaf has a [LeafOtherTax]% tax on all it's merchandice."
					usr<<"-------------------------------------------------------"
				if("Rain")
					usr<<"Rain has [RainVillagePool] yen in it's village pool."
					usr<<"Rain has a [RainMissionTax]% tax on all it's missions."
					usr<<"Rain has a [RainOtherTax]% tax on all it's merchandice."
					usr<<"-------------------------------------------------------"
				if("Rock")
					usr<<"Rock has [RockVillagePool] yen in it's village pool."
					usr<<"Rock has a [RockMissionTax]% tax on all it's missions."
					usr<<"Rock has a [RockOtherTax]% tax on all it's merchandice."
					usr<<"-------------------------------------------------------"
				if("Sound")
					usr<<"Sound has [SoundVillagePool] yen in it's village pool."
					usr<<"Soundhas a [SoundMissionTax]% tax on all it's missions."
					usr<<"Sound has a [SoundOtherTax]% tax on all it's merchandice."
					usr<<"-------------------------------------------------------"
				if("Sand")
					usr<<"Sand has [SandVillagePool] yen in it's village pool."
					usr<<"Sand has a [SandMissionTax]% tax on all it's missions."
					usr<<"Sand has a [SandOtherTax]% tax on all it's merchandice."
					usr<<"-------------------------------------------------------"
				if("Waterfall")
					usr<<"Waterfall has [WaterfallVillagePool] yen in it's village pool."
					usr<<"Waterfall has a [WaterfallMissionTax]% tax on all it's missions."
					usr<<"Waterfall has a [WaterfallOtherTax]% tax on all it's merchandice."
					usr<<"-------------------------------------------------------"
				if("Cloud")
					usr<<"Cloud has [CloudVillagePool] yen in it's village pool."
					usr<<"Cloud has a [CloudMissionTax]% tax on all it's missions."
					usr<<"Cloud has a [CloudOtherTax]% tax on all it's merchandice."
					usr<<"-------------------------------------------------------"
				if("Mist")
					usr<<"Mist has [MistVillagePool] yen in it's village pool."
					usr<<"Mist has a [MistMissionTax]% tax on all it's missions."
					usr<<"Mist has a [MistOtherTax]% tax on all it's merchandice."
					usr<<"-------------------------------------------------------"
		changetax()
			set category = "Admin"
			set name  = "Set Merchant Tax"
			var/T=0
			if(usr.village=="Leaf")
				T=LeafOtherTax
			if(usr.village=="Rock")
				T=RockOtherTax
			if(usr.village=="Rain")
				T=RainOtherTax
			if(usr.village=="Sound")
				T=SoundOtherTax
			if(usr.village=="Waterfall")
				T=WaterfallOtherTax
			if(usr.village=="Cloud")
				T=CloudOtherTax
			if(usr.village=="Sand")
				T=SandOtherTax
			var/M = input("Set the tax between 1 and 99%.(It's currently [T]%)") as num
			if(M<1)
				M=1
			if(M>99)
				M=99
			if(usr.village=="Leaf")
				LeafOtherTax=M
			if(usr.village=="Rock")
				RockOtherTax=M
			if(usr.village=="Rain")
				RainOtherTax=M
			if(usr.village=="Sound")
				SoundOtherTax=M
			if(usr.village=="Waterfall")
				WaterfallOtherTax=M
			if(usr.village=="Cloud")
				CloudOtherTax=M
			if(usr.village=="Sand")
				SandOtherTax=M
			usr<<"The [usr.village] village merchant tax has been set to [M]% on every purchance."
		HireMerchants()
			set category = "Admin"
			set name  = "Hire Merchants"
			if(usr.key=="Joejoe13")
				var/T=null
				//usr.village="Leaf"
				if(usr.village=="Leaf")
					T=LeafVillagePool
				if(usr.village=="Rock")
					T=RockVillagePool
				if(usr.village=="Rain")
					T=RainVillagePool
				if(usr.village=="Sound")
					T=SoundVillagePool
				if(usr.village=="Waterfall")
					T=WaterfallVillagePool
				if(usr.village=="Cloud")
					T=CloudVillagePool
				if(usr.village=="Sand")
					T=SandVillagePool
				for(var/mob/sellers/M in world)
					if(M.village==usr.village&&M.ko&&M.merchant&&T>1000)
						M.ko=0
						M.icon_state=""
						M.dir=SOUTH
						T-=1000
						M.health=1000000
				SaveVillageStuff()
				usr<<"You rehired all missing merchants."
mob/admin1
	verb
		GMOOC(msg as text)
			set category = "Admin"
			set name = "Admin OOC"
			for(var/mob/M in world)
				if(M.client&&M.admin>0)
					M<<"<b>(Admin OOC){Rank: [usr.admin]} [usr]: [msg] </b>"
				//sleep(0.1)
		Assess(mob/M in world)
			set category = "Admin"
			set name  = "Assess"
			usr<<"[M]'s Health is [M.health]/[M.Mhealth]"
			usr<<"[M]'s Chakra is [M.chakra]/[M.Mchakra](Resvoir:[M.chakrapool]/[M.chakrapoolmax])"
			usr<<"[M]'s Clan is [M.clan]"
			usr<<"[M]'s Rank is [M.rank]"
			usr<<"[M]'s Interanl damage is [M.koamm]"
			usr<<"[M]'s Main element is [M.element]"
			usr<<"[M]'s level is [M.level]"
			usr<<"[M]'s experience is [M.exp]/[M.Mexp]"
			if(usr.admin>=7)
				if(M.rinnepoten)
					usr<<"[M] has Rinnegan Potential."
				if(M.hasms&&M.hasems==0)
					usr<<"[M] has the Mangekyou Sharingan."
				if(M.hasems)
					usr<<"[M] has the Eternal Mangekyou Sharingan."
		teleport(var/mob/T in world)
			set category = "Admin"
			set name  = "Teleport"
			usr.loc=T.loc
			usr<<"You teleport to [T]."
		summon(var/mob/T in world)
			set category = "Admin"
			set name  = "Summon"
			T.loc=usr.loc
			T<<"[usr] has summoned you."
		checkowns(mob/M in world)
			set category = "Admin"
			set name  = "Who Owns"
			if(M.owner!="")
				usr<<"[M.owner] owns [M]."
			else
				usr<<"[M] has no owner."
mob/admin2
	verb
		revive(mob/M in world)
			set category = "Admin"
			set name  = "Restore"
			M.health=M.Mhealth
			M.chakra=M.Mchakra
			M.chakrapool=M.chakrapoolmax
			if(M.poolmulti==0)
				M.poolmulti=pick(2.1,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,3,3.1,3.2,3.4,3.5,2.1,2.3,2.4,2.1)
				if(prob(6))
					M.poolmulti=pick(3.6,3.7,3.8,3.9,4,3.9,3.8,3.7,3.6)
			M.koamm=0
			M.ko=0
			M.HealGateTime=0
			usr<<"You restore [M]"
			M<<"There, you're restored happy?"
		Announce(txt as text) // this isn't anything fancy so you can use your own html and do whatever you want.
			set name = "Announce"
			set category = "Admin"
			world << "<font face=verdana><font size=3><b><center>[usr] would like to announce:<center><font color=silver size = 2>[txt]</font>"

mob/admin3
	verb
		guesttoggle()
			set category = "Admin"
			set name = "Guest Toggle"
			if(allowguest==1)
				world<<"[usr] has disabled guest logins."
				allowguest=0
			else
				world<<"[usr] has allowed guest logins."
				allowguest=1
		movelist(mob/M in world)
			set category = "Admin"
			set name = "See Jutsu"
			for(var/T in M.jutsus)
				if(T)
					usr<<"[M] has [T]"
					if(T=="Gates")
						usr<<"[M] has [M.hasgates] gates useable."
				sleep(4)
		Reboot2()
			set category = "Admin"
			set name = "Reboot"
			switch(alert("Are you sure you want to reboot the world?","Reboot World","No","Yes"))
				if("Yes")
					goto Yes
				if("No")
					return
			Yes
			var/Time=input("How Long Till Reboot?")in list("Reboot Now","Set Time Reboot")
			var/reason=""
			if(Time=="Set Time Reboot")
				reason=input("What is the Reason For the Reboot?")in list("None","Update")
			if(Time=="Reboot Now")
				world<<"World Rebooting in 5 seconds."
				sleep(50)
				world.Reboot()
			if(Time=="Set Time Reboot")
				TryAgain
				var/TType=alert("Select Time: Seconds or Minutes.","Select Time","Seconds","Minutes")
				var/TTime=input("Select Amount Of Time. (In [TType])")as num
				var/ANNC="<font color=red><b>Server Announcement:</b><font color=blue>"
				if(TTime<=0)
					usr<<"Please Enter A Valid Number"
					goto TryAgain
				if(TType=="Seconds")
					TTime*=10
				if(TType=="Minutes")
					TTime=(TTime*10)*60
				if(reason=="Update")
					world<<"[ANNC] Due to a pending Update the server will soon reboot."
				else
					world<<"[usr] started up a Reboot."
				spawn(20)
					worldreboot(TTime)
					/*world<<"[ANNC] World Rebooting In [TTime/10] Seconds, or [TTime/600] Minutes."
					TTime-=6000
					sleep(6000)
				while(TTime>600)
					world<<"[ANNC] World Rebooting In [TTime/10] Seconds, or [TTime/600] Minutes."
					TTime-=600
					sleep(600)
				while(TTime>100)
					world<<"[ANNC] World Rebooting In [TTime/10] Seconds."
					TTime-=100
					sleep(100)
				while(TTime>=10)
					world<<"[ANNC] World Rebooting In [TTime/10] Seconds."
					TTime-=10
					sleep(10)
				world<<"[ANNC] World Rebooting Now!"
				spawn(2)
				world.Reboot()*/
mob/admin4
	verb
		changelogin()
			set category = "Admin"
			set name = "Change Login"
			var/towhat=input("Change your login to?") as text
			usr.loginmge=towhat




