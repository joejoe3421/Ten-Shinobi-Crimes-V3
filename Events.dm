var
	tmp/event=""
	tmp/eventplace=""
	tmp/eventplayers=0
	tmp/eventplayerlist=list()
	tmp/starting=0//meaning its in the join stage, make it 0 when it starts
	tmp/lastplace=""
	tmp/lastevent=""
	tmp/expmult=1

//---------------------------------------------------
//before the start of every event make sure to set everyone's src.canjoin to 1
//--------------------------




mob
	var
		tmp
			inevent=0
			canjoin=1
			bossevent=0
		eventreturn=0
	verb
		joinevent()
			set name = ".Join Event"
			set category = "Commands"
			//set hidden = 1// just add a . in front of name to hide it
			if(usr.ko||usr.Frozen||usr.bind)
				usr<<"You can'ty join in your current state, try again after the effects wear off."
				return
			if(usr.level<=15)
				usr<<"You need to be a higher level to join events."
				return
			if(event=="")
				usr<<"Theres no event going on right now, sorry."
				return
			if(usr.canjoin&&starting==1)
				if(usr.inevent==0)
					usr.inevent=1
					usr.canjoin=0
					usr.eventreturn=usr.loc
					eventplayers+=1
					eventplayerlist+=usr
					usr<<"You joined the [event] event. Please wait a bit for it to start."
					usr.AwardMedal("My First Event")
				else
					usr<<"Your already in the event."
					return
			else
				usr<<"You already are in the event, it has already started or there is not one going on."
				return
		leaveevent()
			set name = ".Leave Event"
			set category = "Commands"
			//set hidden = 1
			if(usr.inevent>0)
				usr.loc=usr.eventreturn
				eventplayers-=1
				eventplayerlist-=usr
				usr.inevent=0
				usr.canjoin=0
				usr<<"You Left the [event] event."
			else
				usr<<"Your not in a event."
				return







proc
	event()
		//world<<"A [event] is now taking participants and will be held on the [eventplace] map."
		chooseevent()
		if(event=="Exp")
			world<<"<font size=2><font color=yellow><B>World News: A [event] event is about to take place."
			sleep(100)
		else
			world<<"<font size=2><font color=yellow><B>World News: A [event] event is now taking place. You have 2 minutes to join. (Go to your events drop down menus in the upper left and press join to enter.)"
			sleep(1200)
		starting=0
		if(eventplayers>=3)//was 4
			world<<"The [event] has started."
			for(var/mob/Z in world)
				if(Z.inevent)
					Z.eventstart()
			if(event=="Mystery")
				event=pick("Boss Fight","Exp","Juggernaut","Free For All")
			if(event=="Free For All")
				FFA()
			if(event=="Boss Fight")
				BossFight()
			if(event=="Juggernaut")
				Juggernaut()
			if(event=="Exp")
				Expchange()
		else
			if(event=="Exp")
				Expchange()
			else
				world<<"<font size=2><font color=yellow><B>World News: The [event] event has been canceled due to a lack of players."
				starting=0
				for(var/mob/Z in world)
					if(Z.inevent)
						//Z.loc=usr.eventreturn
						eventplayers-=1
						eventplayerlist-=Z
						Z.inevent=0
						Z.canjoin=1
						//usr<<"You Left the [event] event."
		spawn(9000)//15 minutes
			if(eventplayers>0)
				world<<"<font size=2><font color=red><B>World News: The [event] is now over and it's participants have failed."
				spawn(1)
					for(var/mob/boss/U in world)
						del U
				for(var/mob/M in world)
					if(M.inevent)
						M.loc=M.eventreturn
						eventplayers-=1
						eventplayerlist-=M
						M.bossevent=0
						M<<"<font size=1><font color=red> You have taken too long to finish the event."
		sleep(rand(12000,20000))
		event()
	chooseevent()
		newevent
		event=pick("Boss Fight","Exp","Free For All","Juggernaut","Mystery")
		if(event==lastevent)
			goto newevent
		lastevent=event
		repick
		eventplace=pick("Desert","GrassLand","Misty","Village","")
		if(eventplace==lastplace)
			goto repick
		lastplace=eventplace
		if(event=="Exp")

		else
			starting=1
	FFA()
		var/rewardmult=eventplayers/2
		for(var/mob/M in world)
			spawn(1)
				if(M.inevent)
					M<<"<font size=2><font color=yellow><B>World News: The Free for all has started, its your goal to kill everyone else, do what ever is nessasry to win."
					sleep(50)
					M<<"<font size=2><font color=yellow><B>World News: Begin!!"
					M.Frozen=0
		spawn(100)
			while(eventplayers>1)
				sleep(100)
			for(var/mob/T in world)
				if(T.inevent)
					world<<"[T] has won the Free for all!"
					spawn(1)
						T.eventreward(rewardmult)

			for(var/mob/H in world)
				if(H.inevent)
					H.loc=H.eventreturn
					eventplayers-=1
					eventplayerlist-=H
					H.inevent=0
					H.canjoin=1
	Juggernaut()
		//var/rewardmult=eventplayers/2
		var/bossplayer=pick(eventplayerlist)
		var/mob/O = bossplayer
		for(var/mob/M in world)
			spawn(1)
				if(M.inevent)
					M<<"<font size=2><font color=yellow><B>Event News: The Juggernaut event has began, you must kill the juggernaught unless you are him then you must kill everyone else to win."
					sleep(50)
					M<<"<font size=2><font color=yellow><B>Event News: Begin!!"
					M.Frozen=0
					if(M!=O)
						M<<"<font size=1><font color=red><B>[O] is the Juggernaut, you and all the others must kill him/her to win."
		O.bossevent=1
		O<<"<font size=2><font color=red><B>You are the Juggernaut, you are insanely strong and can really take a hit. Kill all the other players to win."
		var/matrix/MM = matrix()
		MM.Scale(3)
		O.transform = MM
		sleep(6000)
	Expchange()
		var/oldmult=expmult
		var/newmult=oldmult+rand(1,4)
		expmult=newmult
		world<<"<font size=2><font color=yellow><B>World News: A EXP event has started, the world exp mutiplier is now [expmult]."
		spawn(rand(3000,7500)/(newmult*0.50))
			world<<"<font size=2><font color=yellow><B>World News: The EXP event has now ended."
			expmult=oldmult
	BossFight()
		for(var/mob/M in world)
			spawn(1)
				if(M.inevent)
					M<<"<font size=2><font color=yellow><B>Event News:A boss will soon appear be ready they appear in a random location."
					sleep(50)
					M<<"Good Luck."
					M.Frozen=0
		sleep(60)
		var/WB=pick("Madara","Kabuto","Orochimaru","Sasori","Sound Five","Zetsu")
		if(WB=="Madara")
			var/mob/boss/Madara/A=new()
			A.eventstart()
			A.icon_state=""
		if(WB=="Kabuto")
			var/mob/boss/Kabuto/A=new()
			A.eventstart()
			A.icon_state=""
		if(WB=="Orochimaru")
			var/mob/boss/Orochimaru/A=new()
			A.eventstart()
			A.icon_state=""
		if(WB=="Sasori")
			var/mob/boss/Sasori/A=new()
			A.eventstart()
			A.icon_state=""
		if(WB=="Zetsu")
			var/number=rand(7,15)
			while(number)
				var/mob/boss/Zetsu/A=new()
				A.eventstart()
				A.icon_state=""
				number-=1
				sleep(5)
		if(WB=="Sound Five")
			var/mob/boss/SoundFive/Kimmimaru/A=new()
			A.eventstart()
			A.icon_state=""
			var/mob/boss/SoundFive/Jirobo/B=new()
			B.eventstart()
			B.icon_state=""
			var/mob/boss/SoundFive/Sakon/C=new()
			C.eventstart()
			C.icon_state=""
			var/mob/boss/SoundFive/Kidomaru/D=new()
			D.eventstart()
			D.icon_state=""
			var/mob/boss/SoundFive/Tayuya/E=new()
			E.eventstart()
			E.icon_state=""

mob
	proc
		eventreward(mult)
			if(mult<=0)
				mult=1
			if(mult>=10)
				mult=10
			if(src.levelcapped==0)
				var/reward=(src.Mexp*rand(1,1.5))*mult
				src<<"You are rewarded [reward] exp"
				src.exp+=reward*mult
				spawn(1)
					src.DamageShow(round(reward*mult))
			else
				switch(input(src,"What reward would you like?")in list ("Money","Bonus Point"))
					if("Money")
						src<<"You gained [5000*mult] dollars."
						src.yen+=(5000*mult)
					if("Bouns Point")
						src<<"You gained 10 bonus points."
						src.bonuspoints+=10






mob
	proc
		eventstart()
			set background=1
			if(eventplace=="Desert")
				var/list/H=list()
				for(var/turf/event1/T in world)
					H.Add(T)
				src.loc=pick(H)
			if(eventplace=="GrassLand")
				var/list/H=list()
				for(var/turf/event2/T in world)
					H.Add(T)
				src.loc=pick(H)
			if(eventplace=="Misty")
				var/list/H=list()
				for(var/turf/event3/T in world)
					H.Add(T)
				src.loc=pick(H)
			if(eventplace=="Village")
				var/list/H=list()
				for(var/turf/event4/T in world)
					H.Add(T)
				src.loc=pick(H)
			if(eventplace=="")
				var/list/H=list()
				for(var/turf/event5/T in world)
					H.Add(T)
				src.loc=pick(H)
			src.health=src.Mhealth
			src.chakra=src.Mchakra
			src.chakrapool=src.chakrapoolmax
			src.koamm=0
			if(src.client)
				src.Frozen=1






turf
	event1
		density=0

	event2
		density=0

	event3
		density=0

	event4
		density=0

	event5
		density=0














mob
	boss
		//human = 1
		density=1
		//NPC = 1
		icon='Guy.dmi'
		health = 100
		Mhealth=1000
		level=1
		run=1
		layer=MOB_LAYER
		New()
			..()
			spawn(30)
				src.eventAI()
				src.koamm=0
				src.overlays-='Boxers.dmi'
				src.overlays+='Boxers.dmi'
				src.overlays-='MaleEyes.dmi'
				src.overlays+='MaleEyes.dmi'
				src.overlays-='Eyes.dmi'
				src.overlays+='Eyes.dmi'
				src.overlays+='Cloths.dmi'
				src.overlays+='pants.dmi'
		Madara
			New()
				..()
				spawn(2)
					var/list/L = src.jutsus
					L.Add("clone")
					L.Add("kawarimi")
					L.Add("missle")
					L.Add("missles")
					L.Add("push")
					L.Add("pull")
					L.Add("summon")
					L.Add("absorb")
					L.Add("fireball")
					L.Add("judgement")
					var/Base='Guy.dmi'
					Base+=rgb(201,145,100)
					src.icon=Base
					src.overlays-='Boxers.dmi'
					src.overlays+='Boxers.dmi'
					src.overlays-='MaleEyes.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays-='Eyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+='pants.dmi'
					src.overlays+='Shirt.dmi'
					src.overlays+='Uchiha Crest.dmi'
					src.overlays+='MadaraH.dmi'
					src.cantalk=1
					src.trashtalk=list("Are you afraid?","Whats the matter? You given up already!?","You're nothing compared to Hashirama!","Theres a lot of trash here today.","What a nice warm up.","You worm!","...")
					src.name="Madara"
					src.clan="Uchiha"
					src.name="[src.name] [src.clan]"
					src.movedelay-=0.60//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
					src.combolimit=3
					src.willpower=2
					src.level=500//was 1,125
					src.Mhealth=rand(100,250)*(src.level)
					src.expgive=rand(500,800)*src.level
					src.Mtai=rand(2,5)*src.level
					src.Mnin=rand(5,10)*(src.level*3)
					src.Mgen=rand(1,2)*(src.level*2)
					src.tai=src.Mtai
					src.nin=src.Mnin
					src.gen=src.Mgen
					src.health=src.Mhealth

		Kabuto//sage mode capable
			New()
				..()
				spawn(2)
					var/Base='Guy.dmi'
					Base+=rgb(155,155,155)
					src.icon=Base
					src.overlays-='Boxers.dmi'
					src.overlays+='Boxers.dmi'
					src.overlays-='MaleEyes.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays-='Eyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+='pants.dmi'
					var/hair='CaptainTousenH.dmi'
					hair+=rgb(171,171,171)
					src.overlays+=hair
					//src.overlays+='CaptainTousenH.dmi'
					src.overlays+='BlackRain.dmi'
					var/list/L = src.jutsus
					L.Add("clone")
					L.Add("kawarimi")
					L.Add("snake sage mode")
					L.Add("healing wound destruction")
					src.name="Kabuto"
					src.clan="Yakushi"
					src.cantalk=1
					src.trashtalk=list("Done already?","Maybe Do a few experiments on you myself...","This the result of perfection!","You'll never win...","Just give up.","Itachi did better than this.","Your Butt at this.","Pethetic","....")
					src.name="[src.name] [src.clan]"
					src.movedelay-=0.20//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
					src.combolimit=2
					src.willpower=1.3
					src.level=275//was 1,125
					src.Mhealth=rand(100,250)*(src.level)
					src.expgive=rand(50,80)*(src.level*10)
					src.Mtai=rand(2,4)*src.level
					src.Mnin=rand(4.2,6.3)*(src.level*1.3)
					src.Mgen=rand(5,7)*src.level
					src.tai=src.Mtai
					src.nin=src.Mnin
					src.gen=src.Mgen
					src.health=src.Mhealth

		Orochimaru
			New()
				..()
				spawn(2)
					var/list/L = src.jutsus
					L.Add("clone")
					L.Add("kawarimi")
					L.Add("striking shadow snake")
					L.Add("striking shadow snakes")
					src.name="Orochimaru"
					src.clan=""
					src.name="[src.name]"
					src.cantalk=1
					src.trashtalk=list("...","Interesting...","Entertain me.","Maybe I'll bestow my cursemark upon you.","Useless")
					src.movedelay-=0.40//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
					src.combolimit=2
					src.willpower=1.5
					src.level=350//was 1,125
					src.Mhealth=rand(375,525)*(src.level)
					src.expgive=rand(500,800)*src.level
					src.Mtai=rand(2.3,2.7)*src.level
					src.Mnin=rand(4,6)*src.level
					src.Mgen=rand(1,1.2)*src.level
					src.tai=src.Mtai
					src.nin=src.Mnin
					src.gen=src.Mgen
					src.health=src.Mhealth

		Sasori
			New()
				..()
				spawn(2)
					var/list/L = src.jutsus
					L.Add("clone")
					L.Add("kawarimi")
					L.Add("puppet summon")
					L.Add("hundred puppets")
					src.name="Sasori"
					src.clan=""
					src.name="[src.name]"
					src.cantalk=1
					src.trashtalk=list("...","I don't even want to add you to my collection.","You'll be my next puppet.","Give up now and I might spare you","You pesking rat.","Go away.")
					src.movedelay+=0.20//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
					src.combolimit=2
					src.willpower=0.7
					src.level=290//was 1,125
					src.Mhealth=rand(200,350)*(src.level)
					src.expgive=rand(50,80)*src.level
					src.Mtai=rand(1.5,3)*src.level
					src.Mnin=rand(1.2,2.6)*src.level
					src.Mgen=rand(1,1.1)*src.level
					src.tai=src.Mtai
					src.nin=src.Mnin
					src.gen=src.Mgen
					src.health=src.Mhealth

		SoundFive
			New()
				..()
				spawn(5)
					var/list/O = src.jutsus
					O.Add("curse mark")
			//add curse mark here
			Kimmimaru
				New()
					..()
					spawn(2)
						var/list/L = src.jutsus
						L.Add("clone")
						L.Add("kawarimi")
						L.Add("bone bullets")
						src.name="Kimmimaru"
						src.clan="Kaguya"
						src.name="[src.name] [src.clan]"
						src.movedelay-=0.60//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
						src.combolimit=3
						src.level=185//was 1,125
						src.Mhealth=rand(100,250)*(src.level)
						src.expgive=rand(50,80)*src.level
						src.Mtai=rand(2.3,4)*src.level
						src.Mnin=rand(1.2,1.6)*src.level
						src.Mgen=rand(1,1.1)*src.level
						src.tai=src.Mtai
						src.nin=src.Mnin
						src.gen=src.Mgen
						src.health=src.Mhealth

			Sakon
				New()
					..()
					spawn(2)
						var/list/L = src.jutsus
						L.Add("clone")
						L.Add("kawarimi")
						L.Add("bullet punch")
						src.name="Sakon"
						src.clan=""
						src.name="[src.name]"
						src.movedelay-=0.10//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
						src.combolimit=2
						src.level=150//was 1,125
						src.Mhealth=rand(100,250)*(src.level)
						src.expgive=rand(50,80)*src.level
						src.Mtai=rand(1.6,2.3)*src.level
						src.Mnin=rand(1,1.5)*src.level
						src.Mgen=rand(1,1.7)*src.level
						src.tai=src.Mtai
						src.nin=src.Mnin
						src.gen=src.Mgen
						src.health=src.Mhealth

			Jirobo
				New()
					..()
					spawn(2)
						var/list/L = src.jutsus
						L.Add("clone")
						L.Add("kawarimi")
						L.Add("rock throw")
						src.name="Jirobo"
						src.clan=""
						src.name="[src.name]"
						//src.movedelay-=0//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
						src.combolimit=3
						src.level=140//was 1,125
						src.Mhealth=rand(100,250)*(src.level)
						src.expgive=rand(50,80)*src.level
						src.Mtai=rand(2,2.5)*src.level
						src.Mnin=rand(1.5,2.5)*src.level
						src.Mgen=rand(1,1.6)*src.level
						src.tai=src.Mtai
						src.nin=src.Mnin
						src.gen=src.Mgen
						src.health=src.Mhealth

			Kidomaru
				New()
					..()
					spawn(2)
						var/list/L = src.jutsus
						L.Add("clone")
						L.Add("kawarimi")
						L.Add("spider web")
						L.Add("golden kunai")
						src.name="Kidomaru"
						src.clan=""
						src.name="[src.name]"
						src.movedelay-=0.05//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
						src.combolimit=2
						src.level=155//was 1,125
						src.Mhealth=rand(100,250)*(src.level)
						src.expgive=rand(50,80)*src.level
						src.Mtai=rand(2.6,4.6)*src.level
						src.Mnin=rand(1.9,2.4)*src.level
						src.Mgen=rand(1,1.4)*src.level
						src.tai=src.Mtai
						src.nin=src.Mnin
						src.gen=src.Mgen
						src.health=src.Mhealth

			Tayuya
				New()
					..()
					spawn(2)
						var/list/L = src.jutsus
						L.Add("clone")
						L.Add("kawarimi")
						L.Add("chakra demon")
						L.Add("illusion tune chains")
						src.name="Tayuya"
						src.clan=""
						src.name="[src.name]"
						src.movedelay+=0.20//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
						src.combolimit=2
						src.level=100//was 1,125
						src.Mhealth=rand(100,250)*(src.level)
						src.expgive=rand(50,80)*src.level
						src.Mtai=rand(1,1.1)*src.level
						src.Mnin=rand(1,1.2)*src.level
						src.Mgen=rand(6,12)*src.level
						src.tai=src.Mtai
						src.nin=src.Mnin
						src.gen=src.Mgen
						src.health=src.Mhealth
		SixPaths//along with konan
			Naraka

			Preta

			Human

			Deva

			Animal

			Asura

		Mist
			Haku

			Zabuza

		Hebi
			Sasuke//only ms and amat

			Juugo//half cs at most

			Suigetsu

			Karin//mostly  poisonus jutsu and heals self

		Zetsu//white zetsu
			New()
				..()
				var/Base='Guy.dmi'
				Base+=rgb(171,171,171)
				src.icon=Base
				var/list/L = src.jutsus
				L.Add("clone")
				L.Add("kawarimi")
				L.Add("spore")
				src.cantalk=1
				src.trashtalk=list("...","Idependence Unbending","The only one you can count on is yourself.","HAAAYYYOOOOO","Jozetsu here!","WOOO This is fun!","Want to see what I can do?","Dokuzetsu where have you gone?")
				//L.Add("healing wound destruction")
				src.name="White Zetsu"
				src.clan=""
				src.name="[src.name]"
				src.movedelay+=rand(0.50,0.80)//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
				src.combolimit=rand(1,3)
				src.level=rand(80,95)//was 1,125
				src.Mhealth=rand(100,250)*(src.level)
				src.expgive=rand(20,50)*src.level
				src.Mtai=rand(1,4)*src.level
				src.Mnin=rand(1,4)*src.level
				src.Mgen=rand(1,4)*src.level
				src.tai=src.Mtai
				src.nin=src.Mnin
				src.gen=src.Mgen
				src.health=src.Mhealth




mob
	var
		trashtalk=list()
		cantalk=0


mob
	proc
		eventAI()
			//if(src.indemon&&src.BLC)
				//src.overlays-='1.dmi'
			while(src)
				if(prob(1))
					if(src.cantalk)
						src.Say("[pick(src.trashtalk)]")
				if(src.ko==2)
					while(src&&src.ko==2)
						src.CENTER()
						sleep(src.movedelay*2)
				src.random=rand(1,10)
				if(src.random==2||src.random==3)
					for(var/mob/M in oview(10))
						if(M.client)
							src.target=M
							step_towards(src,M)
							step_towards(src,M)
							step_towards(src,M)
							step_towards(src,M)
							step_towards(src,M)
							step_towards(src,M)
							if(prob(85))
								src.Attack()
							else
								src.usejutsu()
							step_rand(src,0)
							step_rand(src,0)
				if(src.random==5||src.random==6)
					if(prob(70))
						src.Attack()
					else
						src.usejutsu()
					step_rand(src,0)
					step_rand(src,0)
					step_rand(src,0)
				if(src.random==7)
					//if(src.dir==NORTH)
					//if(src.dir==SOUTH)
					//if(src.dir==WEST)
					//if(src.dir==EAST)
					for(var/mob/M in oview(8))
						if(M.client)
							src.target=M
							src.Attack()
							step(src,rand(1.10))
							step(src,src.dir)
							step(src,src.dir)
							src.dir=get_dir(src,M)
							if(prob(67))
								src.Attack()
							else
								src.usejutsu()
							sleep(1)
							step_rand(src,0)
							step_rand(src,0)
							break
						/*if(src.dir==NORTH)
						if(src.dir==SOUTH)
						if(src.dir==WEST)
						if(src.dir==EAST)*/
				if(src.random==8)
					step(src,rand(1,10))
					sleep(1)
					step(src,rand(1,10))
					step(src,rand(1,10))
					step(src,rand(1,10))
					if(prob(50))
						src.Attack()
					else
						src.usejutsu()
					sleep(1)
					step_rand(src,0)
					sleep(1)
					step_rand(src,0)
				//if(src.random==9)
					//for(var/mob/M in oview(10))
						//src.loc=M.loc
				if(src.random==10)
					//src.icon_state="attack"
					//view(src)<<"<b>[src]:<font color=silver>HAHAHAHAHAHAHA"
					sleep(1)
					src.icon_state=""
					for(var/mob/M in oview(10))
						if(M.client)
							step_towards(src,M)//take a step towards M
							step_towards(src,M)
							if(prob(40))
								step_rand(src,32)
								step_rand(src,32)
							if(prob(1))
								src.Shushin_Behind(M)
							src.target=M
							if(get_dist(src,M)<=1)//if the distance is 1 or less
								if(prob(97))
									src.dir=get_dir(src,M)//Makes it so T faces M
									src.Attack()//Calls the attack proc
									if(prob(3))
										src.Shushin_Far_Behind(M)
									if(prob(6))
										src.usejutsu()
									//src.usejutsu()
						//var/damage=rand(100,1000)
						//M.health-=damage
						//view(src,8)<<"<b><font color=red>[src] attacked [M] for [damage] damage!"
						break
						//M.DamageShow(damage,200,0,0)
						//sleep(3)
						//src.icon_state=""
				sleep(src.movedelay*2.5)
			//else
				//return