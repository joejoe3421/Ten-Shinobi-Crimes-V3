
mob/paths
	verb
		Psay(msg as text)
			set category = "Paths"
			set desc = "Say something to people in the area of your path"
			set name = "Path Speak"
			for(var/mob/npc/PathBody/P in world)
				if(P.owner==usr && P.InCont)
					for(var/mob/M in view(P))
						M<<"</strong><font color=red></font> <strong>[P.name] Says</strong>:<font color=red>[msg]"
						usr<<"Your path said: <font color=red>[msg]"

mob
	var
		tmp/bodycontrol=0

mob
	verb
		Say(msg as text)
			set category = "Commands"
			set desc = "Say something to people in your area"
			set name = "Say"
			if(msg == ""&&msg == null)
				src << "You must type a message!"
				return
			if(length(msg)>500)
				usr<<"Sorry but what you said was too long(500 cap), but snce you said so much i'll let you see what you would have said so you may break some of it up."
				usr<<"-------"
				usr<<"[msg]"
				return
			for(var/mob/M in view(6))
				if(src.bodycontrol)
					for(var/mob/npc/PathBody/P in world)//make the paths into astral projection type things for players who find the npc with reqz
						if(P.owner==src && P.InCont)
							for(var/mob/L in view(P))
								L<<"<font face=trebuchet MS><b><font color=red>[P.name] Says:<font color=white> [msg]"
							src<<"<font face=trebuchet MS><b><font color=red>[P.name] Says:<font color=white> [msg]"
							return
				M<<"<font face=trebuchet MS><b><font color=red>[src.name] Says:<font color=white> [msg]"
				if(istype(M,/mob/npc/PathBody))
					var/mob/O = M.owner
					if(O&&usr!=O)
						O<<"<font face=trebuchet MS><b><font color=red>[M.name] hears: [src.name]:<font color=white> [msg]"
					//for(var/mob/npc/PathBody/H in world)
						//if(H==M)
							//H.owner<<"<font face=trebuchet MS><b><font color=red>[H.name] hears: [usr.name]:<font color=white> [msg]"
		OOC(msg as text)
			set category = "Commands"
			set desc = "Say something to the world."
			set name = "OOC"
			if(length(msg)>300)
				usr<<"Sorry but what you said was too long(300 cap), but snce you said so much i'll let you see what you would have said so you may break some of it up."
				usr<<"-------"
				usr<<"[msg]"
				return
			if(msg != ""&&msg != null)
				if(usr.mute == 0)
					world << "<font color = green><font size= 1>(OOC)[usr.key]</strong><font color=silver></strong>: [msg]"
				else if(usr.mute >= 1)
					usr << "You are muted."
			else
				usr << "You must type a message!"
		viewupdates()
			set category = "Commands"
			set name = ".View Updates"
			usr.updates()
		invitetext()
			set name = "Invite Players"
			set category = "Commands"
			src<<"</strong><font color=blue></font> <strong>Copy and paste this (Join This Naruto game and give me credit using this number([num2text(src.creditnumber,50)])World Link: byond://[world.address]:[world.port])"

mob
	var
		helpsayon=1
	verb
		Help_Say_Toggle()
			set category = "Commands"
			//set name = "Help Say Toggle"
			if(usr.admin>=0.5)
				usr<<"You can't turn your help say off."
				usr.helpsayon=1
				return
			if(usr.helpsayon==1)
				usr<<"You will no longer recieve help say messages."
				usr.helpsayon=0
			else
				usr<<"You will now recieve help say messages."
				usr.helpsayon=1
		HelpSay(msg as text)
			set category = "Commands"
			set name = "Help Say"
			for(var/mob/M in world)
				if(M.client&&M.helpsayon>=1)
					M << "<font color = green><font size= 2>(((Help Say)))<font size= 1> - [usr.key]: <font color = silver>[msg]"










mob
	verb
		Whisper_Ref(var/mob_ref as text, var/msg as text)
			set hidden = 1
			var/mob/M = locate(mob_ref)
			if(M) Whisper(M, msg)

		Whisper(var/mob/x in world, var/msg as text)
			set hidden = 1
			if(!x.client) return
			var/has_whisper_window = (winexists(x, "whisper__[x.name]") == "MAIN")
			if(usr.mute)
				if(has_whisper_window)
					winshow(usr, "whisper__[x.name]")
					usr << output("You're muted!", "whisper__[x.name].whisper_chat_output")
				else
					usr << "You're muted"

			else
				//msg = Replace_All(msg, whitespace_only_chat_filter)
				if(usr.name)
					if(length(msg) <= 2000&&usr.mute==0)
						//usr.say=0
						if(!has_whisper_window)
							winclone(usr, "whisper_popup", "whisper__[x.name]")
							winset(usr, "whisper__[x.name].whisper_chat_input", "command=\"Whisper-Ref \\\"\ref[x]\\\" \\\"\"")
							winset(usr, "whisper__[x.name]", "title=\"[x.name]\"")
						winshow(usr, "whisper__[x.name]")
						if(!x.client)
							//usr.say = 1
							return
						if(winexists(x, "whisper__[usr.name]") != "MAIN")
							winclone(x, "whisper_popup", "whisper__[usr.name]")
							winset(x, "whisper__[usr.name].whisper_chat_input", "command=\"Whisper-Ref \\\"\ref[usr]\\\" \\\"\"")
							winset(x, "whisper__[usr.name]", "title=\"[usr.name]\"")
						spawn()
							if(x && x.client && winget(x, "whisper__[usr.name]", "is-visible") != "true")
								if(x.admin)
									x << "You have recieved a whisper message from <a href='?src=\ref[usr];action=mute' class='admin_link'>[usr.name]</a>. <a href='?[list2params(list("src"="\ref[x]", "action"="view_whisper", "name"="[usr.name]"))]'>\[View]</a>"
								else
									x << "You have recieved a whisper message from [usr.name]. <a href='?[list2params(list("src"="\ref[x]", "action"="view_whisper", "name"="[usr.name]"))]'>\[View]</a>"
						usr << output("[usr]: <font color=#52ad4d>[html_encode(msg)]", "whisper__[x.name].whisper_chat_output")
						if(x.admin)
							x << output("[usr]: <font color=#52ad4d>[html_encode(msg)]", "whisper__[usr.name].whisper_chat_output")//x << output("<a href='?src=\ref[usr];action=mute' class='admin_link'>[usr]</a>: <font color=#52ad4d>[html_encode(msg)]", "whisper__[usr.name]([usr.key]).whisper_chat_output")
						else
							x << output("[usr]: <font color=#52ad4d>[html_encode(msg)]", "whisper__[usr.name].whisper_chat_output")
						//sleep(2)
						//usr.say=1
						if(x.admin==0&&usr.admin==0)
							for(var/mob/TB in world)
								if(TB.client&&TB.admin>=10)
									TB<<"(WhisperSay)>> [usr] whispered to [x]: [msg]"
								sleep(5)


	Topic(href, href_list)
		switch(href_list["action"])
			if("view_whisper")
				winshow(src, "whisper__[href_list["name"]]")
			if("Shed_Skin")
				if(src.canshed)
					src.skincreate()
			else
				return ..()




mob
	verb
		who()
			set category = "Commands"
			set name = "Who"
			var/tmp
				html
				count
			var/const
				heading = {"
					<html>
						<head>
							<title>Playerlist</title>
							<style type="text/css">
								body {
									color: white;
									background-color: black;
									font-family: Arial, Times, Tahoma, sans-serif
								}
								th {
									font-weight: bold;
									font-size: 13pt
								}
								tr {
									font-size: 12pt;
									padding: 2px. 10px, 2,px, 10px
								}
							</style>
						</head>
						<body>
							<table border="0" width="500">
							<tr align="left">
									<th>Key
									<th>Name
									<th>Rank
				"}

			for(var/mob/M in world)
				if (M.client&&M.name!=M.key) //Ivel requested silent login
					count += 1
					html += "<tr"
					if(M==usr)
						html+=" style=\"color: red; font-weight: bold;\""
					else if(M.admin)
						html+=" style=\"color: yellow; font-weight: bold;\""
					html += "><td>"
					if(M.client.IsByondMember())
						html +="<img src='http://files.byondhome.com/Droc2k6/untitled.bmp'>"
					html += {"
								[M.key]
								<td>[M.name]
								<td><b>[M.rank]</b>
					"}

			html += {"
							<tr>
								<td colspan="5" style="padding-top: 10">
									<hr><b>Players Online: [count]</b>
							</table>
						</body>
					</html>
			"}
			var/count2=0
			for(var/mob/M in world)
				if (M.client&&M.name==M.key)
					count2 += 1
					html += "<tr"
					if(M==usr)
						html+=" style=\"color: red; font-weight: bold;\""
					else if(M.admin)
						html+=" style=\"color: yellow; font-weight: bold;\""
					html += "><td>"
					if(M.client.IsByondMember())
						html +="<img src='http://files.byondhome.com/Droc2k6/untitled.bmp'>"
					html += {"
								[M.key]
								<td>
								<td><b></b>
					"}

			html += {"
							<tr>
								<td colspan="5" style="padding-top: 10">
									<hr><b>Players Currently Not Logged in: [count2]</b>
							</table>
						</body>
					</html>
			"}
			usr << browse("[heading][html]","size=700x500,window=Players Online")

			html = null
			count = null

