var
	Hokage
	Amekoutei
	Tsuchikage
	Otokami
	Kazekage
	Raikage
	Mizukage

	LeafVillagePool=5000  //We need a more efficient way to do this. Try asking DB about Params or something
	RockVillagePool=5000  //I Couldn't for the life of me begin to understand them, but this is too many vars.
	SoundVillagePool=5000
	RainVillagePool=5000
	WaterfallVillagePool=5000
	CloudVillagePool=5000
	SandVillagePool=5000
	MistVillagePool=5000

	LeafMissionTax=10
	LeafOtherTax=15
///
	RockMissionTax=10
	RockOtherTax=15
///
	RainMissionTax=10
	RainOtherTax=15
///
	SoundMissionTax=10
	SoundOtherTax=15
///
	WaterfallMissionTax=15
	WaterfallOtherTax=15

	CloudMissionTax=10
	CloudOtherTax=15

	SandMissionTax=10
	SandOtherTax=15


	MistMissionTax=10
	MistOtherTax=15



	LeafPayment=0
	SoundPayment=0
	RockPayment=0
	RainPayment=0




//waterfall, cloud and sand


/*



mob/Kage/verb/
	Set_Tax()
		set category="Village"
		set desc="Determine taxes on certain things in the village"
		switch(input(usr,"What would you like to change the taxes on?") in list("Missions","Food","Clothing","Weapons"))
			if("Missions")
				var/I=input(usr,"What percentage of all mission earnings should go to the village pool?") as num
				if(I<0) I=0
				if(I>99) I=99
				usr<<"Mission Tax: [I]% of all mission income will be sent to the village's pool."
				//usr.[usr.Village]MTax=I //Wanted to do it this way..but didn't work. See if you can try?
				if(usr.Village=="Leaf") LeafMTax=I
				if(usr.Village=="Rock") RockMTax=I
				if(usr.Village=="Rain") RainMTax=I
				if(usr.Village=="Sound") SoundMTax=I
				SaveVillageStuff()
			if("Food")
				var/I=input(usr,"What percentage of all food earnings should go to the village pool?") as num
				if(I<0) I=0
				if(I>99) I=99
				usr<<"Food Tax: [I]% of all food income will be sent to the village's pool. This will also raise the standard price of food."
				//usr.[usr.Village]FTax=I
				if(usr.Village=="Leaf") LeafFTax=I
				if(usr.Village=="Rock") RockFTax=I
				if(usr.Village=="Rain") RainFTax=I
				if(usr.Village=="Sound") SoundFTax=I
				SaveVillageStuff()
			if("Clothing")
				var/I=input(usr,"What percentage of all clothing earnings should go to the village pool?") as num
				if(I<0) I=0
				if(I>99) I=99
				usr<<"Clothing Tax: [I]% of all icon from purchased clothing will be sent to the village's pool. This will also raise the standard price of clothing."
				//usr.[usr.Village]CTax=I
				if(usr.Village=="Leaf") LeafCTax=I
				if(usr.Village=="Rock") RockCTax=I
				if(usr.Village=="Rain") RainCTax=I
				if(usr.Village=="Sound") SoundCTax=I
				SaveVillageStuff()
			if("Weapons")
				var/I=input(usr,"What percentage of all weapon earnings should go to the village pool?") as num
				if(I<0) I=0
				if(I>99) I=99
				usr<<"Weapons Tax: [I]% of all weapons income will be sent to the village's pool. This will also raise the standard price of weapons."
				//usr.[usr.Village]WTax=I
				if(usr.Village=="Leaf") LeafWTax=I
				if(usr.Village=="Rock") RockWTax=I
				if(usr.Village=="Rain") RainWTax=I
				if(usr.Village=="Sound") SoundWTax=I
				SaveVillageStuff()












*/




























/*


mob
	var
		tmp/logintime
		totaltime
	verb
		Time_Played()
			var/totalplay=world.time-usr.logintime
			totalplay+=usr.totaltime
			var/secs=round(totalplay/10)
			var/mins=round(secs/60)
			secs-=mins*60
			var/hours=round(mins/60)
			mins-=hours*60
			var/days=round(hours/24)
			hours-=days*24
			src<<"<font color=silver><small>You have been playing for [days] Days, [hours] Hours, [mins] Minutes, and [secs] Seconds."


var
	LeafBank=10000
	SandBank=10000
	MistBank=10000
	CloudBank=10000
	RockBank=10000
	LeafWar
	SandWar
	MistWar


	LVGuardTP=1
	LVGuardT=100
	LETeachersTP=0
	LETeachersT=100
	LMedicalNinTP=0
	LMedicalNinT=100

	MVGuardTP=1
	MVGuardT=100
	METeachersTP=0
	METeachersT=100
	MMedicalNinTP=0
	MMedicalNinT=100

	SVGuardTP=1
	SVGuardT=100
	SETeachersTP=0
	SETeachersT=100
	SMedicalNinTP=0
	SMedicalNinT=100

	CVGuardTP=1
	CVGuardT=100
	CETeachersTP=0
	CETeachersT=100
	CMedicalNinTP=0
	CMedicalNinT=100

	RVGuardTP=1
	RVGuardT=100
	RETeachersTP=0
	RETeachersT=100
	RMedicalNinTP=0
	RMedicalNinT=100

mob/var
	Taxtime=1
	Taxamount=0
	Taxpaid=1
	Bootable=0
	Taxtimewait

mob/proc
	AddBounty(amount)
		usr.Bounty+=amount
		usr<<"<font size=1><font color=#FF8C00><b>Your bounty has incressed!"



mob/proc
	AddReputation(amount,To)
		if(To=="Leaf")
			src.Lreputation+=amount
			if(src.Lreputation>300)
				src.Lreputation=300
			src<<"<font size=1><font color=#FF8C00><b>Your Leaf Village reputation has incressed!"
		if(To=="Sand")
			src.Sreputation+=amount
			if(src.Sreputation>300)
				src.Sreputation=300
			src<<"<font size=1><font color=#FF8C00><b>Your Sand Village reputation has incressed!"
		if(To=="Mist")
			src.Mreputation+=amount
			if(src.Mreputation>300)
				src.Mreputation=300
			src<<"<font size=1><font color=#FF8C00><b>Your Mist Village reputation has incressed!"
		if(To=="Cloud")
			src.Creputation+=amount
			if(src.Creputation>300)
				src.Creputation=300
			src<<"<font size=1><font color=#FF8C00><b>Your Cloud Village reputation has incressed!"
		if(To=="Rock")
			src.Rreputation+=amount
			if(src.Rreputation>300)
				src.Rreputation=300
			src<<"<font size=1><font color=#FF8C00><b>Your Rock Village reputation has incressed!"

		else
			return

	SubReputation(amount,To)
		if(To=="Leaf")
			src.Lreputation-=amount
			if(src.Lreputation<0)
				src.Lreputation=0
				if(src.Village == "Leaf")
					src.Village = "Missing"
					src<<"<font size=1><font color=#FF8C00><b>You have been booted from Leaf Village!"
			src<<"<font size=1><font color=#FF8C00><b>Your Leaf Village reputation has decressed!"
		if(To=="Sand")
			src.Sreputation-=amount
			if(src.Sreputation<0)
				src.Sreputation=0
				if(src.Village == "Sand")
					src.Village = "Missing"
					src<<"<font size=1><font color=#FF8C00><b>You have been booted from Sand Village!"
			src<<"<font size=1><font color=#FF8C00><b>Your Sand Village reputation has decressed!"
		if(To=="Mist")
			src.Mreputation-=amount
			if(src.Mreputation<0)
				src.Mreputation=0
				if(src.Village == "Mist")
					src.Village = "Missing"
					src<<"<font size=1><font color=#FF8C00><b>You have been booted from Mist Village!"
			src<<"<font size=1><font color=#FF8C00><b>Your Mist Village reputation has decressed!"
		if(To=="Cloud")
			src.Creputation-=amount
			if(src.Creputation<0)
				src.Creputation=0
				if(src.Village == "Cloud")
					src.Village = "Missing"
					src<<"<font size=1><font color=#FF8C00><b>You have been booted from Cloud Village!"
			src<<"<font size=1><font color=#FF8C00><b>Your Cloud Village reputation has decressed!"
		if(To=="Rock")
			src.Rreputation-=amount
			if(src.Rreputation<0)
				src.Rreputation=0
				if(src.Village == "Rock")
					src.Village = "Missing"
					src<<"<font size=1><font color=#FF8C00><b>You have been booted from Rock Village!"
			src<<"<font size=1><font color=#FF8C00><b>Your Rock Village reputation has decressed!"

		else
			return


mob/proc
	Tax_Check()
		if(src.Village=="Missing")
			return
		var/totalplay=world.time-src.logintime
		totalplay+=src.totaltime
		var/secs=round(totalplay/10)
		var/mins=round(secs/60)
		secs-=mins*60
		var/hours=round(mins/60)
		mins-=hours*60
		var/days=round(hours/24)
		hours-=days*24
		if(src.Taxtime)
			if(src.Taxpaid)
				if(hours==3&&src.Taxtimewait!=hours)
					src.Taxpaid=0
				if(hours==6&&src.Taxtimewait!=hours)
					src.Taxpaid=0
				if(hours==9&&src.Taxtimewait!=hours)
					src.Taxpaid=0
				if(hours==12&&src.Taxtimewait!=hours)
					src.Taxpaid=0
				if(hours==15&&src.Taxtimewait!=hours)
					src.Taxpaid=0
				if(hours==18&&src.Taxtimewait!=hours)
					src.Taxpaid=0
				if(hours==21&&src.Taxtimewait!=hours)
					src.Taxpaid=0
				if(hours==24&&src.Taxtimewait!=hours)
					src.Taxpaid=0
				if(!src.Taxpaid)
					src.Taxamount += (src.Ryo+src.bankaccount)/10
					if(src.Taxamount<1)
						src.Taxamount=1
					src<<"<font color=#FF8C00><font size=2>Your Taxes Are Due.Click <b>Pay Taxes</b> in your Taxes Tab and Pay [src.Taxamount] Ryo."
					src.verbs+= new /mob/Taxes/verb/Pay_Taxes
					if(src.rank=="Kage")
						if(src.Village=="Leaf")
							LVGuardTP=0
							LETeachersTP=0
							LMedicalNinTP=0
							src<<"<font color=#FF8C00><font size=2>You will also need to pay Village Guards [LVGuardT] Ryo, Exam Teachers [LETeachersT] Ryo and , Medical Power [LMedicalNinT] Ryo.(Failure to Pay taxes will result in strikes.)"

						if(src.Village=="Sand")
							SVGuardTP=0
							SETeachersTP=0
							SMedicalNinTP=0
							src<<"<font color=#FF8C00><font size=2>You will also need to pay Village Guards [LVGuardT] Ryo, Exam Teachers [LETeachersT] Ryo and , Medical Power [LMedicalNinT] Ryo.(Failure to Pay taxes will result in strikes.)"

						if(src.Village=="Mist")
							MVGuardTP=0
							METeachersTP=0
							MMedicalNinTP=0
							src<<"<font color=#FF8C00><font size=2>You will also need to pay Village Guards [LVGuardT] Ryo, Exam Teachers [LETeachersT] Ryo and , Medical Power [LMedicalNinT] Ryo.(Failure to Pay taxes will result in strikes.)"

						if(src.Village=="Cloud")
							CVGuardTP=0
							CETeachersTP=0
							CMedicalNinTP=0
							src<<"<font color=#FF8C00><font size=2>You will also need to pay Village Guards [LVGuardT] Ryo, Exam Teachers [LETeachersT] Ryo and , Medical Power [LMedicalNinT] Ryo.(Failure to Pay taxes will result in strikes.)"

						if(src.Village=="Rock")
							RVGuardTP=0
							RETeachersTP=0
							RMedicalNinTP=0
							src<<"<font color=#FF8C00><font size=2>You will also need to pay Village Guards [LVGuardT] Ryo, Exam Teachers [LETeachersT] Ryo and , Medical Power [LMedicalNinT] Ryo.(Failure to Pay taxes will result in strikes.)"

					return
				else
					return
			else
				if(hours==4&&!src.said1)
					src<<"<font color=#FF8C00><font size=2>Final Warning:Your Taxes Are Due.Click <b>Pay Taxes</b> in your Taxes Tab and Pay [src.Taxamount] Ryo."
					src.said1=1
				if(hours==5)
					src<<"<font color=#FF8C00><font size=4>You have not paid your taxes to the village!"
					src.SubReputation(3,src.Village)
					src.Taxpaid=1
					src.said1=0
				if(hours==7&&!src.said1)
					src<<"<font color=#FF8C00><font size=2>Final Warning:Your Taxes Are Due.Click <b>Pay Taxes</b> in your Taxes Tab and Pay [src.Taxamount] Ryo."
					src.said1=1
				if(hours==8)
					src<<"<font color=#FF8C00><font size=4>You have not paid your taxes to the village!"
					src.SubReputation(3,src.Village)
					src.Taxpaid=1
					src.said1=0
				if(hours==10&&!src.said1)
					src<<"<font color=#FF8C00><font size=2>Final Warning:Your Taxes Are Due.Click <b>Pay Taxes</b> in your Taxes Tab and Pay [src.Taxamount] Ryo."
					src.said1=1
				if(hours==11)
					src<<"<font color=#FF8C00><font size=4>You have not paid your taxes to the village!"
					src.SubReputation(3,src.Village)
					src.Taxpaid=1
					src.said1=0
				if(hours==13&&!src.said1)
					src<<"<font color=#FF8C00><font size=2>Final Warning:Your Taxes Are Due.Click <b>Pay Taxes</b> in your Taxes Tab and Pay [src.Taxamount] Ryo."
					src.said1=1
				if(hours==14)
					src<<"<font color=#FF8C00><font size=4>You have not paid your taxes to the village!"
					src.SubReputation(3,src.Village)
					src.Taxpaid=1
					src.said1=0
				if(hours==16&&!src.said1)
					src<<"<font color=#FF8C00><font size=2>Final Warning:Your Taxes Are Due.Click <b>Pay Taxes</b> in your Taxes Tab and Pay [src.Taxamount] Ryo."
					src.said1=1
				if(hours==17)
					src<<"<font color=#FF8C00><font size=4>You have not paid your taxes to the village!"
					src.SubReputation(3,src.Village)
					src.Taxpaid=1
					src.said1=0
				if(hours==19&&!src.said1)
					src<<"<font color=#FF8C00><font size=2>Final Warning:Your Taxes Are Due.Click <b>Pay Taxes</b> in your Taxes Tab and Pay [src.Taxamount] Ryo."
					src.said1=1
				if(hours==20)
					src<<"<font color=#FF8C00><font size=4>You have not paid your taxes to the village!"
					src.SubReputation(3,src.Village)
					src.Taxpaid=1
					src.said1=0
				if(hours==22&&!src.said1)
					src<<"<font color=#FF8C00><font size=2>Final Warning:Your Taxes Are Due.Click <b>Pay Taxes</b> in your Taxes Tab and Pay [src.Taxamount] Ryo."
					src.said1=1
				if(hours==23)
					src<<"<font color=#FF8C00><font size=4>You have not paid your taxes to the village!"
					src.SubReputation(3,src.Village)
					src.Taxpaid=1
					src.said1=0
				if(hours==1&&!src.said1)
					src<<"<font color=#FF8C00><font size=2>Final Warning:Your Taxes Are Due.Click <b>Pay Taxes</b> in your Taxes Tab and Pay [src.Taxamount] Ryo."
					src.said1=1
				if(hours==2)
					src<<"<font color=#FF8C00><font size=4>You have not paid your taxes to the village!"
					src.SubReputation(3,src.Village)
					src.Taxpaid=1
					src.said1=0


mob/Teacher/Banker
	name = "Banker"
	icon='BBody.dmi'
	PK = 0
	HPH = 9999999999999999999999999999999999999999999999
	verb
		Deposit_Ryo()
			set src in oview(2)
			set category  = "Banker"
			var/heh = input("You have [usr.Ryo] Ryo. How much of it do you wish to deposit?","Deposit") as num
			if (heh < 0)
				alert("You can't withdraw less then 1 Ryo!","bank Keeper")
				return()
			if (heh > usr.Ryo)
				alert("You don't have that much Ryo!", "Deposit")
				return()

			usr << "You deposit [heh] Ryo."
			usr.Ryo -= heh
			usr.bankaccount += heh
			return()
		Withdraw_Ryo()
			set src in oview(2)
			set category  = "Banker"
			var/heh = input("You have [usr.bankaccount] Ryo in your bank. How much do you wish to withdraw?","Withdraw") as num
			if (heh < 0)
				alert("You can't withdraw less then 1 Ryo!","Bank")
				return()
			if (heh > usr.bankaccount)
				alert("You don't have that much yen in the bank!", "Bank")
				return()
			usr << "You withdraw [heh] Ryo."
			usr.Ryo += heh
			usr.bankaccount -= heh
			return()
		Check_Balance()
			set src in oview(2)
			set category  = "Banker"
			usr << "You have [usr.bankaccount] Ryo in your bank."
		Send_Ryo(mob/M in world)
			set src in oview(2)
			set category  = "Banker"
			var/give = input("How much Ryo do you wish to send [M]?")as num
			if(M.Village!=usr.Village)
				usr<<"You are not allowed to send yen outside of your village."
				return
			if(M==usr)
				usr<<"You cannot do that"
				return
			if(usr.client.address == M.client.address)
				usr<<"No Sending money through same IP!"
				return
			if(usr.Level<5)
				usr<<"You must be at least level 5 to send money"
				return
			if(M.client)
				if(give>usr.Ryo)
					usr<<"You don't have that much to give"
					return
				if(give<=0)
					usr<<"You cannot do that."
					return
				if(give<usr.Ryo)
					usr.Ryo-=give
					M.bankaccount+=give
					usr<<"Your Transaction Was Successful!"
					M<<"[usr] has sent you [give] Ryo!"
					give=0
				M.Save()
				usr.Save()
				return
mob/Taxes
	verb
		Pay_Taxes()
			set category  = "Taxes"
			if(!usr.Taxpaid)
				if(usr.Ryo>=usr.Taxamount)
					usr.Ryo-=usr.Taxamount
					if(usr.Village=="Leaf")
						LeafBank+=usr.Taxamount
						usr.Taxamount=0
					if(usr.Village=="Sand")
						SandBank+=usr.Taxamount
						usr.Taxamount=0
					if(usr.Village=="Mist")
						MistBank+=usr.Taxamount
						usr.Taxamount=0
					if(usr.Village=="Cloud")
						CloudBank+=usr.Taxamount
						usr.Taxamount=0
					if(usr.Village=="Rock")
						RockBank+=usr.Taxamount
						usr.Taxamount=0
					usr.Taxpaid=1
					usr.said1=0
					var/totalplay=world.time-usr.logintime
					totalplay+=usr.totaltime
					var/secs=round(totalplay/10)
					var/mins=round(secs/60)
					secs-=mins*60
					var/hours=round(mins/60)
					mins-=hours*60
					var/days=round(hours/24)
					hours-=days*24
					usr.Taxtimewait = hours
					usr<<"Your Tax payment was Successful!"
					usr.verbs-= new /mob/Taxes/verb/Pay_Taxes
					for(var/obj/quests/TaskTaxes/A in usr.contents)
						del(A)
				else
					usr<<"You do not have enough money to pay.Your taxes [usr.Ryo]/[usr.Taxamount]!"
			else
				usr<<"You have already paid your taxes!"
				return

mob
	var/list/contents2
obj/items
	Nevermind


mob/var
	bankaccount
	said1













*/