

var
	pickableclans=list("Uchiha","Uzumaki","Senju","Clay","Kaguya","Akimichi","Hyuuga","Spider","Sand","Jashin","Yamanaka","Inuzuka","Hoshigaki","Hozuki","Fuuma")
	clansintesting=list("Aburame","Puppeteer","Kamizuru","Kaguya","Nara","Gedou","Origami","Yota","Yuki","Sakon")
	promocode="kfbkfbdufbedhjfjs[rand(1,999999999999)]"
	gotpromo=list()
	promoreward=null//pick, Exp, Money, or Bonus Point
	testers=list()
	allowguest=1


proc
	promopick()
		var/letters=list("A","a","B","b","C","c","D","d","E","-","e","F","f","G","g","H","h","I","i","-","J","j","K","k","L","l","M","m","N","n","O","o","P","p","-","Q","q","R","r","S","s","T","t","U","u","V","v","W","w","X","x","Y","y","Z","z","1","2","3","4","5","6","7","8","9","0","-")
		var/length=rand(6,9)
		var/newpromo=""
		while(length>0)
			var/newletter="[pick(letters)]"
			newpromo="[newpromo][newletter]"
			length-=1
			sleep(1)
		promocode="[newpromo]"
		gotpromo=list()
		promoreward=pick("Money","Bonus Point","Exp","Money","Exp")
		world<<"A new Promo code is about to be released!"
		spawn(600)
			world<<"A New Promo Code has been released! Check the game's updates for the code."

mob
	var
		invited=list()//add the computeradresses of those who gave invite credit here
		creditnumber=null
		tmp/doingpromo=0
		trait1=""
		trait2=""
/*client
	var
		invited=list()*/
mob
	proc
		invitecredit()
			if(src.admin)
				src<<"Admin are not allowed to give invite credit, you should have already be here..."
				return
			else
				again
				switch(input(src,"Were you invited by someone?")in list ("Huh","No","Yes"))
					if("Huh")
						alert(src,"This is the part where you could give someone who invited you credit if they did invite credit, if you were not invited go to no next time it asks.","Invitation Help","Oh")
						goto again
					if("Yes")
						var/howto=input("Whats the number they gave you to give them credit?(If they didn't don't put anything)") as num
						for(var/mob/M in world)
							//var/mob/M = U
							if(M.client&&M.creditnumber==howto&&src.client.computer_id!=M.client.computer_id)
								if(src.client.computer_id in M.invited)
									src<<"You've already given them credit once."
									return
								else
									M.invited+=src.client.computer_id
									src<<"You've given [M] credit for inviting you."
									M.exp+=M.Mexp*1.5
									spawn(1)
										M.SaveK()
										M.DamageShow(round(M.Mexp*1.5))
								world<<"[M] was rewarded for inviting [src] to the game."
							sleep(1)
mob
	verb
		goforpromo()
			set name = "Enter Promo Code"
			set category = "Commands"
			if(src.doingpromo>=1)
				return
			usr.getpromoprize()
	proc
		getpromoprize()
			if(src.doingpromo>=1)
				return
			src.doingpromo=1
			var/promo=input("What's the current Promo Code?") as text
			if("[src.key]" in gotpromo)
				src<<"You already used today's Promo Code."
				src.doingpromo=0
				return
			if("[promo]"=="[promocode]")
				src<<"Retriving reward information..."
				src.promoreward(rand(2.213,5.885))
				world<<"[src] was rewarded for entering a current Promo Code, they are located in the hub's updates. Fan the game to get them easier."
				gotpromo+="[src.key]"
			else
				src<<"Seems that code is invalid."
			src.doingpromo=0


mob
	proc
		promoreward(mult)
			if(mult<=0)
				mult=1
			if(mult>=15)
				mult=15
			var/inprizes=list()
			if(src.levelcapped==0)
				inprizes+="Experience"
			inprizes+="Money"
			inprizes+="Bonus Point"
			if("[src.key]" in gotpromo)
				src<<"You already used today's Promo Code."
				return
			//switch(input(src,"What reward would you like?")in inprizes
			if(promoreward=="Exp")
				if(levelcapped==0)
					var/reward=(src.Mexp*rand(1,1.2))*mult
					src<<"You are rewarded [reward] exp"
					src.exp+=(reward*mult)
					spawn(1)
						src.DamageShow(round(reward*mult))
				else
					var/newreward=pick("Money","Bomus Point","Money")
					if(newreward=="Money")
						src<<"You gained [2000*mult] dollars."
						src.yen+=(2000*mult)
					if(newreward=="Bouns Point")
						src<<"You gained [1*mult] bonus points."
						src.bonuspoints+=(1*mult)
			if(promoreward=="Money")
				src<<"You gained [2000*mult] dollars."
				src.yen+=(2000*mult)
			if(promoreward=="Bouns Point")
				src<<"You gained [1*mult] bonus points."
				src.bonuspoints+=(1*mult)

proc
	deletemobstuff(person)
		var/mob/O=person
		if(O==null)
			return
		var/mob/npc/elementclone/K=new()
		if(K)
			K.name="Player stuff deleter";K.density=0;K.owner=O
		spawn(1)
			for(var/mob/npc/T in world)
				if(T.owner==K.owner&&T!=K)
					del O
					sleep(1)
			del K


mob
	Logout()
		if(src.inevent>0)
			src.loc=src.eventreturn
			eventplayers-=1
			eventplayerlist-=src
			src.inevent=0
			src<<"You Left the [event] event."
			if(src.bossevent)
				for(var/mob/R in world)
					if(R.inevent>0)
						R.loc=R.eventreturn
						eventplayers-=1
						eventplayerlist-=R
						R.inevent=0
						R.canjoin=1
						R.bossevent=0
						R<<"Because [src] logged out the event is canceled and ended early."
		world << "[src] has logged out."
		deletemobstuff(src)
		del src
	Login() //telling it to activate a byond built in proc!
		if(usr.key=="Guest")
			if(allowguest==0)
				usr << "<b>NO guests allowed at the moment sorry, we need true players!"
				del(usr)
		usr.loc=locate(58,591,2)
		if(usr.key=="Joejoe13")//||usr.key=="Katkiller91"||usr.key=="AtherionHope")add admin proc to assign admin verb from levels 1-10
			src.admin=11
		usr.loc=locate(58,591,2)
		alert("Welcome to Path Of the Shinobi")
		usr.loc=locate(58,591,2)
		sleep(2)
		usr.start()
		//usr.loc=locate(1,1,1)
		for(var/mob/M in world)
			if(M.admin)
				M<<"[usr] has logged in the game." //tells the world
		//src<<"Want to keep up with the game with it's up and when updates are made?  Find Katkiller91 or Joejoe13's keys they look under their favorites and fan the game."
		src<<"Help the game progress further by inviting friends and getting them to fan the <a href=http://www.byond.com/games/Joejoe13/PathOfTheShinobi/>hub</a>."
		spawn(100)
			src<<"<font size=1><font color=yellow><B>Tip: Fans get a reward for being a fan of the game. ;)"
		src<<"World Link: byond://[world.address]:[world.port]"
	Move()
		if(src.moving==1||src.Frozen==1||src.kaiten==1||src.ko>=1||src.bind>=1||src.resting||src.insand)
			return
		if(src.mindcaught)
			return
		if(src.doingseals==1&&src.sealspeed>1.500)
			return
		src.moving = 1
		for(var/mob/enemy/M in oview(9)) if(!M.woken&&M.ko==0&&M.assassin==0) spawn() AI(M,src)
		//for(var/mob/village/Medic/M in oview(5)) if(!M.woken) spawn() AImedic(M,src)
		var/prevloc=src.loc
		var/prevdir=src.dir
		if(src.inmindtransfer)
			for(var/mob/R in world)
				if(R.mindcaught&&R.mindcontroller==src)
					R.mindcaught=0
					step(R,src.dir)
					R.mindcaught=1
			src.loc=prevloc
			src.dir=prevdir
			spawn(src.movedelay-(src.run*0.75))
				src.moving = 0
		..()
		var/atom/O = src.missiondestination
		if(O) //If you have a target.
			for(var/obj/Arrow/A in src.client.screen)
				animate(A, transform = turn(matrix(), get_angle_nums(src.x,src.y,O.x,O.y)), time = 3, loop = 1) //Play with the time to have it look cooler
		if(src.inmindtransfer)//||src.gates>=3)
			src.loc=prevloc
		if(src.jokiboi)
			src.heatlevel+=1
		if(src.intsu)
			//var/obj/inutrail/A=new
			var/obj/inutrail/A=new/obj/inutrail(prevloc)
			//A,loc=src.prevloc
			A.owner=src
			A.dir=src.dir
		if(src.rtornado)
			var/obj/jutsu/aftershock/A=new();A.owner=src;A.power=(src.nin*0.10);A.loc=src.loc
		/*if(src.inmindtransfer)
			for(var/mob/R in world)
				if(R.mindcaught&&R.mindcontroller==src)
					R.mindcaught=0
					step(R,src.dir)
					R.mindcaught=1
			src.loc=prevloc
			src.dir=prevdir
			spawn(src.movedelay-(src.run*0.75))
				src.moving = 0
			return*/
		if(src.stun)
			src.stun-=1
			if(src.stun<0)
				src.stun=0
			if(src.stun>15)
				src.stun=15
			if(src.stun>10)
				sleep(rand(10,20))
			if(prob(80))
				sleep(rand(5,7))
		//if(src.onwater)
			//src.WATER()
		if(src.run<=0&&src.demonstage<=0)
			src.icon_state=""
		if(src.run&&src.demonstage<1)
			src.icon_state="running"
		if(src.demonstage>=1)
			src.icon_state="beastman"
			src.run=1
		if(src.chidorion>0||src.rasenganon>0)
			src.icon_state="chi/ras"
		if(src.susanoo>=2)
			src.run=0
			if(src.ko==0)
				src.icon_state=""
		if(src.shika)
			src.icon_state="beastman"
			if(src.beastmastery<100)
				if(prob(3))
					src.beastmastery+=0.01
		if(src.gates>=3)
			spawn(1)
				src.Quick()
		//if(src.weapon!="")
			//src.icon_state="weapon"
		var/takefrom=(src.run*0.6)+(src.shika*0.1)+(src.gates*0.25)
		var/normaltake=src.movedelay-takefrom
		if(normaltake<0.1)
			normaltake=0.1
		var/result=normaltake
		if(src.jokiboi)
			spawn(result+(src.heatlevel*0.05))
				src.moving = 0
		else
			spawn(result)//src.movedelay-(src.run*0.6)+src.shika*0.1)
				src.moving = 0


mob
	var
		tmp/movedelay = 1.6
		tmp/moving = 0
		tmp/speed1 = 1.3
		tmp/speed2 = 1
		tmp/speed3 = 0.6
		tmp/speed4 = 0.3
		tmp/speed5 = 0.1
		tmp/savedspeed = 1.6









obj
	var
		Frozen=0
	Move()
		if(src.moving==1||src.Frozen==1)
			return
		src.moving = 1
		..()
		spawn(src.movedelay)
			src.moving = 0


obj
	var
		tmp/movedelay = 0.8
		tmp/moving = 0
		tmp/speed1 = 1.2
		tmp/speed2 = 0.9
		tmp/speed3 = 0.5
		tmp/speed4 = 0.2
		tmp/speed5 = 0
		tmp/savedspeed = 1.4






mob
	proc
		admingive()
			if(src.admin>=1)
				src.verbs += typesof(/mob/admin1/verb)
			if(src.admin>=2)
				src.verbs += typesof(/mob/admin2/verb)
			if(src.admin>=3)
				src.verbs += typesof(/mob/admin3/verb)
			if(src.admin>=4)
				src.verbs += typesof(/mob/admin4/verb)
				//src.verbs += typesof(/mob/admin4/verb)
				//src.verbs += typesof(/mob/admin5/verb)
				//src.verbs += typesof(/mob/admin6/verb)
			if(src.admin>=7)
				src.verbs += typesof(/mob/admin7/verb)
			if(src.admin>=8)
				src.verbs += typesof(/mob/admin8/verb)
				//src.verbs += typesof(/mob/admin9/verb)
				//src.verbs += typesof(/mob/admin10/verb)
			if(src.admin>=11)
				src.verbs += typesof(/mob/owner/verb)
				/*src.verbs += new /mob/normal/verb/rbody()
				src.verbs += new /mob/wiz/verb/smsos()
				src.verbs += new /mob/admin/verb/Edit()
				src.verbs += new /mob/normal/verb/DP()
				usr.verbs += typesof(/mob/skage/verb)*/
			if(src.key in testers)
				src.verbs += typesof(/mob/tester/verb)











mob
	DblClick()
		if(src == usr||distance(src,usr) >= usr.targetrange)return // if the source is the user, return. // you can also change 10 if you wish
		for(var/image/x in usr.client.images) // first, check to see if your have a target.
			if(x.icon=='target.dmi') /// if so.
				del(x) // delete it.
		var/image/I = image('target.dmi',src) // create a new target on the source.
		usr<<I // make it so only u can see the target
		usr.target=src // make your target variable source name.
		usr<<"<b><font color=blue>You target [src]" // tell yourself your you targeted him/her.


turf
	DblClick()
		if(usr.woodmode)
			var/mob/npc/JukaiKoutan/A=new()
			A.health+=(usr.suitonknowledge+usr.dotonknowledge)*1.12
			A.loc=src;A.owner=usr
			A.Frozen=1
			usr.chakra-=100



mob
	var
		tmp/target = null // the var to tell you your target
		targetrange=15

mob/proc/DeleteTarget()
	src.target=null
	for(var/image/x in src.client.images)
		if(x.icon=='target.dmi')
			del(x)

mob/verb/deletetarget()
	set hidden =1
	usr<<"<b><font color=blue>You have untargeted."
	usr.target=null
	for(var/image/x in usr.client.images)
		if(x.icon=='target.dmi')
			del(x)




client
	Move()
		if(ismob(src.mob.target)&&get_dist(src.mob.target,src.mob)>= src.mob.targetrange) // you can change the 5 to whatever you wish
			src.mob.DeleteTarget()
		..()
/*client/Del()
	..()
	if(ismob(mob.target))
		src.mob.DeleteTarget()*/





mob
	proc
		Gender()
			//src.statmake()
			again
			src.creditnumber=rand(1,9999999999999999999999999999999)
			spawn(1)
				for(var/mob/RE in world)
					if(RE.client&&RE!=src)
						if(src.creditnumber==RE.creditnumber)
							goto again
					sleep(1)
			switch(input(usr,"What gender do you wish to be?")in list ("Male","Female","Random"))
				if("Male")
					usr.icon = 'Guy.dmi'
					var/vo=pick("Ichigo","Link","Gin","Hitsugaya","Aizen","Naruto","Sasuke","Itachi","Neji")
					src.voice=vo
					var/Base='Guy.dmi'
					Base+=rgb(201,145,100)
					src.icon=Base
					src.overlays-='Boxers.dmi'
					src.overlays+='Boxers.dmi'
					src.overlays-='MaleEyes.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays-='Eyes.dmi'
					src.overlays+='Eyes.dmi'
					src.AwardMedal("I'm a boy!")
				if("Female")
					usr.icon = 'Guy.dmi'
					var/vo=pick("Orihime","Rukia","Soifon")
					src.voice=vo
					var/Base='Guy.dmi'
					Base+=rgb(201,145,100)
					src.icon=Base
					src.overlays+='Panties.dmi'
					src.overlays+='Bra.dmi'
					src.overlays-='FemaleEyes.dmi'
					src.overlays+='FemaleEyes.dmi'
					src.overlays-='Eyes.dmi'
					src.overlays+='Eyes.dmi'
					src.AwardMedal("I'm a girl!")
				if("Random")
					if(prob(50))
						usr<<"Your randomly choosen to be a boy."
						usr.icon='Guy.dmi'
						var/vo=pick("Ichigo","Link","Gin","Hitsugaya","Aizen","Naruto","Sasuke","Itachi","Neji")
						src.voice=vo
						var/Base='Guy.dmi'
						Base+=rgb(201,145,100)
						usr.icon=Base
						usr.overlays-='Boxers.dmi'
						usr.overlays+='Boxers.dmi'
						usr.overlays-='MaleEyes.dmi'
						usr.overlays+='MaleEyes.dmi'
						usr.overlays-='Eyes.dmi'
						usr.overlays+='Eyes.dmi'
					else
						usr<<"Your randomly choosen to be a girl."
						usr.icon='Guy.dmi'
						var/vo=pick("Orihime","Rukia","Soifon")
						src.voice=vo
						var/Base='Guy.dmi'
						Base+=rgb(201,145,100)
						src.icon=Base
						src.overlays+='Panties.dmi'
						src.overlays+='Bra.dmi'
						src.overlays-='FemaleEyes.dmi'
						src.overlays+='FemaleEyes.dmi'
						src.overlays-='Eyes.dmi'
						src.overlays+='Eyes.dmi'
					src.AwardMedal("I'm random")
			var/obj/clothes/shirt/S = new(src)
			S.loc=src
			S.suffix="Equipted"
			S.hason=1
			src.overlays+=S.icon
			var/obj/clothes/shoes/B = new(src)
			B.loc=src
			B.suffix="Equipted"
			B.hason=1
			src.overlays+=B.icon
			var/obj/clothes/pants/F = new(src)
			F.loc=src
			F.suffix="Equipted"
			F.hason=1
			src.overlays+=F.icon
			spawn(1)
				src.starttip()


mob
	proc
		Gender2()
			switch(input(usr,"What gender are you?")in list ("Male","Female"))
				if("Male")
					src.overlays-='Boxers.dmi'
					src.overlays+='Boxers.dmi'
					src.overlays-='MaleEyes.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays-='Eyes.dmi'
					src.overlays+='Eyes.dmi'
				if("Female")
					src.overlays+='Panties.dmi'
					src.overlays+='Bra.dmi'
					src.overlays-='FemaleEyes.dmi'
					src.overlays+='FemaleEyes.dmi'
					src.overlays-='Eyes.dmi'
					src.overlays+='Eyes.dmi'



mob
	proc
		starttip()
			if(src.admin<=0)
				starting
				spawn(1)
					src.startguide()
				switch(input(src,"Right click npc to talk to them")in list ("I don't understand","Got it"))
					if("I don't understand")
						goto starting
					else
						var/howto=input("How do you talk to NPC?(2 words)") as text
						if(howto=="Right Click"||howto=="right click"||howto=="RightClick"||howto=="rightclick"||howto=="Right click"||howto=="right Click")
							src<<"Good, now do what you were taught to do and talk to the npc around here."
							src.AwardMedal("I can read!")
						else
							goto starting
			else
				src<<"Because you are admin you should know how to play, if not use help in commands tap and read the guides."
			src.willpower=pick(0.35,0.40,0.45,0.50,0.55,0.60,0.55,0.50,0.45,0.40,0.35)







mob
	proc
		Name()
			var/prompt_title = "Name"
			var/help_text = "Choose an appropriate name for your character. (30 character limit)"
			var/char_name = input(usr, help_text, prompt_title,) as null|text
			char_name=copytext(char_name,1,30)
			char_name=html_encode(char_name)
			usr.name = char_name
			if(usr.name == "" | usr.name == null)
				usr.Name()





mob
	var
		voice=""
		poolmulti=0




mob
	proc
		Clan_Select()
			sleep(30)
			if(src.opening>=2)
				return
			//set category = "Commands"
			//var/tod=pick("Katon","Suiton","Doton","Raiton")
			var/vil=pick("Sound","Leaf","Sand","Waterfall","Cloud","Rock")
			//var/vo=pick("Ichigo","Link","Gin","Hitsugaya","Aizen","Naruto","Sasuke","Itachi","Neji")
			//src.voice=vo
			//src.element=tod
			src.village=vil
			//src.chanse()
			/*var/foodin = list()
			for(var/obj/food/C in src.contents) /// ------example-------
				foodin += C*/
			placeholder
			var/testme=0
			if(src.key in testers)
				testme=1
				world<<"Tester Noticed."
			var/otherclans=list()
			if(src.admin>=6||testme>=1)//src.key in testers)
				otherclans += list("--Clans in Testing--")
				otherclans += clansintesting
			sleep(10)
			var/M = input("What clan?","[src]") in list("None") + pickableclans + otherclans// + list("Cancel")
			if(M=="--Clans in Testing--")
				goto placeholder
			src.clan="[M]"
			src.claninfo()
			switch(input(usr,"Would you like to be this clan?")in list ("No","Yes"))
				if("No")
					goto placeholder
				else
					if(src.clan=="Uzumaki")
						src.basic=0.85
						if(prob(2))
							src.rinnepoten=1
					if(src.clan=="Hoshigaki")
						var/Base='Icons/New Base/Base.dmi'
						Base+=rgb(102,114,142)
						src.icon=Base
						src.sharkskin=1
						src.element="Suiton"
					if(src.clan=="None")
						src.basic=0.5
					if(src.clan=="Uchiha")
						src.mswho = pick("Madara","Sasuke","Itachi","Obito","Shisui","Other","Izuna")
						src.mskills=rand(15,45)
						src.msM=rand(600,3000)
						src.eyelimit=rand(15,50)
						if(src.mswho=="Izuna")
							src.eyelimit+=20
						src.element="Katon"
						src.eyelimitmulti=pick(0.5,0.6,0.7,0.8,0.9,1,1.5,1.6,1.7,1.8,1.9,2,0.9,0.8,0.7,0.6,0.5)
					if(src.clan=="Hyuuga")
						src.contents += new /obj/skill/byakugan
						src.style="Jyuken"
					if(src.clan=="Hozuki")
						src.contents += new /obj/skill/hozuki
						src.element="Suiton"
					if(src.clan=="Senju")
						if(prob(88))
							src.element="Doton"
							src.hassuiton=1
						else
							src.hassuiton=1
							src.hasdoton=1
					if(src.clan=="Puppeteer")
						//src.contents += new /obj/puppetscroll
						src.contents += new /obj/skill/puppetmaster
						var/mob/puppet/regular/A=new()
						A.loc=src
						A.Mtai=10
						A.Mnin=10
						A.Mgen=10
						A.name="Basic Puppet"
						A.overlays+='Arms.dmi'
						A.overlays+='Raven.dmi'
						A.combolimit=1
						A.Mhealth=5000
						A.health=A.Mhealth
						src<<"You recieve a basic puppet."
					if(prob(1))
						if(src.clan!="Uchiha")
							src.rinnepoten=1
					src.Oicon=src.icon
					//if(src.clan=="Hyuuga")
						//give byakugan
					/*src.poolmulti=pick(2.1,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,3,3.1,3.2,3.4,3.5,2.1,2.3,2.4,2.1)
					if(prob(6))
						src.poolmulti=pick(3.6,3.7,3.8,3.9,4,3.9,3.8,3.7,3.6)
					src.chakrapoolmax=src.Mchakra*src.poolmulti*/




					spawn(50)
						//src<<"You were born into the Hidden [src.village] Village."
						for(var/mob/V in world)
							if(V.village==src.village)
								V<<"[src] has been born into The Hidden [V.village] Village!"
/*
			switch(input(usr,"What clan would you like to be?")in list ("Aburame","Akimichi","Nara","Yamanaka","Kamizuru","Uchiha","Uzumaki","Hyuuga","Kaguya","None"))
				if("Uchiha")
					alert("Note: The uchiha are a balanced and fearse clan. They have a Doujutsu called the Sharingan that allows them to see chakra and copy moves and if strong enough cast genjutsu. This clan holds many secrets. This clan is half way done.")
					//usr.Race="Alien"
					//icon = 'Guy.dmi'
					src.clan="Uchiha"//makes clans a percentrage type thing, then when making so u can be more than one clan the mother gives half her clan and the father half his, they both give half of all the clans they are
					icon_state = ""//---the equation would look like this: (uchiha*0.50)+(uchiha*0.50) = kid's uchiha blood and so on for all the rest
					//src.Gender()
					//src.hair()
				if("Hyuuga")
					alert("Note:The hyuuga are a clan that focuses solely on Taijutsu(strength) and Speed(Rush) They have very strong and quick techniqes that can strike opponet's chakra and seal it away in only a few hits. This clan is almost done.")
					//usr.Race="Alien"
					//icon = 'Guy.dmi'
					src.clan="Hyuuga"
					icon_state = ""
					//src.Gender()
					src.verbs+= /mob/hyuuga/verb/byakugan
				if("Uzumaki")
					alert("Note: This clan is not completly done. With this being a basic clan it gets starting boosts, and a higher chanse to get special things.")
					//usr.Race="Alien"
					//icon = 'Guy.dmi'
					src.basic=0.5
					src.clan="Uzumaki"
					icon_state = ""
					//src.Gender()
				if("None")
					alert("Note: This clan is not nearly done. The perk of being a None clan A.K.A Basic ninja is you get higher chanses at gaining special things like Super Human Traits and even Special Dojutsu.")
					//usr.Race="Alien"
					//icon = 'Guy.dmi'
					//src.chanse()
					//return
					src.basic=1
					src.clan="None"
					icon_state = ""
					//src.Gender()
					//src.hair()
				else
					alert("Note: If your seeing this message it simply means that the clan you picked is not in yet, bare with us it will be added in time but since its not you have been made anone clan ninja. The perk of being a None clan A.K.A Basic ninja is you get higher chanses at gaining special things like Super Human Traits and even Special Dojutsu.")
					//usr.Race="Alien"
					//icon = 'Guy.dmi'
					src.basic=1
					src.clan="None"
					icon_state = ""
*/
					//src.Gender()
			//src.hasclan=1
			//src.chanse()




mob
	proc
		claninfo()
			if(src.clan=="Uchiha")
				alert("The uchiha are a balanced and fearse clan. They have a Doujutsu called the Sharingan that allows them to see chakra and copy moves and if strong enough cast genjutsu. This clan holds many secrets. This clan is half way done.")
			else if(src.clan=="None")
				alert("This clan is not nearly done. The perk of being a None clan A.K.A Basic ninja is you get higher chanses at gaining special things like Super Human Traits and even Special Dojutsu.")
			else if(src.clan=="Uzumaki")
				alert("This clan is not completly done. With this being a basic clan it gets starting boosts, and a higher chanse to get special things.(mostly perks, no jutsu)")
			else if(src.clan=="Sand")
				alert("Using sand as their main weapon they are a formidable foe, both having a strong defence and terrifying offence. ")
			else if(src.clan=="Akimichi")
				alert("Slow but powerful the Akimichi jutsu depend on how full they are, if completely full their jutsu even gain a boost in damage, taijutus based.")
			else if(src.clan=="Hoshigaki")
				alert("A clan that are scaled like sharks, they have sharp shark skin and gain a lot of chakra.")
			else if(src.clan=="Yamanaka")
				alert("A clan that is one with the mind, able to use it to control others and even destroy minds.")
			else if(src.clan=="Hyuuga")
				alert("With the fearsome doujutsu the Byakugan the Hyuuga can see through any and eveything. Nothing can be hidden from them.")
			else if(src.clan=="Hozuki")
				alert("Masters of the Water style, the Hozuki posess the ability to transform their own bodys into water and harness the water in ways others can't.")
			else if(src.clan=="Senju")
				alert("The Senju clan goes back far beyond most other clans, a strong rivaly with the Uchiha. The Senju clan uses secret wood style jutsu.")
			else if(src.clan=="Inuzuka")
				alert("The Inuzuka clan are a clan who can tame animals quite easily and befriend them to the point where they become partners although, The inuzuka normally befriend dogs.")
			else if(src.clan=="Clay")
				alert("A artistic based clan hail from the it's one member, Deidara. With Mouths of their hands they are able to infuse and control clay objects only to make them explode in time.")
			else if(src.clan=="Kaguya")
				alert("A clan based on dances, danes that use bones but not any old bones. Their own bones.")
			else if(src.clan=="Spider")
				alert("A clan based off of Kidomaru, Orochimaru's subject gifted with abilitie sliek that of a spider. Spiders, webs the whole 9 yards but with special Golden techniques.")
			else if(src.clan=="Jashin")
				alert("A clan based on Death and killing, A clan that gains immortality on every kill from their 'Lord' Jashin")
			else if(src.clan=="Puppeteer")
				alert("A clan based on puppets, controling them and installing things into them, making them and upgrading them. Not a easy clan to begin with.")
			/*if(src.clan=="")
				alert("")*/
			else
				alert("This clan doesn't not have a description yet.")




mob
	proc
		start()
			//set category = "Commands"
			if(src.loaded)
				return
			switch(input(usr,"What would you like to do?")in list ("New","Load","Delete","What's New?"))
				if("New")
					usr.savecheck()
					//usr.startlocrand()
					usr.client.screen+=new/obj/hud/health
					usr.client.screen+=new/obj/hud/chakra
					usr.client.screen+=new/obj/hud/struggle
					usr.client.screen+=new/obj/hud2/ooc
					usr.client.screen+=new/obj/hud2/say
					usr.client.screen+=new/obj/hud2/whisper
					if(usr.opening<6)
						var/obj/Arrow/A = new
						usr.client.screen += A
					spawn(1)
						usr.FadeScreen()
					//spawn(1)
						//usr.startscene()
					usr.oldcregen=usr.cregen
					usr.poolmulti=pick(3.1,3.2,3.3,3.4,3.5,3.6,3.7,3.8,3.9,4,4.1,4.2,4.4,4.5,3.1,3.3,3.4,3.1)
					if(prob(6))
						usr.poolmulti=pick(4.6,4.7,4.8,4.9,5,4.9,4.8,4.7,4.6)
					usr.chakrapoolmax=usr.Mchakra*usr.poolmulti
					usr.admingive()
					usr.Refresh_Squad_Verbs()
					/*usr.contents += new /obj/skill/clones
					usr.contents += new /obj/skill/henge
					usr.contents += new /obj/skill/kawa*/
					/*usr.Race_Select()
					usr.chanse()
					usr.namenote()
					usr.Name()
					//usr.startloc()
					usr.aligpick()
					usr.Greatest_Stat()
					usr.child2()
					usr.SaveK()
					spawn(50)
						usr.AutoSave()*/
					/*if(prob(10))
						usr.starting()
						//usr << 'Saveyourself.wav'
					else
						usr.startloc()*/
						//usr << 'Crawling.wav'
					//usr.overlaysave += overlays
				if("Load")
					usr.client.screen+=new/obj/hud/health
					usr.client.screen+=new/obj/hud/chakra
					usr.client.screen+=new/obj/hud/struggle
					usr.client.screen+=new/obj/hud2/ooc
					usr.client.screen+=new/obj/hud2/say
					usr.client.screen+=new/obj/hud2/whisper
					spawn(1)
						usr.FadeScreen()
						sleep(200)
						usr.blinding()
					usr.LoadPlayer()
					spawn(30)
						usr.Greatest_Stat()
					spawn(30)
						usr.nregen()
					usr.admingive()
					usr.invisibility=0
					usr.sight&=~(SEE_SELF|BLIND)
					usr.Refresh_Squad_Verbs()
					if(usr.opening<6)
						var/obj/Arrow/A = new
						usr.client.screen += A
					/*alert("This is not currently working. You will now be sent back to the start. Go to new this time.")
					usr.start()
					return*/
				if("Delete")
					usr.PwipeS()
					//del(usr)
				if("What's New?")
					//alert("")
					//alert("Added juggernaut event for players, Madara NPC now has more jutsu")
					//alert("More boss fight types, Zetsu Army, Sound Five, Orochimaru, and Sasori")
					//alert("Fixed puppets, they now work by a targeting system and strings, dont lose them(if you do you have a make new ones). Fixed targeting, when a target walks off your screen you'll lose their target. Added in a few built in macros: A and S to attack, U to untarget")
					usr.updates() //its on if you ever need to change it or add to it

					//alert("Death is no longer instant it takes time and you have the ability to get revived before you completely die.")
					//alert("For those who are a first generation character don't think you will never gain skill because you will, Hint: The more you breed(higher the generation) The faster you gain. And you get the ability to mate at the age of 16.")
					//alert("Added snake poison(not achivable yet, will have to be born a special snake to have venom)")
					//alert("Mating system now more specific, you need to be male and female otherwise theres a very very low chanse on making a kid but its possable.")
					//alert("Humans now have the fastest training and wizards the slowest, animals are in between the both. Humans start with better stat mods and are evenly balanced among stat mods")
					sleep(50)
					usr.start()












mob
	Stat()
		statpanel("Status")
		//stat(src)
		stat("")
		if(src.immortality>=1)
			stat("Immortal Time:","[src.immortality]")
		if(src.skinlayers>0)
			stat("Bodies:","[src.skinlayers]")
		if(src.ko>=2)
			stat("Struggle:","[(src.struggle/src.koamm)*100]%")
		if(src.clan=="Hozuki")
			stat("Hydration:","[src.hydration]%")
		if(src.nenergy>0)
			stat("Natural Energy:","[(src.nenergy/src.Mnenergy)*100]%")
		if(src.clan!="None")
			stat("[src.name] The [src.clan]")
		else
			stat("[src.name] The Basic Ninja")
		//stat("World Event:","[event]")
		stat("Village","[src.village]")
		if(src.levelcapped==0)
			stat("Level","[src.level]")
			stat("Experience","[src.exp]/[src.Mexp]([(src.exp/src.Mexp)*100]%)")
		//stat("Clan:","[clan]")
		stat("Rank:","[src.rank]")
		var/classlevel=src.kills-src.deaths
		if(classlevel<0)
			classlevel=0
		stat("Class Level:","[classlevel]")
		//if(!src.Class=="None")
			//stat("Class","[Class]")
		stat("Health:","[round((usr.health/usr.Mhealth)*100)]%")
		stat("Chakra:","[round((usr.chakra/usr.Mchakra)*100)]%")
		if(src.chakrapoolmax>0)
			stat("Chakra Resivoir:","[round((usr.chakrapool/usr.chakrapoolmax)*100)]%")
		stat("Strength","[round(strpcnt)]%")
		stat("Power","[round(powpcnt)]%")
		stat("Control","[round(defpcnt)]%")
		stat("Skill Points:","[src.statp]")
		stat("Stomach:","[src.stomach]")
		stat("Yen:","[src.yen]")
		//stat("Stamina","[round((usr.stam/250)*100)]%")
		stat("Location:","[x],[y],[z]")
		stat("--------","--------")
		if(statpanel("Stats"))
			if(src.special!="")
				stat("Specialty:","[src.special]")
				stat("----------------------------")
			if(src.byaM>0)
				stat("Byakugan Mastery","[src.byaM]")
			if(src.sharM>0)
				stat("Sharingan Mastery","[src.sharM]")
			if(src.clan=="Inuzuka")
				stat("Beast Mastery","[src.beastmastery]%")
			if(src.clan=="Clay")
				stat("Clay Pieces:","[src.clay]")
				stat("Art Mastery","[src.artmastery]%")
				stat("Explosive Mastery","[src.explosivemastery]%")
			if(src.clan=="Inuzuka")
				stat("Beast Mastery","[src.beastmastery]%")
			if(src.clan=="Akimichi")
				stat("Size Mastery","[src.sizemastery]%")
			if(src.clan=="Spider")
				stat("Web Mastery","[src.webmastery]%")
				stat("Spider Gold Mastery","[src.spidergoldmastery]%")
			if(src.clan=="Yamanaka")
				stat("Mind Mastery","[src.mindmastery]%")
				stat("Mind Time","[src.mindtime]")
				stat("Mind Range","[src.mindrange]")
			if(src.clan=="Kaguya")
				stat("Bone Mastery","[src.bonemastery]%")
				stat("Dance Mastery","[src.dancemastery]%")
			if(src.medicalmastery>0)
				stat("Medical Mastery","[src.medicalmastery]")
			if(src.attackdelay<4)
				stat("Speed","[round(25*(4-src.attackdelay))]")
			if(src.bonuspoints)
				stat("Bonus Points:","[src.bonuspoints]")
			if(src.katonknowledge>0)
				stat("Katon Knowledge","[round(src.katonknowledge)]")
			if(src.suitonknowledge>0)
				stat("Suiton Knowledge","[round(src.suitonknowledge)]")
			if(src.fuutonknowledge>0)
				stat("Fuuton Knowledge","[round(src.fuutonknowledge)]")
			if(src.raitonknowledge>0)
				stat("Raiton Knowledge","[round(src.raitonknowledge)]")
			if(src.dotonknowledge>0)
				stat("Doton Knowledge","[round(src.dotonknowledge)]")
			if(src.mokutonknowledge||src.jintonknowledge||src.lavaknowledge||src.boilknowledge)//||src. etc
				if(src.mokutonknowledge>0)
					stat("Mokuton Knowledge","[round(src.mokutonknowledge)]")// gain when you use wood techs, only purpose: to learn jutsus of the kind
				if(src.jintonknowledge>0)
					stat("Jinton Knowledge","[round(src.jintonknowledge)]")//---------Use that for all element mixes ^^^^
				if(src.lavaknowledge>0)
					stat("Lava Style Knowledge","[round(src.lavaknowledge)]")
				if(src.boilknowledge>0)
					stat("Boil Style Knowledge","[round(src.boilknowledge)]")
			stat("--------------")
			stat("Taijutsu Knowledge:","[src.taiknowledge]")
			stat("Ninjutsu Knowledge","[src.ninknowledge]")
			stat("Genjutsu Knowledge","[src.genknowledge]")
			stat("----------------")//make sure this is last line
			stat("Handseal Speed:","[round(100/src.sealspeed)]")
			stat("Chakra Control:","[round(src.CC)]%")
			stat("Water Walk Mastery:","[round(src.WaterWalkingMastery)*10]%")


		//Stat()
		if(statpanel("Inventory")) // skip the loop unless looking at "Inventory"
			for(var/atom/A in contents)
				if(istype(A,/obj/skill))

				else //if(A.invisibility <= src.see_invisible)
					stat(A)
		/*if(statpanel("Jutsus")) // skip the loop unless looking at "Inventory"
			for(var/obj/skill/A in contents)
				stat(A)*/
		/*statpanel("Inventory")
		//stat("",contents)
		if(statpanel("Passives"))
			if(src.dnainfo)
				if(usr.snakestudy>1)
					stat("Snake DNA:","[src.snakestudy]%...Amount: [src.snakeamm]")
				if(usr.twinstudy>1)
					stat("Twin DNA:","[src.twinstudy]%...Amount: [src.twinamm]")
				if(usr.spiderstudy>1)
					stat("Spider DNA:","[src.spiderstudy]%...Amount: [src.spideramm]")
				if(usr.tayuyastudy>1)
					stat("Tayuya DNA:","[src.tayuyastudy]%...Amount: [src.tayuyaamm]")
				if(usr.senjustudy>1)
					stat("Senju DNA:","[src.senjustudy]%...Amount: [src.senjuamm]")
				if(usr.bonestudy>1)
					stat("Kaguya DNA:","[src.bonestudy]%...Amount: [src.boneamm]")
				if(usr.jirobostudy>1)
					stat("Earth Ability:","[src.jirobostudy]%...Amount: [src.jiroboamm]")
				if(usr.waterbodystudy>1)
					stat("Body Experiment:","[src.waterbodystudy]%...Amount: [src.waterbodyamm]")
				if(usr.eyetransstudy>1)
					stat("Transplant Skill:","[src.eyetransstudy]%")
			if(src.marktraining)
				stat("Mark Completion:","[round((usr.markchakra/30000)*100)]%")
			stat("Rush:","[src.rush]/25")
			stat("------------------Elements---------------------")
			if(src.element=="Katon"||src.haskaton)
				stat("Katon Knowledge:","[src.fknowledge]")
			if(src.element=="Suiton"||src.hassuiton)
				stat("Suiton Knowledge:","[src.wknowledge]")
			if(src.element=="Raiton"||src.hasraiton)
				stat("Raiton Knowledge:","[src.rknowledge]")
			if(src.element=="Doton"||src.hasdoton)
				stat("Doton Knowledge:","[src.dknowledge]")
			if(src.element=="Fuuton"||src.hasfuuton)
				stat("Fuuton Knowledge:","[src.fknowledge]")
			stat("HandSeal Delay:","[src.sealspeed]")
			stat("HandSeal Accuracy:","[src.sealac]")
			stat("-----------------------------------------------")*/
		..()



mob
	var
		strpcnt
		spdpcnt
		endpcnt

		energypcnt
		powpcnt
		powpcnt2

		offpcnt
		defpcnt
	proc
		Greatest_Stat()
			//Energy
			var/etotal=(src.Mchakra) //100%
			src.energypcnt=((src.Mchakra/etotal)*100)
			var/atotal=(src.Mchakra+src.nin+src.tai+src.gen)
			src.powpcnt2=((src.nin/atotal)*100)

			//Physical
			var/ptotal=(src.tai+src.nin+src.gen)
			src.strpcnt=((src.tai/ptotal)*100)//added the +addstr
			src.defpcnt=((src.gen/ptotal)*100)// added the +adddef
			src.powpcnt=((src.nin/ptotal)*100)//added the +addpow      They can be taken out at any time and it wont matter
			spawn(1)
				src.Greatest_Stat()



mob
	var
		hregen=0
		cregen=0
		oldcregen=0
		ageacc=0
		Sregen=0//super human regeneration
		levelcapped=0
		level=0
		exp=0
		Mexp=10
		statp=0
		tmp/infight=0



mob
	proc
		level()
			if(src.exp>src.Mexp*10)
				src.exp=src.Mexp*10
			if(src.exp>=src.Mexp&&src.level<300)
				if(src.opening<6&&src.level>9&&src.client)
					src<<"Finish the tutorial if you wish to continue leveling. Don't forget to use the skill points you've aquired by going to commands>Use Points."
					return
				if(src.level==0)
					src<<"<font color = red><b>You gained your first level. At each level you gain 4 skill points which you can use by going to use points in the commands tab."
				if(src.level==150)
					src.AwardMedal("I'm Halfway there")
				if(src.level==16)
					src<<"<font color = red><b>You can now join events."
				if(src.level<=300)
					src.Mtai+=3//+src.Stai
					src.Mnin+=3//+src.Snin
					src.Mgen+=3//+src.Sgen
				if(src.level<=250)
					src.Mhealth+=40
					src.Mchakra+=rand(9,33)
					if(src.clan=="Uzumaki")
						src.Mchakra+=rand(2,6)
					if(src.clan=="Senju")
						src.Mchakra+=rand(4,8)
					if(src.clan=="Hoshigaki")
						src.Mchakra+=rand(4,7)
					if(src.clan=="Uchiha")
						src.Mchakra-=rand(2,6)
					if(src.clan=="None")
						src.Mchakra+=rand(1,3)
					if(src.clan=="Sand")
						src.Mchakra+=rand(1,2)
					if(src.clan=="Hyuuga")
						src.Mchakra-=rand(2,4)
				if(src.level>=20&&src.rank=="Civilian"||src.level>=20&&src.rank=="Academy Student")
					src.rank="Genin"
					src<<"<fon't color = red><b>You were automatically promoted to genin for achiving such a high level."
					src.AwardMedal("Top Notch Genin")
				if(src.tai<src.Mtai)
					src.tai=src.Mtai
				if(src.nin<src.Mnin)
					src.nin=src.Mnin
				if(src.gen<src.Mgen)
					src.gen=src.Mgen
				src.statp+=4
				//src<<"You gained 3 stat points."
				src.exp-=src.Mexp
				if(src.exp>src.Mexp*10)
					src.exp=src.Mexp*10
				if(src.basic)
					src.Mexp+=20*src.basic
				else
					src.Mexp+=20
				/*if(src.clan=="")
				if(src.clan=="")
					if(src.village=="")*/
				src.level+=1
				if(src.exp>=src.Mexp&&src.level<300)
					src<<"<font color = red><b>You are now level: <font color = yellow>[src.level]."
					src.level()
					sleep(1)
				else
					src<<"<font color = red><b>You are now level: <font color = yellow>[src.level]."
			if(src.level>=300)
				src.levelcapped=1
				src<<"You level has capped so you now no longer gain level, from here on its all about skill, good luck."
				src<<"(No that doesn;t mean you cant learn jutsu or anything like that it just means your damage wont increase by level anymore and you'll have to train to get higher damage.)"
				src.AwardMedal("I hit the level cap")





mob
	proc
		nregen()
			set background = 1///////////====-----------this was added to the code to reduce lag, may cause problems. keep an eye on it
			if(!src.ko)
				if(src.health<=src.Mhealth)
					if(src.health<src.Mhealth&&src.stomachamm>=(src.stomachMamm*0.90))
						src.health+=src.Mhealth*0.002
					else
						src.health+=src.Mhealth*0.001
			src.hregen=src.Mhealth*0.005
			src.cregen=src.Mchakra*0.005
			if(src.health>src.Mhealth)
				src.health=src.Mhealth
			if(src.stomachamm<14&&src.health>=src.Mhealth*0.15)
				src.health-=src.Mhealth*0.03
			if(src.health<=src.Mhealth*0.05)
				if(prob(75))
					spawn(1)
						//src<< sound('Heartbeat.wav',0,0,1)
						src<<sound('Heartbeat.wav',0,0,volume=17)
			if(src.stomachamm<30)
				if(prob(0.01))
					view()<<"[src]'s stomach growls."
			if(src.chakra<0)
				if(src.ko==0)
					src.alldamage(src.chakra*rand(-1.1,-1.5),src)
					src<<"You overstress your chakra!"
				src.chakra=0
				//src<<"You overstress your chakra!"
				//spawn(1)
					//src.Death(src)
			if(src.health<=0&&src.ko==0&&src.infight==0)
				spawn(1)
					src.Death(src)
			if(src.infight<=10&&src.exp>=src.Mexp)
				if(prob(10))
					spawn(10)
						src.level()
			//src.level()
			if(src.chakrapoolmax!=src.Mchakra*src.poolmulti)
				src.chakrapoolmax=src.Mchakra*src.poolmulti
			//if(src.chakrapool<src.chakrapoolmax)
				//src.chakrapool=src.chakrapoolmax/////////////////////////////////ONLY DURING TESTING
			if(src.infight>0)
				src.infight-=1
			if(src.poison>=1&&src.ko==0)
				src.health-=src.poisontype
				src.poison-=1
			src.HudRefresh()
			src.stomachset()
			if(src.HealGateTime>0&&usr.gates<=0)
				src.HealGateTime-=0.1
			if(src.HealGateTime>30)
				src.HealGateTime=30
			if(src.prongseal>0)
				src.prongseal-=1
			if(src.clan=="Senju"&&src.mokutonknowledge<1)
				if(prob(0.03))
					src.mokutonknowledge=1
					src<<"You gained control over wood style!"
			/*src.agetimer-=1
			if(src.agetimer<=0)
				src.age+=1
				src.agetimer=8356//was about 15364
				if(src.ageacc)
					src.agetimer=4178
				src<<"You are now [src.age] years old."
				if(src.age>=100)
					src.Mhealth-=rand(150,250)
					if(src.Mhealth<=9)
						src.Mhealth=10
					src.Mtai-=src.Mtai*0.07
					src.Mnin-=src.Mnin*0.07
					src.Mgen-=src.Mgen*0.07
					src<<"Your old age is getting to you and your getting more and more frail by the year."
					src.SaveK()
					if(prob(15))//was 7
						world<<"[src] Has died of old age."
						src<<"Your character has gotten too old and has died of old age. This means your character has been deleted and you must start a new one. Thanks for playing but this is here so people can't get too strong. Yes, there are ways to avoid getting this old but they are secret."
						src.PwipeS2()
						src<<"You will now be reincarnated."
						src.reincarnated+=1
						sleep(50)
						src.reincarnate()
						//del(src)
			if(src.halfrevivecd)
				src.halfrevivecd-=1
			if(src.marktraining)
				if(src.Mchakra>300)
					src.markchakra+=10
					src.Mchakra-=10
					if(src.markchakra>30000)
						src.marktraining=0
						src.Mchakra+=30000
						src.Mchakra=src.Mchakra*3
						src<<"You mastered the secret mark and are now able to use it."
						oview(src)<<"A mark apears on [src]'s forehead."
						src.verbs+= /mob/medic/verb/SecretMarkSeal
			if(src.immortal>0)
				src.immortal-=1
				if(src.immortal<0)
					src.immortal=0
				if(src.immortal==0)
					src<<"Your immortality has worn off."*/
			if(src.reanimated>=1)
				if(src.chakrapool<src.chakrapoolmax)
					src.chakrapool=src.chakrapoolmax
			if(bya)
				for(var/mob/x in orange(10))
					//var/chakra_level = x.chakra / x.Mchakra
					var/chakra_state
					if(istype(x, /mob/npc))
						var/image/J = image('chakralayer.dmi',x,"clone",MOB_LAYER+9,x.dir)
						src << J
						spawn(15*1)
							if(client)
								client.images -= J
					else if(x.demon!=""&&x.ingenjutsu==0)
						chakra_state = "demon"
					else if(x.ingenjutsu)
						chakra_state = "ingenjutsu"
					else
						chakra_state = "normal"
					var/image/I = image('chakralayer.dmi',x,chakra_state,MOB_LAYER+10,x.dir)
					src << I
					spawn(15*1)
						if(client)
							client.images -= I
			if(shari||mshar)
				for(var/mob/x in orange(10))
					var/chakra_state
					if(src.sharM>25)
						if(istype(x, /mob/npc))
							var/image/J = image('chakralayer.dmi',x,"clone",MOB_LAYER+9,x.dir)
							src << J
							spawn(15*1)
								if(client)
									client.images -= J
						else if(x.demon!=""&&x.ingenjutsu==0)
							chakra_state = "demon"
						else if(x.ingenjutsu)
							chakra_state = "ingenjutsu"
						else
							chakra_state = "normal"
						var/image/I = image('chakralayer.dmi',x,chakra_state,MOB_LAYER+10,x.dir)
						src << I
						spawn(15*1)
							if(client)
								client.images -= I
			if(src.immortality>=1)
				src.immortality-=1
				if(src.immortality<1)
					src.immortality=0
					src<<"Your immortality has worn off."
			if(src.koimmune>0)
				src.koimmune-=1
				if(src.koimmune<=0)
					src.koimmune=0
			if(src.blindness>=0.25&&src.shari==0&&src.mshar==0)
				src.blindness-=0.25
				if(prob(40))
					src.blinding()
			if(src.blindness>400)
				src.blindness=400
			/*if(itachitsuku)
				for(var/turf/x in orange(15))
					spawn(1)
						var/chakra_level = x.density
						var/chakra_state
						if(chakra_level >= 1)
							chakra_state = "tsukuwall"
						if(chakra_level == 0)
							chakra_state = pick("tsukufloor","tsukuother")
						//else if(x.opacity>=1)
							//chakra_state = "tsukuother"
						var/image/I = image('Effects.dmi',x,chakra_state,TURF_LAYER+0.01,x.dir)
						src << I
						spawn(20*1)
							if(client)
								client.images -= I
			if(src.bitedelay)
				src.bitedelay-=1
			if(src.curselevel<4&&src.curseseal==0)
				spawn(1)
					if(src.curselevel==1)
						if(prob(3))src.cursenow()
						//if(intense&&prob(25))cursenow()
						if(src.health<=src.Mhealth/10)src.cursenow()
					if(src.curselevel==2)
						//if(intense&prob(20))cursenow()
						if(src.health<=src.Mhealth/10)if(prob(50))src.cursenow()
					if(curselevel==3)
						if(src.health<src.Mhealth/10)if(prob(20))src.cursenow()
			if(src.borncs&&src.health<src.Mhealth*0.25&&!src.cursedelay)
				spawn(1)
					src.juugocurse()
			if(src.target!=null)
				if(get_dist(src.target,src) >= 10) // if the source is the user, return. // you can also change 10 if you wish
					for(var/image/x in src.client.images) // first, check to see if your have a target.
						if(x.icon=='target.dmi') /// if so.
							del(x)
							src<<"Your target has run out of your sight and you have lost them, you now have no target."
			if(src.mute)
				src.mute-=1*/
			sleep(5)
			spawn(10)
				src.nregen()




mob
	proc
		stomachset()
			if(src.stomachamm<src.stomachMamm*0.25&&src.stomachamm>15)
				src.stomach="Hungry"
			if(src.stomachamm<15)
				src.stomach="Starving"
			if(src.stomachamm<=src.stomachMamm*0.50&&src.stomachamm>src.stomachMamm*0.25)
				src.stomach="Satisfied"
			if(src.stomachamm<=src.stomachMamm&&src.stomachamm>src.stomachMamm*0.50)
				src.stomach="Nearly Full"
			if(src.stomachamm>=src.stomachMamm*0.90)
				src.stomach="Full"
			if(src.stomachamm>=src.stomachMamm)
				src.stomach="Bloated"
			if(src.ko==0)
				src.stomachamm-=0.015
				if(src.stomachamm<0)
					src.stomachamm=0
				if(src.clan=="Akimichi")
					src.stomachamm-=src.stomachMamm*0.0035
					if(src.stomachMamm<3000)
						src.stomachMamm+=0.02