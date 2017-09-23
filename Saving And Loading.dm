mob
	var
		cansave=1

mob
	proc
		PwipeS()
			switch(input(src,"Are you sure you woild like to delete your save? It CAN NOT be reversed or restored after.")in list ("Yes","No"))
				if("Yes")
					if(fexists("TSCv3 players/[src.key].sav"))
						fdel("TSCv3 players/[src.key].sav")
						alert("Your character has been deleted!")
						src.start()
					else
						alert("You have no savefile to delete.")
						src.start()
						return
				if("No")
					alert("Wise decision.")
					src.start()
					return
mob/var/list
	V



mob
	proc
		AutoSave()
			if(src.cansave)
				src.SaveK()
				spawn(1800)
					if(src)
						src.AutoSave()



mob
	proc
		Backupsaves()
			if(src&&src.cansave)
				var/savefile/F = new("Back up saves(TSCv3)/[src.key].sav")
				//src.V = src.contents
				src.xco = src.x
				src.yco = src.y
				src.zco = src.z
				Write(F)
				//src << "<font color=red><b>Your game has been saved!"




mob
	proc
		PwipeS2()
			if(fexists("TSCv3 players/[src.key].sav"))
				fdel("TSCv3 players/[src.key].sav")
				alert("Your character has been deleted!")




mob
	proc
		SaveK()
			if(src&&src.client&&src.cansave)
				var/savefile/F = new("TSCv3 players/[src.key].sav")
				src.xco = src.x
				src.yco = src.y
				src.zco = src.z
				if(F=="TSCv3 players/.sav")
					return
				Write(F)


mob
	proc
		savecheck()
			set background = 1
			if(fexists("TSCv3 players/[src.key].sav"))
				alert("You must delete your old character first.")
				src.start()
				return
			else
				//src.Clan_Select()
				//src.chanse()
				//src.namenote()
				src.Gender()
				src.Name()
				src.invitecredit()
				//src.Name()
				/*usr.startloc()
				src.aligpick()
				src.Greatest_Stat()
				src.child2()
				if(!src.beingborn)
					src.birthcheck()
				else
					src.beingborn=0
				src.startclothes()*/
				src.SaveK()
				spawn(30)
					usr.nregen()
				spawn(30)
					usr.Greatest_Stat()
				spawn(50)
					src.AutoSave()
				var/list/H=list()
				for(var/turf/start1/T in world)
					H.Add(T)
					sleep(0.1)
				src.loc=pick(H)
				src.missiondestination = locate(16,196,26)
				world<<"<font size=2><font color=red><B>World News: <font color=red>[src.key] <font color=red>has joined the game for the first time, lets welcome them."
				//src.loc=locate(1,1,1)



mob
	var
		tmp/loaded=0


mob
	verb
		Savenow()
			set name ="Save"
			if(src&&src.client&&src.cansave)
				var/savefile/F = new("TSCv3 players/[src.key].sav")
				//usr.V = usr.contents
				src.xco = src.x
				src.yco = src.y
				src.zco = src.z
				if(F=="TSCv3 players/.sav")
					return
				Write(F)
				spawn(10) src << "<font color=red><b>Your game has been saved!"
mob
	proc
		LoadPlayer()
			if(fexists("TSCv3 players/[src.key].sav"))
				var/savefile/F = new("TSCv3 players/[src.key].sav")
				//for(var/mob/s in src.V)
					//src.contents += s
				Read(F)
				spawn(1)
					if(src.admin<=3)
						world<<"<font size=1><font color=red><B>World News: <font color=red>[src.key] <font color=green>has joined the game."
					else
						if(src.loginmge!="")
							world<<"<font size=2><font color=red><B>World News: <font color=red>[src.key] <font color=green>[src.loginmge]."
						else
							world<<"<font size=1><font color=red><B>World News: <font color=red>[src.key] <font color=green>has joined the game."
				src.loaded=1
				src.loc = locate(xco,yco,zco)
				src.cansave=1
				src.Frozen = 0
				src.AutoSave()
				src.cregen=src.oldcregen
				var/matrix/M = matrix()
				M.Scale(1)
				src.transform = M
				//src.logincrap()
				spawn(50)
					if( (src.key in fan) &&src.gotfanreward==0)
						src<<"For being a fan of the hub you recieve some exp and money."
						src.exp+=1000
						src.yen+=5000
						src.gotfanreward=1
						src.AwardMedal("I'm a fan!")
			else
				alert("You dont have a character to load!")
				src.start()


world/New() //When the world begins :O
	..() //Let it do it's usual crap, THEN!
	spawn(1)
		while(src)
			Show_Fans()
			sleep(6000)
	LoadLeaders() //Load our leaders!
	LoadVillageStuff()


//Db's God Like Shyt We Can Barely Begin To Understand...
var/list/Leaders = list("Hokage","Mizukage","Tsuchikage","Raikage","Kazekage","Amekoutei","Otokami","Kusakami","Tousoukuro") //List containing the names of all the different Kage ranks
proc/LoadLeaders() //Proc to load the Leaders into their lists
	if(fexists("Kages.sav")) //If the Kage list is actually there
		var/savefile/F = new("Kages.sav") //Load it, cos we need it :)
		F["KageList"] >> Leaders //Export its contents to our list so we can use it =D

proc/UpdateLeaders() //Proc to save our Leaders to their save file =P
	var/savefile/F = new("Kages.sav") //Make a new one if it doesn't exist, if it does, use it =P
	F["KageList"] << Leaders //Save our list to the save file =P




//have clan houses with people inside of no clan, when the clan hosue is taken the person inside takes the clan of the person who bought it
//people who now create if that clan house if in the world they will belong to the village its in
//







//all muchants of a village will have a merchannt var = to 1
//the murchants can be stolen from if they are killed
//when they die they just stay down and half their profits will be given to the person who killed him
//in order for them to get back up and be able to sell again the village has to pay for a ne wmurchant  but it'll be the same one but they will just be healed
//village has to buy guards, use village npc spawners to do so
//---when attemptign to buy them system counts how many guards there are, if u have more than 15 you cant buy more till you have less, they delete when they die



///2 taxes, Mission tax and other tax, tax for missions only come from missions and othe rtax comes from everything else



//permits are given to those allowed to enter a village by the kage and council, allowing them to enter and leave without alerting the village members



/////



mob/var/list/VillagePermits = list()
//var/list/VillagesAtWar = list()
//Village Variables

proc
	SaveVillageStuff()
		var/savefile/F = new("World Save Files/VillageStuff.sav")


		F["Hokage"] << Hokage
		F["LeafVillagePool"] << LeafVillagePool
		F["LeafMissionTax"] << LeafMissionTax
		F["LeafOtherTax"] << LeafOtherTax
		///----------------------------------------------
		F["Tsuchikage"] << Tsuchikage
		F["RockVillagePool"] << RockVillagePool
		F["RockMissionTax"] << RockMissionTax
		F["RockOtherTax"] << RockOtherTax
		///----------------------------------------------
		F["Amekoutei"] << Amekoutei
		F["RainVillagePool"] << RainVillagePool
		F["RainMissionTax"] << RainMissionTax
		F["RainOtherTax"] << RainOtherTax
		///----------------------------------------------
		F["Otokami"] << Otokami
		F["SoundVillagePool"] << SoundVillagePool
		F["SoundMissionTax"] << SoundMissionTax
		F["SoundOtherTax"] << SoundOtherTax
		///----------------------------------------------
		F["Kazekage"] << Kazekage
		F["SandVillagePool"] << SandVillagePool
		F["SandMissionTax"] << SandMissionTax
		F["SandOtherTax"] << SandOtherTax

		/////////-----------------------------------------
		F["Raikage"] << Raikage
		F["CloudVillagePool"] << CloudVillagePool
		F["CloudMissionTax"] << CloudMissionTax
		F["CloudOtherTax"] << CloudOtherTax

		/////////-----------------------------------------
		F["Mizukage"] << Mizukage
		F["MistVillagePool"] << MistVillagePool
		F["MistMissionTax"] << MistMissionTax
		F["MistOtherTax"] << MistOtherTax

		///////-------------------------------------------


	LoadVillageStuff()
		if(fexists("World Save Files/VillageStuff.sav"))
			var/savefile/F = new("World Save Files/VillageStuff.sav")
			if(F)

				F["Hokage"] >> Hokage
				F["LeafVillagePool"] >> LeafVillagePool
				F["LeafMissionTax"] >> LeafMissionTax
				F["LeafOtherTax"] >> LeafOtherTax
				///-----------------------------------------
				F["Tsuchikage"] >> Tsuchikage
				F["RockVillagePool"] >> RockVillagePool
				F["RockMissionTax"] >> RockMissionTax
				F["RockOtherTax"] >> RockOtherTax
				//------------------------------------------
				F["Amekoutei"] >> Amekoutei
				F["RainVillagePool"] >> RainVillagePool
				F["RainMissionTax"] >> RainMissionTax
				F["RainOtherTax"] >> RainOtherTax
				///-----------------------------------------
				F["Otokami"] >> Otokami
				F["SoundVillagePool"] >> SoundVillagePool
				F["SoundMissionTax"] >> SoundMissionTax
				F["SoundOtherTax"] >> SoundOtherTax
				///-----------------------------------------
				F["Kazekage"] >> Kazekage
				F["SandVillagePool"] >> SandVillagePool
				F["SandMissionTax"] >> SandMissionTax
				F["SandOtherTax"] >> SandOtherTax

				/////////-----------------------------------------
				F["Raikage"] >> Raikage
				F["CloudVillagePool"] >> CloudVillagePool
				F["CloudMissionTax"] >> CloudMissionTax
				F["CloudOtherTax"] >> CloudOtherTax

				/////////-----------------------------------------
				F["Mizukage"] >> Mizukage
				F["MistVillagePool"] >> MistVillagePool
				F["MistMissionTax"] >> MistMissionTax
				F["MistOtherTax"] >> MistOtherTax


