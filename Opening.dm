mob
	proc
		madaraopen()
			src.loc=locate(5,5,3)
			src.Frozen=1
			src.dir=SOUTH
			//make a madara npc next to them, make him face south
			var/mob/npc/Bunshin/A=new()
			if(A)
				A.name="Madara Uchiha";A.density=0;A.icon='Guy.dmi';A.loc=locate(src.x+1,src.y,src.z)
				//var/obj/smoke/B=new()
				//B.loc=locate(A.x,A.y,A.z)
			////
			////make obito where he saves u, madara, and a few others if u die, if you make it then u might have to face itachi or something else
			///
			///





//another idea, you at home and you have to talk to one of your parents, they say go get seome fresh air they are kinda busy or something (and u pick ur name and clan here talkign to parents)
//then
//screen fades black u appear outside, you must find your way to a place, any place really and talk to a npc that will say something as if they know u
//then
//the place gets robbed while your there and you turn around surprized, you turn back around and the npc u were talkign to is gone(runf or their life)
//so now you have to fight for yours(this is how they learn to play)
//after
//the robber turns out to be a suicide bomber and is going to explode, u get caught in the blast bc he grabs u
//but as he explodes your screen goes black and in chat someone says "izanami'
//then you think its your second try at life or is told that so u have to go somewhere else or it'll keep happening
//after the bombing u start outside your house
//when u get to the different npc he wants u to read a comic book so u look at it and he asks if u were in the comic what clan would you want to be
//your prompted the clan selection list then he snaps his fingers and the screen fades to black and u wake up ina hospital in naruto









mob
	var
		opening=0
		openreasons=list("Just Because","Lost")




mob
	opener
		koimmune=1
		Wandering_Ninja
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			name="Wandering Teacher"
			health = 1
			ko=1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(3,10))
					src.needface()
			verb/Talk()
				set src in oview(2)
				set category = "NPC"
				set name="Speak"
				src.Say("Welcome to the game [usr].")
				sleep(10)
				src.Say("I'm here to teach you the basics to being a ninja.")
				sleep(15)
				src.Say("These jutsu are for beginners so you should grasp them easily.<br><font color=yellow><b>*[src] Teaches [usr] how to use the Clone, Kawarimi and Henge jutsu*")
				sleep(20)
				src.Say("Oh and Hold Z to charge your chakra.")
				//usr<<"<font size=2><font color=yellow><B>You suddenly know how to use The Kawarimi, Clone and Henge jutsu."
				if(usr.opening==0)
					usr.opening+=1
					usr.contents += new /obj/skill/clones
					usr.contents += new /obj/skill/henge
					usr.contents += new /obj/skill/kawa
					usr.jutsus+="Clone"
					usr.jutsus+="Henge"
					usr.jutsus+="Kawarimi"
					usr.rank = "Academy  Student"
					usr<<"You have become an Academy Student!"
				var/list/H=list()
				for(var/turf/start2/T in world)
					H.Add(T)
					sleep(0.1)
				sleep(50)
				src.Say("Cya!")
				usr<<"You feel as though your suddenly moved."
				usr.chakrapoolmax=usr.Mchakra*usr.poolmulti
				usr.missiondestination = locate(79,198,26)
				if(usr)
					usr.loc=pick(H)
			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,1)
				..()
		Wandering_Ninja2
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			health = 1
			ko=1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(3,10))
					src.needface()
					src.Generate_A_Name()
			verb/Talk()
				set src in oview(2)
				set category = "NPC"
				set name="Speak"
				if(usr.opening==1)
					src.Say("So you got sent to me huh?")
					sleep(10)
					src.Say("I'll teach you how to fight but first of all do you belong to a clan or anything?.")
					usr.Clan_Select()
					usr.opening+=1
					if(usr.clan=="None")
						usr.Say("I don't have one.")
						src.Say("So your a basic ninja huh?")
					else
						usr.Say("I'm of the [usr.clan] Clan.")
						var/comment=pick("nasty","nice","proud","loud","happy","sad","never forgetting","lonesome","terrible","exciting","energetic")
						src.Say("I see, so you belong to the [usr.clan] Clan. A [comment] clan they can be.")
					usr<<"[src] hands you what looks to be a piece of paper."
					sleep(20)
					src.Say("Now train till you can use this chakra card then you'll find your element. When you find it talk to me again.(train ninjutsu by using ninjutsu, the skills you just learned)")
					usr.contents += new /obj/materials/chakrapaper
					return
				if(usr.opening==2&&usr.element!="None")
					src.Say("So you have an element now huh?")
					sleep(1)
					src.Say("Good work [usr]. Try talking to an elemental teacher and see if they will teach you how to use [usr.element] if you want. They'll tell you what your currently capable of learning.")
					usr.opening+=1
					return
				if(usr.opening==3)
					src.Say("In order to attack you must press A. In order to defend you must press D, and in order to charge your chakra you must hold Z.")
					sleep(10)
					src.Say("Achive level 2 then speak to me, you can get exp off of those grey dummies over there.(Double click to target, press U to untarget)")
					usr.opening+=1
					return
				if(usr.opening==4&&usr.level>=2)
					src.Say("Well [usr] I've taught you all you need to know for now, so the final lesson is try not to die.")
					var/list/H=list()
					for(var/turf/start3/T in world)
						H.Add(T)
						sleep(0.1)
					sleep(30)
					src.Say("Cya!")
					usr<<"You feel as though your suddenly moved."
					usr.missiondestination = locate(151,199,26)
					if(usr)
						usr.loc=pick(H)
					usr.opening+=1
					return
			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,1)
				..()
		Wandering_Ninja3
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			health = 1
			ko=1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(3,10))
					src.needface()
					src.Generate_A_Name()
			verb/Talk()
				set src in oview(2)
				set category = "NPC"
				set name="Speak"
				if(usr.level<5)
					src.Say("Achive level 5 and i'll let you pass. Don't forget to use the stat points you've earned by going to Use points in the commands tab.")
				else
					src.Say("Well done [usr.name].")
					if(usr.reanimated>=1)
						usr.reanimated=0
						usr.name="[usr.beforeedoname]"
						src.Say("Oh and I'm restoring you to your original body, try not to lose it again okay?")
					usr.loc=locate(1,1,1)
					usr.opening+=1
					usr.exp+=1000
					usr<<"You are rewarded 1000 exp for completeing the tutorial."
					usr.missiondestination = null
					for(var/obj/Arrow/A in usr.client.screen)
						if(A)
							del A
			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,1)
				..()
		Mom
			//human = 1
			density=1
			//NPC = 1
			icon='Girl.dmi'
			health = 1
			ko=1
			layer=MOB_LAYER
			verb/Talk()
				set src in oview(2)
				set category = "NPC"
				set name="Speak"
				oview(src)<<"[src] Says: Your brother came home today."
				sleep(20)
				oview(src)<<"[src] Says: He was looking for you too. Would you go see what he wants for me?"
				switch(input("Respond", "[src]",text) in list ("Okay","Nah","..."))
					if("Nah")
						oview(src)<<"[src] Says: .... Get out the house....."
						usr<<"You're kicked out the house."
						usr.Name()
						var/list/H=list()
						for(var/turf/start2/T in world)
							H.Add(T)
							sleep(0.1)
						if(usr)
							usr.loc=pick(H)
					else
						oview(src)<<"[src] Says: Good."
						oview(src)<<"*[src] flashes a genuine smile.*"
			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,1)
				..()
		Dad
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			health = 1
			ko=1
			layer=MOB_LAYER
			verb/Talk()
				set src in oview(2)
				set category = "NPC"
				set name="Speak"
				oview(src)<<"[src] Says: Your brother came home today."
				sleep(30)
				oview(src)<<"[src] Says: He was looking for you, go see what he wants."
				switch(input("Respond", "[src]",text) in list ("Okay","Nah","..."))
					if("Nah")
						oview(src)<<"[src] Says: GTFO of here kid!!!.... telling me no.... sheesh kids these days"
						usr<<"Dad kicked you out the house."
						usr.Name()
						var/list/H=list()
						for(var/turf/start2/T in world)
							H.Add(T)
							sleep(0.1)
						if(usr)
							usr.loc=pick(H)
			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,1)
				..()
		Big_Brother
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			health = 1
			ko=1
			layer=MOB_LAYER
			verb/Talk()
				set src in oview(2)
				set category = "NPC"
				set name="Speak"
				oview(src)<<"[src] Says: OH hey there!"
				sleep(30)
				//view(usr)<<"[usr] Says:"
				oview(src)<<"[src] Says: It's been so long I think I forgot your name. Hehe"
				sleep(30)
				oview(src)<<"[src] Says: wait don't tell me it's uh......"
				usr.Name()
				if(prob(65))
					oview(src)<<"[src] Says: [usr.name]."
					usr<<"You begin shaking your head, its clear he guessed..."
				else
					var/randname=pick("Robby","Julie","Matt","Kevin","Dounut","Aoi","Jayshun","Obito","Naruto","Kakashi","Kabuto","Itachi","Joseph","Nagato","Sakura","Kureni","Mark","Kisame","Loki","Rigby")
					oview(src)<<"[src] Says: It's [randname]."
					sleep(10)
					view(usr)<<"[usr] Says: [usr.name]"
					sleep(20)
					oview(src)<<"[src] Says: Errr... I was close!"
				sleep(40)
				oview(src)<<"[src] Says: So would you pick up your big bro his comics?"
				var/asked=0
				nochoice
				switch(input("Respond", "Big Brother",text) in list ("Sure","No Way!"))
					if("Sure")
						oview(src)<<"[src] Says: Thanks!"
						var/list/H=list()
						for(var/turf/start2/T in world)
							H.Add(T)
							sleep(0.1)
						usr.loc=pick(H)
						usr<<"You begin your way around the block."
						usr.openreasons+="Comics"
					if("No Way!")
						//usr<<"[src] Says: Please?"
						asked+=1
						if(asked<2)
							usr<<"[src] Says: Please?"
							goto nochoice
						else
							oview(src)<<"[src] Says: So mean...."
							sleep(10)
							var/list/H=list()
							for(var/turf/start2/T in world)
								H.Add(T)
								sleep(0.1)
							if(usr)
								usr.loc=pick(H)
							usr<<"You leave the house."
			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,1)
				..()
		storeowner1
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			name="Subaki"
			health = 1
			ko=1
			layer=MOB_LAYER
			verb/Talk()
				set src in oview(2)
				set category = "NPC"
				set name="Speak"
				if(usr.opening==0)
					oview(src)<<"[src] Says: Hey, whats up?"
					var/T = input("What to say?","Reason") in usr.openreasons
					usr.Frozen=1
					if(T=="Comics")
						view(usr)<<"[usr] Says: I'm here to pick up the comics."
						sleep(20)
						oview(src)<<"[src] Says: Let me guess, your brother sent you?"
						sleep(15)
						view(usr)<<"[usr] Says: Yeah, hes a real prick"
						sleep(35)
						oview(src)<<"[src] Says: Oh LOL, let me get them for you."
						src.icon_state="groundjutsuse"
					if(T=="Lost"||T=="Just Because")
						view(usr)<<"[usr] Says: [T]"
						sleep(20)
						oview(src)<<"[src] Says: People get snatched like that you know."
						sleep(20)
						var/howto=input("Respond") as text
						view(usr)<<"[usr] Says: [howto]"
						sleep(30)
						oview(src)<<"[src] Says: Anyway."
						sleep(20)
					sleep(30)
					oview(src)<<"[src] Says: You wouldn't happen to be a naruto fan would you?"
					usr.opening+=1
					sleep(15)
					switch(input("Respond", "Store",text) in list ("Yeah, why?","Nah"))
						if("Yeah, why?")
							view(usr)<<"[usr] Says: Yeah, why?"
							sleep(30)
							oview(src)<<"[src] Says: Well I was looking up some stuff and I found out some things. Could I try something on you? It wont hurt I promise!"
							sleep(15)
							switch(input("Respond", "Store",text) in list (".... Sure I guess","No Way!"))
								if(".... Sure I guess")
									view(usr)<<"[usr] Says: Uhhh.... Sure I guess."
									sleep(50)
									oview(src)<<"[src] Says: Genjutsu: False Reality!"
									flick("jutsuse",src)
									view(src)<< sound('SEAL2.wav',0,0,1)
									sleep(15)
									view(usr)<<"[usr] Says: What the-"
									usr<<"Everything gets all dizzy."
									if(usr.opening==1)
										usr.Clan_Select()
										usr.opening+=1
									var/list/H=list()
									for(var/turf/start3/P in world)
										H.Add(P)
										sleep(0.1)
									usr.loc=pick(H)
									usr.Frozen=0
									sleep(50)
									usr<<"You wake up in a strange place."
								if("No Way!")
									oview(src)<<"[src] Says: Oh."
									//usr<<"You take the magazines."
									src.icon_state=""
									usr.Frozen=0
						if("Nah")
							oview(src)<<"[src] Says: Oh."
							//usr<<"You take the magazines."
							src.icon_state=""
							usr.Frozen=0
					return
				if(usr.opening==1)
					oview(src)<<"[src] Says: You wouldn't happen to be a naruto fan would you?"
					//usr.opening+=1
					sleep(15)
					switch(input("Respond", "Store",text) in list ("Yeah, why?","Nah"))
						if("Yeah, why?")
							view(usr)<<"[usr] Says: Yeah, why?"
							sleep(30)
							oview(src)<<"[src] Says: Well I was looking up some stuff and I found out some things. Could I try something on you? It wont hurt I promise!"
							sleep(15)
							switch(input("Respond", "Store",text) in list (".... Sure I guess","No Way!"))
								if(".... Sure I guess")
									view(usr)<<"[usr] Says: Uhhh.... Sure I guess."
									sleep(50)
									oview(src)<<"[src] Says: Genjutsu: False Reality!"
									flick("jutsuse",src)
									view(src)<< sound('SEAL2.wav',0,0,1)
									sleep(15)
									view(usr)<<"[usr] Says: What the-"
									usr<<"Everything gets all dizzy."
									usr.exp+=5000
									spawn(1)
										usr.level()
									if(usr.opening==1)
										usr.Clan_Select()
										usr.opening+=1
									var/list/H=list()
									for(var/turf/start3/T in world)
										H.Add(T)
										sleep(0.1)
									usr.loc=pick(H)
									usr.Frozen=0
									usr.tip1()
									sleep(50)
									usr<<"You wake up in a strange place."
								if("No Way!")
									oview(src)<<"[src] Says: Oh, okay maybe next time."
									usr.Frozen=0
									//usr<<"You take the magazines."
									//src.icon_state=""
						if("Nah")
							oview(src)<<"[src] Says: Oh okay."
							usr.Frozen=0
							//usr<<"You take the magazines."
							//src.icon_state=""

			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,1)
				..()
		storeowner2
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			name="Chad"
			health = 1
			ko=1
			layer=MOB_LAYER
			verb/Talk()
				set src in oview(2)
				set category = "NPC"
				set name="Speak"
				if(usr.opening==0)
					oview(src)<<"[src] Says: Hey, whats up?"
					var/T = input("What to say?","Reason") in usr.openreasons
					usr.Frozen=1
					if(T=="Comics")
						view(usr)<<"[usr] Says: I'm here to pick up the comics."
						sleep(20)
						oview(src)<<"[src] Says: Let me guess, your brother sent you?"
						sleep(15)
						view(usr)<<"[usr] Says: Yeah, hes a real prick"
						sleep(35)
						oview(src)<<"[src] Says: Oh LOL, let me get them for you."
						src.icon_state="groundjutsuse"
					if(T=="Lost"||T=="Just Because")
						view(usr)<<"[usr] Says: [T]"
						sleep(20)
						oview(src)<<"[src] Says: People get snatched like that you know."
						sleep(20)
						var/howto=input("Respond") as text
						view(usr)<<"[usr] Says: [howto]"
						sleep(30)
						oview(src)<<"[src] Says: Anyway."
						sleep(20)
					sleep(30)
					oview(src)<<"[src] Says: You wouldn't happen to be a naruto fan would you?"
					usr.opening+=1
					sleep(15)
					switch(input("Respond", "Store",text) in list ("Yeah, why?","Nah"))
						if("Yeah, why?")
							view(usr)<<"[usr] Says: Yeah, why?"
							sleep(30)
							oview(src)<<"[src] Says: Well I was looking up some stuff and I found out some things. Could I try something on you? It wont hurt I promise!"
							sleep(15)
							switch(input("Respond", "Store",text) in list (".... Sure I guess","No Way!"))
								if(".... Sure I guess")
									view(usr)<<"[usr] Says: Uhhh.... Sure I guess."
									sleep(50)
									oview(src)<<"[src] Says: Genjutsu: False Reality!"
									flick("jutsuse",src)
									view(src)<< sound('SEAL2.wav',0,0,1)
									sleep(15)
									view(usr)<<"[usr] Says: What the-"
									usr<<"Everything gets all dizzy."
									if(usr.opening==1)
										usr.Clan_Select()
										usr.opening+=1
									var/list/H=list()
									for(var/turf/start3/P in world)
										H.Add(P)
										sleep(0.1)
									usr.loc=pick(H)
									usr.Frozen=0
									sleep(50)
									usr<<"You wake up in a strange place."
								if("No Way!")
									oview(src)<<"[src] Says: Oh."
									//usr<<"You take the magazines."
									src.icon_state=""
									usr.Frozen=0
						if("Nah")
							oview(src)<<"[src] Says: Oh."
							//usr<<"You take the magazines."
							src.icon_state=""
							usr.Frozen=0
					return
				if(usr.opening==1)
					oview(src)<<"[src] Says: You wouldn't happen to be a naruto fan would you?"
					//usr.opening+=1
					sleep(15)
					switch(input("Respond", "Store",text) in list ("Yeah, why?","Nah"))
						if("Yeah, why?")
							view(usr)<<"[usr] Says: Yeah, why?"
							sleep(30)
							oview(src)<<"[src] Says: Well I was looking up some stuff and I found out some things. Could I try something on you? It wont hurt I promise!"
							sleep(15)
							switch(input("Respond", "Store",text) in list (".... Sure I guess","No Way!"))
								if(".... Sure I guess")
									view(usr)<<"[usr] Says: Uhhh.... Sure I guess."
									sleep(50)
									oview(src)<<"[src] Says: Genjutsu: False Reality!"
									flick("jutsuse",src)
									view(src)<< sound('SEAL2.wav',0,0,1)
									sleep(15)
									view(usr)<<"[usr] Says: What the-"
									usr<<"Everything gets all dizzy."
									usr.exp+=5000
									spawn(1)
										usr.level()
									if(usr.opening==1)
										usr.Clan_Select()
										usr.opening+=1
									var/list/H=list()
									for(var/turf/start3/T in world)
										H.Add(T)
										sleep(0.1)
									usr.loc=pick(H)
									usr.Frozen=0
									usr.tip1()
									sleep(50)
									usr<<"You wake up in a strange place."
									usr<<"(Your goal is to survive, not win.)"
								if("No Way!")
									oview(src)<<"[src] Says: Oh, okay maybe next time."
									usr.Frozen=0
									//usr<<"You take the magazines."
									//src.icon_state=""
						if("Nah")
							oview(src)<<"[src] Says: Oh okay."
							usr.Frozen=0
							//usr<<"You take the magazines."
							//src.icon_state=""


			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,1)
				..()
		storeowner3
			//human = 1
			density=1
			//NPC = 1
			icon='Girl.dmi'
			name="Susan"
			health = 1
			ko=1
			layer=MOB_LAYER
			verb/Talk()
				set src in oview(2)
				set category = "NPC"
				set name="Speak"
				if(usr.opening==0)
					oview(src)<<"[src] Says: Hey, whats up?"
					var/T = input("What to say?","Reason") in usr.openreasons
					usr.Frozen=1
					if(T=="Comics")
						view(usr)<<"[usr] Says: I'm here to pick up the comics."
						sleep(20)
						oview(src)<<"[src] Says: Let me guess, your brother sent you?"
						sleep(15)
						view(usr)<<"[usr] Says: Yeah, hes a real prick"
						sleep(35)
						oview(src)<<"[src] Says: Oh LOL, let me get them for you."
						src.icon_state="groundjutsuse"
					if(T=="Lost"||T=="Just Because")
						view(usr)<<"[usr] Says: [T]"
						sleep(20)
						oview(src)<<"[src] Says: People get snatched like that you know."
						sleep(20)
						var/howto=input("Respond") as text
						view(usr)<<"[usr] Says: [howto]"
						sleep(30)
						oview(src)<<"[src] Says: Anyway."
						sleep(20)
					sleep(30)
					oview(src)<<"[src] Says: You wouldn't happen to be a naruto fan would you?"
					usr.opening+=1
					sleep(15)
					switch(input("Respond", "Store",text) in list ("Yeah, why?","Nah"))
						if("Yeah, why?")
							view(usr)<<"[usr] Says: Yeah, why?"
							sleep(30)
							oview(src)<<"[src] Says: Well I was looking up some stuff and I found out some things. Could I try something on you? It wont hurt I promise!"
							sleep(15)
							switch(input("Respond", "Store",text) in list (".... Sure I guess","No Way!"))
								if(".... Sure I guess")
									view(usr)<<"[usr] Says: Uhhh.... Sure I guess."
									sleep(50)
									oview(src)<<"[src] Says: Genjutsu: False Reality!"
									flick("jutsuse",src)
									view(src)<< sound('SEAL2.wav',0,0,1)
									sleep(15)
									view(usr)<<"[usr] Says: What the-"
									usr<<"Everything gets all dizzy."
									if(usr.opening==1)
										usr.Clan_Select()
										usr.opening+=1
									var/list/H=list()
									for(var/turf/start3/P in world)
										H.Add(P)
										sleep(0.1)
									usr.loc=pick(H)
									usr.Frozen=0
									sleep(50)
									usr<<"You wake up in a strange place."
								if("No Way!")
									oview(src)<<"[src] Says: Oh."
									usr<<"(Your goal is to survive, not win.)"
									//usr<<"You take the magazines."
									src.icon_state=""
									usr.Frozen=0
						if("Nah")
							oview(src)<<"[src] Says: Oh."
							//usr<<"You take the magazines."
							src.icon_state=""
							usr.Frozen=0
					return
				if(usr.opening==1)
					oview(src)<<"[src] Says: You wouldn't happen to be a naruto fan would you?"
					//usr.opening+=1
					sleep(15)
					switch(input("Respond", "Store",text) in list ("Yeah, why?","Nah"))
						if("Yeah, why?")
							view(usr)<<"[usr] Says: Yeah, why?"
							sleep(30)
							oview(src)<<"[src] Says: Well I was looking up some stuff and I found out some things. Could I try something on you? It wont hurt I promise!"
							sleep(15)
							switch(input("Respond", "Store",text) in list (".... Sure I guess","No Way!"))
								if(".... Sure I guess")
									view(usr)<<"[usr] Says: Uhhh.... Sure I guess."
									sleep(50)
									oview(src)<<"[src] Says: Genjutsu: False Reality!"
									flick("jutsuse",src)
									view(src)<< sound('SEAL2.wav',0,0,1)
									sleep(15)
									view(usr)<<"[usr] Says: What the-"
									usr<<"Everything gets all dizzy."
									usr.exp+=5000
									spawn(1)
										usr.level()
									if(usr.opening==1)
										usr.Clan_Select()
										usr.opening+=1
									var/list/H=list()
									for(var/turf/start3/T in world)
										H.Add(T)
										sleep(0.1)
									usr.loc=pick(H)
									usr.Frozen=0
									usr.tip1()
									sleep(50)
									usr<<"You wake up in a strange place."
								if("No Way!")
									oview(src)<<"[src] Says: Oh, okay maybe next time."
									usr<<"(Your goal is to survive, not win.)"
									usr.Frozen=0
									//usr<<"You take the magazines."
									//src.icon_state=""
						if("Nah")
							oview(src)<<"[src] Says: Oh okay."
							usr.Frozen=0
							//usr<<"You take the magazines."
							//src.icon_state=""


			Del()
				var/obj/smoke/S=new()
				S.loc=locate(src.x,src.y,src.z)
				view(src)<< sound('Smoke.wav',0,0,1)
				..()


mob
	var
		itachitrain=0
		tmp/asking=0


mob
	proc
		finishstart(mob/M)
			if(prob(80))
				if(M.itachitrain==0)
					oview(src)<<"<font size=1><font color=red><B>[src] Says: Take a walk in my shoes and tell me your resolution..."
					M<<"<font size=1><font color=red><B>[src] has placed you in a genjutsu..."
				if(M.itachitrain==3)
					M.loc=locate(rand(1,5),rand(1,3),1)
				if(M.itachitrain==0)
					spawn(1)
						M<<"<font size=2><font color=yellow><B>You suddenly know how to use The Kawarimi, Clone and Henge jutsu."
						M.contents += new /obj/skill/clones
						M.contents += new /obj/skill/henge
						M.contents += new /obj/skill/kawa
						M.itachitrain+=1
				if(M.itachitrain>=3)
					M.finishprompt()
				if(M.itachitrain==1)
					if(M.asking)
						return
					M.asking=1
					askagain
					spawn(1)
						switch(input(M,"Attack with A, Block with D. Run toggle is in the commands tab")in list ("I Don't Understand","Ok"))
							if("I Don't Understand")
								goto askagain
							else
								M.itachitrain+=1
								M.asking=0
				if(M.itachitrain==2)
					M<<"<font size=2><font color=yellow><B>You must fight harder."
					M.itachitrain+=1
					M.exp+=1000
					spawn(1)
						M.DamageShow(round(1000))
					M.level()

		finishprompt()
			src<<"You have finished the opening scene and your life as a ninja begins now!"
			src.rank="Academy Student"
			src.exp+=500
			src.AwardMedal("I started")
			spawn(30)
				for(var/c in fan)
					if(c==src.key&&src.gotfanreward==0)
						src<<"For being a fan of the hub you recieve some exp and money."
						src.exp+=src.Mexp*3//1000
						spawn(1)
							src.DamageShow(round(src.Mexp*3))
						src.level()
						src.yen+=5000
						src.gotfanreward=1
						src.AwardMedal("I'm a fan!")
			//gain the "Started" medal here
		tip1()
			alert("In this game you may attack block and use jutsu, To attack Tap A, To block Hold D. You will Find jutsu in your skills tab but each one normally will have a cooldown between uses.")
			src<<"In this game you may attack block and use jutsu, To attack Tap A, To block Hold D. You will Find jutsu in your skills tab but each one normally will have a cooldown between uses."



mob
	proc
		Opening()
			src.loc=locate(5,2,1)
			src.dir=NORTH
			src.icon_state="dead"
			src.Frozen=1
			alert("Your story has began and now this is a scene in your new found life.")
			src<<"You wake up in a strange place you have no recollection of how you got there... Find your way out"
			sleep(20)
			src.icon_state=""
			var/x=3
			while(x)
				view(src)<< sound('Smoke.wav',0,0,1)
				x-=1
				sleep(5)
			src<<"Someone is comming...."
			sleep(20)
			src<<"Run!"
			switch(alert("What do you do?",,"Run","Hide","Nothing"))
				if("Run")//if u run you'll probably get away or run intoo some kind of bad guy
					src.IRan()
				if("Hide")//u try to hide if you succed then u have to fight your way through them
					src.Ihide()
				if("Nothing")// possibility to be taken back to their boss for props etc maybe the person stole something
					src.Didnothing()
			src.Frozen=0
		IRan()
			alert("Run!")
			sleep(50)
			/*var/x=rand(3,5)
			while(x)
				src.y+=1
				x-=1
				sleep(3)*/
			if(prob(65))
				var/y=2
				while(y)
					view(src)<< sound('Smoke.wav',0,0,1)
					y-=1
					sleep(2)
				var/mob/npc/Bunshin/A=new()
				if(A)
					if(prob(2))
						A.name="Orochimaru";A.density=0;A.icon='Guy.dmi';A.loc=locate(src.x,src.y+3,src.z)
					else if(prob(10))
						A.name="Danzou";A.density=0;A.icon='Guy.dmi';A.loc=locate(src.x,src.y+3,src.z)
					else
						A.name="Anbu";A.density=0;A.icon='Guy.dmi';A.loc=locate(src.x,src.y+3,src.z)
				if(A.name=="Orochimaru")
					src<<"[A] Says: Hhmm.... you didn't get very far [src]."
					sleep(20)
					switch(alert("Respond?",,"So","Uhh","..."))
						if("So")
							src<<"[src] Says: So..."
						if("Uhh")
							src<<"[src] Says: Uhhh...."
						if("...")
							src<<"[src] Says: ...."
					sleep(20)
					src<<"[A] Says: Well anyway I'm taking you with me for good this time."
					src.village="Sound"
					src.loc=locate(1,1,1)
					//30% chance u get cs here
				if(A.name=="Danzou")
					src<<"[A] Says: After all you did im actually going to give you a second chance, dont dissapoint me..."
					sleep(20)
					switch(alert("Respond?",,"Okay","Go away"))
						if("Okay")
							src<<"[src] Says: So..."
						if("Go away")
							src<<"[src] Says: Go away..."
					sleep(20)
					src<<"[A] Says: Hehe, funny how now matter what you said this was going to happen."
					A.icon_state="jutsuse"
					src.village="Leaf"
					src.loc=locate(1,1,1)
				if(A.name=="Anbu")
					src<<"[A] Says: Go home kid, this is none of your concern."
					sleep(20)
					switch(alert("Respond?",,"Make me","Uhh","..."))
						if("Make me")
							src<<"[src] Says: Make me!"
						if("Uhh")
							src<<"[src] Says: Uhhh...."
						if("...")
							src<<"[src] Says: ...."
					sleep(20)
					src<<"[A] Says: Well anyway I'm taking you with me for good this time."
					src.loc=locate(1,1,1)
				del A
			else
				alert("You managed to get away.")
		Ihide()
			src<<"You try to hide."
			sleep(30)
			if(prob(40))
				src.overlays+='grass.dmi'
				var/mob/npc/Bunshin/A=new()
				if(A)
					A.name="???";A.density=0;A.icon='Guy.dmi';A.loc=locate(src.x,src.y+3,src.z)
				src<<"[A] Says: Where did he go.... I'm gonna be so fired for this...."
				sleep(50)
				del A
				src<<"You managed to get away but its not over yet."
				src.overlays-='grass.dmi'
				src.overlays-='grass.dmi'
				src.overlays-='grass.dmi'
		Didnothing()
			src<<"You stand and do nothing..."
			sleep(50)
			if(prob(60))
				var/t=rand(9,18)
				while(t)
					view(src)<< sound(pick('Smoke.wav','HitMedium.wav','HitWeak.wav','HitStrong.wav'),0,0,1)
					t-=1
					sleep(rand(2,30))
				src<<"Seems they were killed off somehow."
			else if(prob(40))
				src<<"Reminding Joe to finish the Do nothing scene..."
				for(var/mob/M in world)
					if(M.key=="Joejoe13")
						M<<"[src] needs you to finish the 'do nothing' scene with the adding of the bandits or who ever showing up."
				src<<"Joe has been reminded. ^_^"
			else
				src<<"Hmm... Nothing happened..."
