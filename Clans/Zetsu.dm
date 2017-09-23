obj
	skill
		zetsu1
			verb
				wgt()//wood ground travel
					set category = "Skills"
					set name = "Root Travel"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+200
					if(usr.handseal(500,0))
						var/ty=list()
						for(var/mob/Y in world)
							if(Y.client)
								ty+=Y
						var/mob/M = input("Who do you want to travel to?","Root Travel") in ty + list("Cancel")
						if(M=="Cancel")
							return
						var/goon=0
						if(src.level<1)
							usr<<"You search for roots near [M]."
							var/cango=usr.rootcheck(M)
							var/curloc=0
							for(var/x in cango)
								if(x)
									goon=1
									break
							//var/mob/newloc=pick(cango)
							//curloc=newloc.loc
							if(goon>=1)
								var/mob/newloc=pick(cango)
								curloc=newloc.loc
								oview(usr)<<"[usr] merges with the ground."
								usr.loc=newloc
								sleep(30)
								usr.loc=curloc
								oview(usr)<<"[usr] comes out of [cango]."
								src.mastery+=5
								if(src.mastery>=100)
									src.level+=1
									src.mastery=0
							else
								usr<<"There were no roots near [M]"
						else
							usr<<"You send roots underground to find [M]."
							var/movgo=list()
							var/many=0
							for(var/turf/T in oview(2,M))
								if(T.density==0)
									movgo+=T
									many+=1
							if(many<=0)
								usr<<"Theres no room."
								return
							else
								var/mob/npc/JukaiKoutan/A=new()
								A.health+=(usr.suitonknowledge+usr.dotonknowledge)*0.10
								A.loc=pick(movgo);A.owner=usr
								A.Frozen=1
								view(A)<<"[A] grows randomly from the ground."
								sleep(rand(30,60))
								if(A)
									view(usr)<<"[usr] merges with the ground."
									oview(A)<<"[usr] comes out of [A]."
									usr.loc=A.loc
								else
									usr<<"The roots you sent over where destroyed."
									return



mob
	proc
		rootcheck(mob/M)
			set background = 1
			var/roots=list()
			for(var/mob/npc/JukaiKoutan/T1 in view(2,M))
				roots+=T1
			for(var/mob/npc/JukaiKoutan2/T2 in view(2,M))
				roots+=T2
			for(var/mob/npc/WoodBarrier/T3 in view(2,M))
				roots+=T3
			return roots