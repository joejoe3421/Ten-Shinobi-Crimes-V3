mob
	var
		inparty=0
		partyname=0
		partyid=0
		partyleader=0
		partycount=0
		partyowner=0

mob/squad/leader
	verb
		partyinvite()
			set category = "Commands"
			set name = "Squad Invite"
			set hidden = 1
			if(usr.inparty<=0)
				usr<<"You're not in a squad."
				return
			if(usr.partycount>=3)
				usr<<"Your squad is full."
				return
			var/cl = list()
			for(var/mob/M in view(6,usr))
				if(M.client&&M!=usr&&M.inparty<=0&&M.village==usr.village)
					cl+=M
			var/mob/who=input("Invite who?") in list("None") + cl
			if(who=="None")
				return
			spawn(1)
				usr<<"Your invite to [who] is pending..."
				switch(input(who,"[usr] has invited you to join their squad [usr.partyname], join?")in list ("No","Yes"))
					if("Yes")
						usr<<"[who] joined the squad."
						who.inparty=1
						who.partyowner=usr
						who.partyid=usr.partyid
						who<<"You have joined [usr.partyname]."
						who.Refresh_Squad_Verbs()
						usr.partycount+=1
			usr.Refresh_Squad_Verbs()
		party_kick()
			set category = "Commands"
			set name = "Squad Kick"
			set hidden = 1
			if(usr.inparty<=0)
				usr<<"You're not in a squad."
				return
			var/cl=list()
			for(var/mob/M in world)
				if(M.client&&M.partyid==usr.partyid)
					cl+=M
			var/mob/T=input("Kick Who?") in list("None") + cl
			if(T=="None")
				return
			else
				if(T==usr)
					usr<<"You can't boot yourself."
					return
				T.inparty=0
				usr.partycount-=1
				T.partyowner=0
				T.partyid=0
				usr<<"You booted [T] from the squad."
				T<<"You were booted from the squad."
				T.Refresh_Squad_Verbs()

mob/squadmake
	verb
		partycreate()
			set category = "Commands"
			set name = "Create Squad"
			set hidden = 1
			if(usr.inparty>=1)
				usr<<"You're in a squad."
				return
			usr.partyname=input("Name your squad") as text|null
			usr.inparty=1
			usr.partyleader=1
			usr.partyowner=usr
			usr.partyid="[usr.partyname] [rand(1,9999999999999999999)]"
			usr<<"You create a squad named [usr.partyname]."
			usr.Refresh_Squad_Verbs()


mob/squad
	verb
		party_who()
			set category = "Commands"
			set name = "Squad Who"
			set hidden = 1
			if(usr.inparty<=0)
				usr<<"You're not in a squad."
				return
			usr<<"--Online Squad Members--"
			for(var/mob/M in world)
				if(M.client&&M.partyid==usr.partyid)
					usr<<"[M]"
		party_leave()
			set category = "Commands"
			set name = "Leave Squad"
			set hidden = 1
			if(usr.inparty<=0)
				usr<<"You're not in a squad."
				return
			usr<<"You left [usr.partyname]."
			usr.inparty=0
			usr.partyleader=0
			usr.partyid=0
			usr.Refresh_Squad_Verbs()
			var/mob/O = usr.partyowner
			if(O)
				O.partycount-=1
				O<<"[usr] has left the squad."
mob
	proc
		emergpartyleave()//ermergancy party leave
			if(usr.inparty>=1)
				usr<<"You left [usr.partyname]."
				usr.inparty=0
				usr.partyleader=0
				usr.partyid=0
				usr.Refresh_Squad_Verbs()
				var/mob/O = usr.partyowner
				if(O)
					O.partycount-=1
					O<<"[usr] has left the squad."



mob
	//var
		//tmp/squad/squad
	proc
		Refresh_Squad_Verbs()
			if(!src)
				return
			if(src.inparty)
				if(src)
					winset(src, "squad_menu", "parent=menu;name=\"&Squad\"")
					if(src.partyleader>=1)
						winset(src, "squad_leader_menu", "parent=squad_menu;name=\"&Leader\"")
					winset(src, "squad_verb_leave", "parent=squad_menu;name=\"L&eave Squad\";command=Leave-Squad")
					winset(src, "squad_verb_who", "parent=squad_menu;name=\"&Squad Who\";command=Squad-Who")
					winset(src, "squad_verb_create", "parent=")
					winset(src, "squad_members_menu_item", "is-disabled=false")
				src.verbs += typesof(/mob/squad/verb)
				src.verbs -= /mob/squadmake/verb/partycreate
				if(src.partyleader>=1)
					if(src)
						winset(src, "squad_verb_invite", "parent=squad_leader_menu;name=\"&Invite\";command=Squad-Invite")
						winset(src, "squad_verb_kick", "parent=squad_leader_menu;name=\"&Kick\";command=Squad-Kick")
					src.verbs += typesof(/mob/squad/leader/verb)
			else
				if(src)
					winset(src, "squad_menu", "parent=menu;name=\"&Squad\"")
					winset(src, "squad_verb_leave", "parent=")
					winset(src, "squad_verb_who", "parent=")
					winset(src, "squad_verb_create", "parent=squad_menu;name=\"&Create Squad\";command=Create-Squad")
					winset(src, "squad_leader_menu", "parent=")
					winset(src, "squad_members_menu_item", "is-disabled=true")
				src.verbs += /mob/squadmake/verb/partycreate
				src.verbs -= typesof(/mob/squad/verb)
				src.verbs -= typesof(/mob/squad/leader/verb)



/*

mob
	var
		tmp/squad/squad
	proc
		Refresh_Squad_Verbs()
			var/client/C = client
			if(!C && usr && usr.client)
				C = usr.client
			if(squad)
				if(C)
					winset(C, "squad_menu", "parent=menu;name=\"&Squad\"")
					if(squad.leader == name)
						winset(C, "squad_leader_menu", "parent=squad_menu;name=\"&Leader\"")
					winset(C, "squad_verb_leave", "parent=squad_menu;name=\"L&eave Squad\";command=Leave-Squad")
					winset(C, "squad_verb_create", "parent=")
					winset(C, "squad_members_menu_item", "is-disabled=false")
				verbs -= /mob/human/verb/Create_Squad
				verbs += typesof(/mob/squad_verbs/verb)
				if(squad.leader == name)
					if(C)
						winset(C, "squad_verb_invite", "parent=squad_leader_menu;name=\"&Invite\";command=Invite-to-Squad")
						winset(C, "squad_verb_kick", "parent=squad_leader_menu;name=\"&Kick\";command=Kick-from-Squad")
					verbs += typesof(/mob/squad_verbs/leader/verb)
			else
				if(C)
					winset(C, "squad_menu", "parent=menu;name=\"&Squad\"")
					winset(C, "squad_verb_create", "parent=squad_menu;name=\"&Create Squad\";command=Create-Squad")
					winset(C, "squad_leader_menu", "parent=")
					winset(C, "squad_members_menu_item", "is-disabled=true")
				verbs += /mob/human/verb/Create_Squad
				verbs -= typesof(/mob/squad_verbs/verb)
				verbs -= typesof(/mob/squad_verbs/leader/verb)



*/