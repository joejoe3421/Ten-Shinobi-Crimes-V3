
//council handles taxes while Kage handles hiring guards and salesman

mob
	var
		profession=""
		villagemoral=0


mob//make a world proc connect to a object so it can have a cooldown
	verb
		votecouncil()
			var/people=0
			var/canidates = list()
			for(var/mob/M in world)
				if(M.village==usr.village)
					if(M!=usr&&M.client)
						if(M.rank!="Civilan"||M.rank!="Academy Student"||M.rank!="Genin"||M.profession!="Council")
							canidates += M
							people+=1
			if(people<=0)
				usr<<"There is no one in your village to vote to council."
				return
			//var/canidates = list()
			var/mob/M = input("Who to vote to council?","Council Vote") in list("No one") + canidates// + list("Cancel")
			if(M=="No one")
				return
			switch(input(src,"Are you sure you wish to vote [M] for council?")in list ("Yes","No"))
				if("Yes")
					var/yes=0
					var/no=0
					spawn(1)
						for(var/mob/T in world)
							if(T.client&&src.village==T.village)
								T<<"<font color = #BB0EDA>Vote Information:</font> Vote for [M] to be a village council member?."
								switch(input(T,"Are you sure you wish to vote [M] for council?")in list ("Yes","No"))
									if("Yes")
										yes+=1
									else
										no+=1
					sleep(3000)
					if((yes-no)>=5)
						M.profession="Council"
						for(var/mob/K in world)
							if(M.village==K.village)
								K<<"<font color = #BB0EDA>Village Information:</font> The vote passed and [M] is a new member of the village council."
					else
						for(var/mob/K in world)
							if(M.village==K.village)
								K<<"<font color = #BB0EDA>Village Information:</font> The vote failed to have [M] become a council member."





/*


//------------Players--------------\\

mob
	var
		tmp/voted = 0
var
	yes = 0
	no = 0
	voteover=1
	votingfor

mob/VoteC/verb
	Vote_What()
		set category = "Vote"
		set name = "Check Vote"
		usr<<"<b>Vote:</b>[votingfor]"
	Vote_Yes()
		set category = "Vote"
		for(var/mob/G in world)
			if(G.Village==usr.Village)
				switch(input(usr,"[votingfor]") in list ("Yes","No"))
					if("Yes")
						if(usr.voted==0&&voteover==0)
							usr.voted=1
							yes++
							G<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[usr] has submited there vote!"
							usr.verbs-= new /mob/VoteC/verb/Vote_What
							usr.verbs-= new /mob/VoteC/verb/Vote_Yes
							usr.verbs-= new /mob/VoteC/verb/Vote_No
					if("No")
						if(usr.voted==0&&voteover==0)
							usr.voted=1
							no++
							G<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[usr] has submited there vote!"
							usr.verbs-= new /mob/VoteC/verb/Vote_What
							usr.verbs-= new /mob/VoteC/verb/Vote_Yes
							usr.verbs-= new /mob/VoteC/verb/Vote_No
	Vote_No()
		set category = "Vote"
		for(var/mob/G in world)
			if(G.Village==usr.Village)
				switch(input(usr,"[votingfor]") in list ("Yes","No"))
					if("Yes")
						if(usr.voted==0&&voteover==0)
							usr.voted=1
							yes++
							G<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[usr] has submited there vote!"
							usr.verbs-= new /mob/VoteC/verb/Vote_What
							usr.verbs-= new /mob/VoteC/verb/Vote_Yes
							usr.verbs-= new /mob/VoteC/verb/Vote_No
					if("No")
						if(usr.voted==0&&voteover==0)
							usr.voted=1
							no++
							G<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[usr] has submited there vote!"
							usr.verbs-= new /mob/VoteC/verb/Vote_What
							usr.verbs-= new /mob/VoteC/verb/Vote_Yes
							usr.verbs-= new /mob/VoteC/verb/Vote_No


mob/JIURJKDFNKHJFSNKH
	verb
		Vote_To_Council(mob/M in world)
			set popup_menu = 0
			if(M.rank=="None")
				usr<<"[M] has no rank!"
				return
			if(M == usr)
				usr<<"You can not host a vote for yourself!"
				return
			if(M.Village==usr.Village)
				if(M.Village =="Leaf")
					if(M.Lreputation<100)
						usr<<"[M]'s reputation in leaf village must be greater then 100 for him to become a council member."
						return
				if(M.Village =="Mist")
					if(M.Mreputation<100)
						usr<<"[M]'s reputation in mist village must be greater then 100 for him to become a council member."
						return
				if(M.Village =="Sand")
					if(M.Sreputation<100)
						usr<<"[M]'s reputation in sand village must be greater then 100 for him to become a council member."
						return
				if(M.Village =="Cloud")
					if(M.Creputation<100)
						usr<<"[M]'s reputation in cloud village must be greater then 100 for him to become a council member."
						return
				if(M.Village =="Rock")
					if(M.Rreputation<100)
						usr<<"[M]'s reputation in rock village must be greater then 100 for him to become a council member."
						return
				if(voteover==1)
					switch(input("Are you sure you would like to host a vote for [M] to become part of council?") in list ("Yes","No"))
						if("Yes")
							switch(input(M,"Would you like to become a Council Member?") in list ("Yes","No"))
								if("Yes")
									if(voteover==1)
										voteover=0
										for(var/mob/E in world)
											if(E.Village==usr.Village)
												E<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>5 Minutes until voting is over. ([M] To Council Vote)"
										spawn(3000)
											voteover=1
											votingfor=null
											for(var/mob/G in world)
												if(G.Village==usr.Village)
													G.verbs-= new /mob/VoteC/verb/Vote_What
													G.verbs-= new /mob/VoteC/verb/Vote_Yes
													G.verbs-= new /mob/VoteC/verb/Vote_No
											for(var/mob/E in world)
												if(E.Village==usr.Village)
													E<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>Yes: [yes] and No: [no]"
											if(yes>no)
												for(var/mob/E in world)
													if(E.Village==usr.Village)
														E<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[M] has been elected into The Council!"
												M.Profession="Ninja Councilor"
												M.verbs += typesof(/mob/Council/verb)
												for(var/mob/X in world)
													if(X.voted)
														X.voted=0
											else
												for(var/mob/E in world)
													if(E.Village==usr.Village)
														E<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[M] has not been invited into The Council!"
												for(var/mob/X in world)
													if(X.voted)
														X.voted=0
												return

										for(var/mob/G in world)
											if(G.Village==usr.Village)
												votingfor="Do you want [M] to become a council member?"
												G.verbs+= new /mob/VoteC/verb/Vote_What
												G.verbs+= new /mob/VoteC/verb/Vote_Yes
												G.verbs+= new /mob/VoteC/verb/Vote_No
								else
									usr<<"<b>[M] does not want to become a Council Member!"
									return
			else
				usr<<"They must be in the same village!"
				return


//------------KAGE--------------\\


mob/Kage
	verb
		Demote(mob/M in world)
			set category = "Kage"
			if(M.Village==usr.Village)
				if(M.Profession=="ANBU")
					if(M.Village =="Leaf")
						if(M.Lreputation>=100)
							usr<<"[M]'s reputation in leaf village must be less then 200 for him to be removed as ANBU."
							return
					if(M.Village =="Mist")
						if(M.Mreputation>=100)
							usr<<"[M]'s reputation in mist village must be less then 200 for him to be removed as ANBU."
							return
					if(M.Village =="Sand")
						if(M.Sreputation>=100)
							usr<<"[M]'s reputation in sand village must be less then 200 for him to be removed as ANBU."
							return
					if(M.Village =="Cloud")
						if(M.Creputation>=100)
							usr<<"[M]'s reputation in cloud village must be less then 200 for him to be removed as ANBU."
							return
					if(M.Village =="Rock")
						if(M.Rreputation>=100)
							usr<<"[M]'s reputation in rock village must be less then 200 for him to be removed as ANBU."
							return
					switch(alert("Would you like to demote [M] from ANBU?","Kage","Yes","No"))
						if("Yes")
							M.Profession="None"
							for(var/mob/E in world)
								if(E.Village==M.Village)
									E<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[usr] has demoted [M] from ANBU!"
			else
				usr<<"[M] is not in your village!"
				return
		Premote(mob/M in world)
			set category = "Kage"
			if(M.Village==usr.Village)
				if(M.Village =="Leaf")
					if(M.Lreputation<150)
						usr<<"[M]'s reputation in leaf village must be greater then 150 for him to become a ANBU."
						return
				if(M.Village =="Mist")
					if(M.Mreputation<150)
						usr<<"[M]'s reputation in mist village must be greater then 150 for him to become a ANBU."
						return
				if(M.Village =="Sand")
					if(M.Sreputation<150)
						usr<<"[M]'s reputation in sand village must be greater then 150 for him to become a ANBU."
						return
				if(M.Village =="Cloud")
					if(M.Creputation<150)
						usr<<"[M]'s reputation in cloud village must be greater then 150 for him to become a ANBU."
						return
				if(M.Village =="Rock")
					if(M.Rreputation<150)
						usr<<"[M]'s reputation in rock village must be greater then 150 for him to become a ANBU."
						return
				switch(alert("What rank do you wish to make [M]?","Kage","ANBU","Nevermind"))
					if("ANBU")
						M.Profession="ANBU"
						for(var/mob/E in world)
							if(E.Village==M.Village)
								E<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[usr] has premoted [M]'s to ANBU!"
					if("Nevermind")
						return
					else
						return
			else
				usr<<"[M] is not in your village!"
				return
		Invite_To_Village(mob/M in world)
			set category = "Kage"
			if(M.Village=="Missing")
				switch(alert("Do you wish to invite [M] to the [usr.Village] Village?","Kage","Yes","No"))
					if("Yes")
						switch(alert(M,"Do you wish to join the [usr.Village] Village?","Kage","Yes","No"))
							if("Yes")
								M.Village="[usr.Village]"
								for(var/mob/E in world)
									if(E.Village==usr.Village)
										E<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[M] has joined the [usr.Village] Village!"
							else
								usr<<"[M] has denied the invatation!"
								return
					else
						return
			else
				usr<<"[M] is not a missing ninja!"
				return
		Boot_From_Village(mob/M in world)
			set category = "Kage"
			if(usr.Village==M.Village)
				if(M.Village =="Leaf")
					if(M.Lreputation>=25)
						usr<<"[M]'s reputation in leaf village must be lower then 25 for him to be booted."
						return
				if(M.Village =="Mist")
					if(M.Mreputation>=25)
						usr<<"[M]'s reputation in mist village must be lower then 25 for him to be booted."
						return
				if(M.Village =="Sand")
					if(M.Sreputation>=25)
						usr<<"[M]'s reputation in sand village must be lower then 25 for him to be booted."
						return
				if(M.Village =="Cloud")
					if(M.Creputation>=25)
						usr<<"[M]'s reputation in cloud village must be lower then 25 for him to be booted."
						return
				if(M.Village =="Rock")
					if(M.Rreputation>=25)
						usr<<"[M]'s reputation in rock village must be lower then 25 for him to be booted."
						return
				switch(alert("Do you wish to boot [M] from the [usr.Village] Village ?","Kage","Yes","No"))
					if("Yes")
						M.Village="Missing"
						for(var/mob/E in world)
							if(E.Village==usr.Village)
								E<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[usr] Has Booted [M] from [usr.Village] Village!"
					else
						return
			else
				usr<<"[M] is not from your Village!"
				return
		Set_Taxes()
			set category = "Kage"
			if(usr.Village =="Leaf")
				var/taxbefore = Leaftax
				Leaftax = input("Set a tax for store bought items from 0 - 15.","Village Tax",5) as num
				if(Leaftax>15)
					Leaftax = 15
				if(Leaftax<0)
					Leaftax = 0
				for(var/mob/M in world)
					if(M.Village==usr.Village)
						M<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[usr] has set taxes from [taxbefore] to [Leaftax]."
			if(usr.Village =="Sand")
				var/taxbefore = Sandtax
				Sandtax = input("Set a tax for store bought items from 0 - 15.","Village Tax",5) as num
				if(Sandtax>15)
					Sandtax = 15
				if(Sandtax<0)
					Sandtax = 0
				for(var/mob/M in world)
					if(M.Village==usr.Village)
						M<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[usr] has set taxes from [taxbefore] to [Sandtax]."
			if(usr.Village =="Mist")
				var/taxbefore = Misttax
				Misttax = input("Set a tax for store bought items from 0 - 15.","Village Tax",5) as num
				if(Misttax>15)
					Misttax = 15
				if(Misttax<0)
					Misttax = 0
				for(var/mob/M in world)
					if(M.Village==usr.Village)
						M<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[usr] has set taxes from [taxbefore] to [Misttax]."
			if(usr.Village =="Rock")
				var/taxbefore = Rocktax
				Rocktax = input("Set a tax for store bought items from 0 - 15.","Village Tax",5) as num
				if(Rocktax>15)
					Rocktax = 15
				if(Rocktax<0)
					Rocktax = 0
				for(var/mob/M in world)
					if(M.Village==usr.Village)
						M<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[usr] has set taxes from [taxbefore] to [Rocktax]."
			if(usr.Village =="Cloud")
				var/taxbefore = Cloudtax
				Cloudtax = input("Set a tax for store bought items from 0 - 15.","Village Tax",5) as num
				if(Cloudtax>15)
					Cloudtax = 15
				if(Cloudtax<0)
					Cloudtax = 0
				for(var/mob/M in world)
					if(M.Village==usr.Village)
						M<<"<font size=1><font color=#B22222>Village:<font size=1><font color=white>[usr] has set taxes from [taxbefore] to [Cloudtax]."




//------------Councilor--------------\\



mob
	var/tmp
		voted2 = 0
var
	yes2 = 0
	no2 = 0
	voteover2=1//1 means voting is over or hasn't started
	Hokage=0
	Mizukage=0
	Kazekage=0
	Raikage=0
	Tsuchikage=0

mob/Council
	verb
		Vote_In_Kage(mob/M in world)
			set category = "Council"
			if(M.rank=="None")
				usr<<"[M] has no rank!"
				return
			if(M.rank=="Academy Student")
				usr<<"You can not vote an Academy Student to Kage!"
				return
			if(M == usr)
				usr<<"You can not host a vote for yourself!"
				return
			if(usr.Village=="Leaf")
				if(Hokage)
					usr<<"There is already a kage!"
					return
			if(usr.Village=="Mist")
				if(Mizukage)
					usr<<"There is already a kage!"
					return
			if(usr.Village=="Sand")
				if(Kazekage)
					usr<<"There is already a kage!"
					return
			if(usr.Village=="Cloud")
				if(Raikage)
					usr<<"There is already a kage!"
					return
			if(usr.Village=="Rock")
				if(Tsuchikage)
					usr<<"There is already a kage!"
					return
			if(M.Village==usr.Village)
				if(M.Village =="Leaf")
					if(M.Lreputation<250)
						usr<<"[M]'s reputation in leaf village must be greater then 250 for him to become a kage."
						return
				if(M.Village =="Mist")
					if(M.Mreputation<250)
						usr<<"[M]'s reputation in mist village must be greater then 250 for him to become a kage."
						return
				if(M.Village =="Sand")
					if(M.Sreputation<250)
						usr<<"[M]'s reputation in sand village must be greater then 250 for him to become a kage."
						return
				if(M.Village =="Cloud")
					if(M.Creputation<250)
						usr<<"[M]'s reputation in cloud village must be greater then 250 for him to become a kage."
						return
				if(M.Village =="Rock")
					if(M.Rreputation<250)
						usr<<"[M]'s reputation in rock village must be greater then 250 for him to become a kage."
						return
				if(voteover2==1)
					switch(input("Are you sure you would like to host a vote for [M] to become The Kage?") in list ("Yes","No"))
						if("Yes")
							switch(input(M,"Would you like to become a Kage?") in list ("Yes","No"))
								if("Yes")
									if(voteover2==1)
										voteover2=0
										world<<"5 Minutes until voting is over. ([M] To Kage Vote)"
										spawn(3000)
											voteover2=1
											world<<"Yes: [yes2] and No: [no2]"
											if(yes2>no2)
												world<<"The Council has elected [M] to become Kage!"
												M.rank="Kage"
												M.verbs += typesof(/mob/Kage/verb)
												if(M.Village=="Leaf")
													if(!Hokage)
														Hokage=1
												if(M.Village=="Mist")
													if(!Mizukage)
														Mizukage=1
												if(M.Village=="Sand")
													if(!Kazekage)
														Kazekage=1
												if(M.Village=="Cloud")
													if(!Raikage)
														Raikage=1
												if(M.Village=="Rock")
													if(!Tsuchikage)
														Tsuchikage=1
												for(var/mob/X in world)
													if(X.voted2)
														X.voted2=0
											else
												world<<"The vote for [M] to become kage has not passed!"
												for(var/mob/X in world)
													if(X.voted2)
														X.voted2=0
												return

										for(var/mob/G in world)
											if(G.Profession=="Ninja Councilor")
												switch(input(G,"Do you want [M] to become The Kage?") in list ("Yes","No"))
													if("Yes")
														if(usr.voted2==0&&voteover2==0)//If you haven't voted and voting is still around
															usr.voted2=1
															yes2++
															G<<"<b>[usr] has voted yes"
													if("No")
														if(usr.voted2==0&&voteover2==0)//If you haven't voted and voting is still around
															usr.voted2=1
															no2++
															G<<"<b>[usr] has voted no"
								else
									usr<<"<b>[M] does not want to become a Kage!"
									return
			else
				usr<<"They must be in the same village!"
				return
		Remove_Kage(mob/M in world)
			set category = "Council"
			if(M.rank=="None")
				usr<<"[M] has no rank!"
				return
			if(M.rank=="Academy Student")
				usr<<"You can not vote an Academy Student to Kage!"
				return
			if(M.rank=="Genin")
				usr<<"You can not vote a Genin to Kage!"
				return
			if(M.Village==usr.Village)
				if(M.rank=="Kage")
					if(M.Village =="Leaf")
						if(M.Lreputation>=200)
							usr<<"[M]'s reputation in leaf village must be less then 200 for him to be removed as kage."
							return
					if(M.Village =="Mist")
						if(M.Mreputation>=200)
							usr<<"[M]'s reputation in mist village must be less then 200 for him to be removed as kage."
							return
					if(M.Village =="Sand")
						if(M.Sreputation>=200)
							usr<<"[M]'s reputation in sand village must be less then 200 for him to be removed as kage."
							return
					if(M.Village =="Cloud")
						if(M.Creputation>=200)
							usr<<"[M]'s reputation in cloud village must be less then 200 for him to be removed as kage."
							return
					if(M.Village =="Rock")
						if(M.Rreputation>=200)
							usr<<"[M]'s reputation in rock village must be less then 200 for him to be removed as kage."
							return
					if(voteover2==1)
						switch(input("Are you sure you would like to host a vote to remove [M] from Kage?") in list ("Yes","No"))
							if("Yes")
								if(voteover2==1)
									voteover2=0
									world<<"5 Minutes until voting is over. (Remove [M] from Kage Vote)"
									spawn(3000)
										voteover2=1
										world<<"Yes: [yes2] and No: [no2]"
										if(yes2>no2)
											world<<"The Council has chosen to remove [M] as Kage!"
											M.rank="Sannin"
											M.verbs -= typesof(/mob/Kage/verb)
											if(M.Village=="Leaf")
												if(Hokage)
													Hokage=0
											if(M.Village=="Mist")
												if(Mizukage)
													Mizukage=0
											if(M.Village=="Sand")
												if(Kazekage)
													Kazekage=0
											if(M.Village=="Cloud")
												if(Raikage)
													Raikage=0
											if(M.Village=="Rock")
												if(Tsuchikage)
													Tsuchikage=0
											for(var/mob/X in world)
												if(X.voted2)
													X.voted2=0
										else
											world<<"The vote for [M] to stripped of kage has not passed!"
											for(var/mob/X in world)
												if(X.voted2)
													X.voted2=0
											return

									for(var/mob/G in world)
										if(G.Profession=="Ninja Councilor")
											switch(input(G,"Do you want to remove [M] as the [M.Village] Kage?") in list ("Yes","No"))
												if("Yes")
													if(usr.voted2==0&&voteover2==0)//If you haven't voted and voting is still around
														usr.voted2=1
														yes2++
														G<<"<b>[usr] has voted yes"
												if("No")
													if(usr.voted2==0&&voteover2==0)//If you haven't voted and voting is still around
														usr.voted2=1
														no2++
														G<<"<b>[usr] has voted no"
							else
								return
				else
					usr<<"[M] is not a Kage!"
					return
			else
				usr<<"They must be in the same village!"
				return




*/