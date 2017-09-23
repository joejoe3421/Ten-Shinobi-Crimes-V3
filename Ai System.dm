/////////////////////////////////////////////////////////////newer ai/////////////////////////////
mob
	/*Move()
		for(var/mob/monster/M in oview(5)) if(!M.woken) spawn() AI(M,src)//checks for mobs of the monster variety and if they aren't already using the AI code it calls it
		..()*/
	/*monster
		New()
			for(var/client/M in oview(5)) AI(src,M)//Checks for any players and if found calls the AI code with the NPC and said player
			..()*/
	var
		woken
		attacking
		spawnloc
		tmp/assassin=0

proc
	/*Attack(mob/monster/T)
		for(var/mob/M in get_step(T,T.dir))//Checks for mobs infront of T
			var/damage=rand(1,3)//Generates a random damage value(You can setup your damage calculation here like Strength-defense
			view(6)<<"[T] attacks [M] for [damage] damage!"*/ //Shows everyone how much T attacked M for
			//here would be where you enter your health subtraction/deathcheck code

	AI(mob/enemy/T,mob/M)
		if(!T||T.client||!M.client||T.ko!=0) return//stop if T doesn't exist anymore or if T is a client or if M is not a client
		T.woken=10
		//T.target=M
		while(M&&T&&T.woken)//while T exists and T is woken
			sleep(T.movedelay*1.3)//sleep 10 so theres less lag you can probably make this lower if you want NPCs to move faster
			if(T&&T.ko==2)
				while(T&&T.ko==2)
					T.CENTER()
					sleep(T.movedelay*2)
			if(T&&M&&T.woken>0&&get_dist(T,M)>15&&M.invisibility<1)//if T's woken is higher than 0 and the distance between T and M is 5 or more and T exits and M exists
				step_rand(T)//Take a Random step
				T.woken-=1//Subract 1 from T's woken
				T.target=null
			else if(get_dist(T,M)<16&&T&&M)//else if the distance between T is lower than 6(meaning 5 or less) and T exists and M exists
				if(M.ko>=2)
					step_rand(T)//Take a Random step
					T.woken-=1//Subract 1 from T's woken
					T.target=null
				else
					step_towards(T,M)//take a step towards M
					step_towards(T,M)
					if(get_dist(T,M)<=3)
						if(prob(16))
							step_rand(T)
							sleep(1)
							step_rand(T)
					//if(prob(2))
						//T.Shushin_Behind(M)
					T.target=M
					if(get_dist(T,M)<=1)//if the distance is 1 or less
						if(prob(97))
							T.dir=get_dir(T,M)//Makes it so T faces M
							T.Attack()//Calls the attack proc
							if(prob(6.5))
								//T.Shushin_Far_Behind(M)
								T.usejutsu(M)
							if(M.doingseals||M.combo>=1)
								if(prob(16))
									T.G()
									if(M.doingseals)
										while(M&&M.doingseals)
											sleep(rand(30,60))
									if(M.combo>0)
										while(M&&M.combo>=1)
											sleep(5)
									T.GRelease()
						else
							T.usejutsu(M)
					else
						if(prob(9))
							T.usejutsu(M)
		if(T)
			T.woken=0
	AIassassin(mob/enemy/T,mob/M)
		if(!T||T.client||!M.client) return//stop if T doesn't exist anymore or if T is a client or if M is not a client
		T.woken=10
		//T.target=M
		while(M&&T&&T.woken&&M.bounty>=1)//while T exists and T is woken
			sleep(T.movedelay*1.3)//sleep 10 so theres less lag you can probably make this lower if you want NPCs to move faster
			if(T&&T.ko==2)
				while(T&&T.ko==2)
					T.CENTER()
					sleep(T.movedelay*3)
			if(T&&M&&T.woken>0&&T.z!=M.z&&M.invisibility<1)//if T's woken is higher than 0 and the distance between T and M is 5 or more and T exits and M exists
				step_rand(T)//Take a Random step
				sleep(rand(200,350))
				if(M)
					if(prob(25))
						retry
						T.loc=locate(rand(1,200),rand(1,200),M.z)
						var/rightnow=T.loc
						step_rand(T)
						sleep(2)
						step_rand(T)
						sleep(2)
						step_rand(T)
						sleep(2)
						if(T.loc==rightnow)
							goto retry
			else if(T&&M&&get_dist(T,M)<16)//else if the distance between T is lower than 6(meaning 5 or less) and T exists and M exists
				if(M.ko>=2)
					if(prob(25))
						step_rand(T)//Take a Random step
				else
					spawn(1)
						var/longnow=rand(3,5)
						while(T&&M&&longnow>0)
							step_towards(T,M)//take a step towards M
							longnow-=1
							sleep(1)
					step_towards(T,M)
					if(prob(60))
						walk_to(T,M)
						spawn(rand(50,150))
							walk(T,0)
					else
						step_rand(T)
					if(get_dist(T,M)<=2)
						if(prob(1))
							T.Say(pick("For the [T.village] Village I shal claim your bounty!","In the name of the [T.village] surrender yourself to me.","I'm going to take your bounty [M.name]"))
						if(prob(8))
							step_rand(T)
							sleep(1)
							step_rand(T)
					//if(prob(2))
						//T.Shushin_Behind(M)
					T.target=M
					if(get_dist(T,M)<=1)//if the distance is 1 or less
						if(prob(97))
							T.dir=get_dir(T,M)//Makes it so T faces M
							T.Attack()//Calls the attack proc
							if(prob(6.5))
								//T.Shushin_Far_Behind(M)
								T.usejutsu(M)
							if(M.doingseals||M.combo>=1)
								if(prob(26))
									T.G()
									if(M.doingseals)
										while(M&&M.doingseals)
											sleep(rand(3,5))
									if(M.combo>0)
										while(M&&M.combo>=1)
											sleep(2)
									T.GRelease()
								else
									step_rand(T)
						else
							T.usejutsu(M)
					else
						if(prob(9))
							T.usejutsu(M)
		if(T)
			T.woken=0
			if(prob(60))
				T.Say("Lets see.... another bounty to hunt....*[T] Pulls out a book and begins flipping through pages writing down certain names.*")
				var/targets=list()
				var/havetargets=0
				for(var/mob/U in world)
					if(T)
						if(U.client&&U.bounty>=1&&U.village!=T.village)
							targets+=U
							havetargets+=1
							if(prob(30))
								T.Say(pick("Hmm...Okay [U] added.","Adding [U].","Wow definately adding [U].","[U]..."))
					sleep(2)
				if(havetargets<=0)
					T.Say("Hmmm... No more bounties right now...")
					sleep(10)
					T.Say(pick("Weird...","Okay then.","I'll return the news of my failure...","Oh no!"))
					//this is the part where they return half the money they have on them to their village saying they also failed to take down a bounty
				else
					T.target=pick(targets)
					T.Say("Prepare yourself [T.target], because you'll be hunted by me!")
					AIassassin(T,T.target)
			else
				//return half the money to the village aslso sayign they failed to claim a bounty
				for(var/mob/Y in world)
					if(Y.client&&Y.village==T.village)
						Y<<"<font face=red>Village Info:</font><font face=yellow> [T] has failed to bring down a bounty and has given back money to the village.([T.yen])"
						sleep(1)
				//M.yen+=src.bounty
				//src.bounty=0
				if(T.village=="Leaf")
					LeafVillagePool+=T.yen
				if(T.village=="Rock")
					RockVillagePool+=T.yen
				if(T.village=="Rain")
					RainVillagePool+=T.yen
				if(T.village=="Sound")
					SoundVillagePool+=T.yen
				if(T.village=="Waterfall")
					WaterfallVillagePool+=T.yen
				if(T.village=="Cloud")
					CloudVillagePool+=T.yen
				if(T.village=="Sand")
					SandVillagePool+=T.yen
				T.yen=0
				spawn(150)
					if(T)
						del T

		//if(T)
			//view(T,6)<<"[T] dissapears in a puff of smoke."
			//T.loc=T.spawnloc
	/*AImedic(mob/T,mob/M)
		if(!T||T.client||!M.client) return//stop if T doesn't exist anymore or if T is a client or if M is not a client
		if(M.wounds>=35&&M.village==T.village)
			T.woken=10
			while(T&&T.woken)//while T exists and T is woken
				sleep(6)//sleep 10 so theres less lag you can probably make this lower if you want NPCs to move faster
				if(T.woken>0&&get_dist(T,M)>5&&T&&M)//if T's woken is higher than 0 and the distance between T and M is 5 or more and T exits and M exists
					if(M.wounds<=34)
						step_rand(T)//Take a Random step
					else
						step_rand(T)
					T.woken-=1//Subract 1 from T's woken
				else if(get_dist(T,M)<6&&T&&M&&M.wounds>=35)//else if the distance between T is lower than 6(meaning 5 or less) and T exists and M exists
					step_towards(T,M)//take a step towards M
					if(get_dist(T,M)<=1)//if the distance is 1 or less
						T.dir=get_dir(T,M)//Makes it so T faces M
						T.MysticalHand2()//Calls the heal proc
*/
//////////////////////////////////////////////////////////////////////////////////////////////////////





////give them a type of brains like ones that help, run etc



////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////Jutsu code(For NPCs)/////////////////////////////////////

var
	normaljutsu=list("clone","kawarimi","henge")
	specialjutsu=list("push","pull","absorb","healing wound destruction","soul strike","corrsivemist","lavaball")
	katonjutsu=list("fireball","pheonixflower","grandfireball")
	suitonjutsu=list("watercannon","watercutter","watervortex")
	raitonjutsu=list("raitonball","nagashi","Chidori","Raikiri","raitoncurrent")
	dotonjutsu=list("dotonheki","rockthrow","dotonswamp","dotonprison")
	fuutonjutsu=list("windcutter","windwave","windblade","windtrick")



	//make proc to give the npc their jutsu make it use spawn and make it kinda slow yo prevent lag  sl sleep of like 10(one second)
	//make one to give them their clan jutsu aswell
mob
	proc
		npcjutsugive()
			if(src.client)
				return
			if(src.element=="None")
				src.element=pick("Katon","Suiton","Fuuton","Raiton","Doton")
			if(prob(0.1))
				var/hm=rand(1,2)
				while(hm)
					src.jutsus+=pick(specialjutsu)
					hm-=1
					sleep(2)
			if(src.element=="Katon")
				var/hm=rand(2,4)
				while(hm)
					src.jutsus+=pick(katonjutsu)
					hm-=1
					sleep(2)
			if(src.element=="Raiton")
				var/hm=rand(2,4)
				while(hm)
					src.jutsus+=pick(raitonjutsu)
					hm-=1
					sleep(2)
			if(src.element=="Fuuton")
				var/hm=rand(2,4)
				while(hm)
					src.jutsus+=pick(fuutonjutsu)
					hm-=1
					sleep(2)
			if(src.element=="Doton")
				var/hm=rand(2,4)
				while(hm)
					src.jutsus+=pick(dotonjutsu)
					hm-=1
					sleep(2)
			if(src.element=="Suiton")
				var/hm=rand(2,4)
				while(hm)
					src.jutsus+=pick(suitonjutsu)
					hm-=1
					sleep(2)
			if(prob(3))//make 10%
				src.jutsus+="Gates"
				src.hasgates=rand(2,8)
			if(prob(5))//make 5%
				src.jutsus+="Rasengan"
			if(src.clan=="Akimichi")
				src.jutsus+="Human Bolder"






mob
	proc
		usejutsu(mob/M)
			if(src.ko)
				return
			if(src.Frozen||src.insand||src.bind>0)
				return
			var/hasthem=0
			for(var/c in src.jutsus)
				if(c)
					hasthem+=1
			if(hasthem>=1)
				if(src.ko)
					return
				var/jutsu=pick(src.jutsus)
				if(jutsu=="missles")
					src.auramissles()
				else if(jutsu=="missle")
					src.auramissle()
				else if(jutsu=="push")
					src.push1()
				else if(jutsu=="pull")
					src.pull1()
				else if(jutsu=="crows")
					src.crowg()
				else if(jutsu=="finishstart")
					src.finishstart(M)
				/*if(jutsu=="clone")
					src.Clones()*/
				else if(jutsu=="healing wound destruction")
					src.npcselfheal1()
				else if(jutsu=="absorb")
					src.npcabsorb()
				else if(jutsu=="soul strike")
					src.npcsoulstrike()
				else if(jutsu=="tsukuyomi")
					src.faketsukuyomi(M)
				else if(jutsu=="fireball"||jutsu=="Grand Fire Ball")
					src.fireballjutsu()
				else if(jutsu=="Chakra Rod"||jutsu=="chakrarod")
					src.chakrarod()
				else if(jutsu=="teleport"||jutsu=="shushin")
					src.shushin(M)
				else if(jutsu=="Beast Mode")
					src.beastmode()
				else if(jutsu=="Man Beast Claws")
					src.beastclaws()
				else if(jutsu=="Tsuuga")
					src.tsuuga()
				else if(jutsu=="Gates")
					src.gatesgo()
				else if(jutsu=="Rasengan")
					src.raseng()
				else if(jutsu=="Chidori")
					src.chidori()
				else if(jutsu=="Human Bolder")
					src.humanbol()
				else if(jutsu=="bonebullets")
					src.bonebs()
				else if(jutsu=="watercannon")
					src.watercan()
				else if(jutsu=="Raikiri")
					src.raikiri()
				else if(jutsu=="windwave"||jutsu=="Wind Wave")
					src.windwave()
				else if(jutsu=="rockthrow"||jutsu=="Rock Throw")
					src.rockthrow()
				else
					if(prob(30))
						view(src)<<"[src] tried to use [jutsu] jutsu but failed because it's not AI assesable."
			else
				return



























///////////////////////////////////////////////////////////
///////////////////////////////
/////////////////////////////////////////


mob
	proc
		push1()
			view()<<"[src]: Shinra..."
			src.Frozen=1
			sleep(20)
			flick("Power",src)
			view()<<"[src]: Tensei!"
			spawn(25)
				src.Frozen=0
			for(var/obj/jutsu/J in oview(5))
				spawn(1)
					if(J)
						if(J.owner==src)

						else
							while(get_dist(src,J)<2)
								step_away(J,src,5,31)
								sleep(1)
			for(var/mob/M in oview(4,src))
				spawn()
					if(M.client)
						if(M.ko==0)
							while(get_dist(src,M)<4)
								step_away(M,src,5,31)
								sleep(1)
							M.nindamage(src.nin*0.70,0,src)
							//var/obj/smoke/B=new()
							//B.loc=locate(A.x,A.y,A.z)
							//view(A)<< sound('Smoke.wav',0,0,1)
		pull1()
			view()<<"[src]: Bansho Tenin!"
			src.Frozen=1
			spawn(15)
				src.Frozen=0
			for(var/mob/M in oview(6))
				spawn()
					if(M.client)
						if(M.ko==0)
							M.dir=get_dir(M,src)
							flick("fall",M)
						var/banshotimer=10
						while(get_dist(src,M)>1&&M&&banshotimer>1)
							step_towards(M,src,32)
							banshotimer-=1
							sleep(1)
						//M.stepback(20)
						//spawn(5)
							//M.icon_state=""
		crowg()
			if(src.crowgen>0)
				return
			//usr<<"You set up 5 Crow Clones."
			src.crowgen=1
		npcselfheal1()
			if(src.health<src.Mhealth)
				view()<<"[src]: Healing Wound Destruction!"
				spawn(1)
					var/healing=rand(1,3)
					while(healing)
						src.health+=src.Mhealth*0.0625
						healing-=1
						sleep(10)
		npcabsorb()
			src.Frozen=1
			src.absorbing=1
			src<<"You prepare to absorb."
			src.icon_state="Power"
			src.overlays+='absorbtion.dmi'
			sleep(rand(30,70))
			src.absorbing=0
			src.Frozen=0
			src<<"You stop absorbing."
			src.icon_state=""
			src.overlays-='absorbtion.dmi'
			src.overlays-='absorbtion.dmi'
			src.overlays-='absorbtion.dmi'
		npcsoulstrike()
			if(prob(10))
				view()<<"[src]: Soul Strike!"
			for(var/mob/M in get_step(src,src.dir))
				flick(pick("punchr","punchl"),src)
				if(M.soul)
					if(src.owner!="")
						M.taidamage(src.tai*1.8,0,src.owner)
						M.nindamage(src.tai/1.5,0,src.owner)
					else
						M.taidamage(src.tai*1.8,0,src)
						M.nindamage(src.tai/1.5,0,src)
					spawn(1)
						if(M.ko==0)
							M.dir=get_dir(M,src)
							M.icon_state="fall"
							M.stepback(rand(1,2))
							if(M.ko==0)
								M.icon_state=""
		faketsukuyomi(mob/M)
			view(src)<<"[src] Says: Tsukuyomi!"
			var/mob/npc/TsukuyomiBunshin/A=new()
			if(A)
				A.name="[src.name]"
				A.owner=src
				A.icon=src.icon
				A.dir=src.dir
				A.overlays+=src.overlays
				A.loc=src.loc
				A.icon_state=src.icon_state
				A.tai=src.tai*0.40
				A.target=M
				if(src.gen>M.gen&&M.target==src)
					if(prob(70))
						if(M.client)
							for(var/image/x in M.client.images)
								if(x.icon=='target.dmi')
									del(x)
							var/image/I = image('target.dmi',A)
							I.layer=FLOAT_LAYER
							M<<I
							M.target=A
							//A.target=O
						else
							M.target=A
		fireballjutsu()
			var/obj/jutsu/fireball2/A=new()
			var/size=1
			if(!src.client)
				if(src.name=="Itachi Uchiha")
					view(src)<<"[src] says: Fire ball jutsu!"
					size=2
				if(src.name=="Madara Uchiha")
					view(src)<<"[src] says: Fire style: Great Destruction Jutsu!"
					size=3
			A.level=size
			A.owner=src;A.loc=src.loc
			A.dir=src.dir;walk(A,A.dir)
		chakrarod()
			if(src.weapon=="")
				src.overlays+='NA.dmi'
				src.weaponoverlays+='NA.dmi'
				src.weapon="Chakra Rod"
				src<<"You create a chakra rod from your hand."
			else
				if(src.weapon=="Chakra Rod")
					src.weapon=""
					src.overlays-=src.weaponoverlays
		shushin(mob/M)
			if(prob(50))
				src.Shushin_Behind(M)
			else
				src.Shushin_Far_Behind(M)
		beastmode()
			if(src.shika==0)
				view(src)<<"[src]: Beast Mode!"
				src.shika=1
		beastclaws()
			if(src.manbeastclaws)
				src.manbeastclaws=0
			else
				src.manbeastclaws=1
		tsuuga()
			if(src.intsu==0)
				src.intsu=1
				src.overlays-='Icons/Jutsus/Tsuuga.dmi'
				src.overlays+='Icons/Jutsus/Tsuuga.dmi'
				src.movedelay=src.speed1
				spawn(150)
					if(src)
						src.intsu=0
						src.overlays-='Icons/Jutsus/Tsuuga.dmi'
						src.movedelay=src.savedspeed
		gatesgo()
			if(src.gates<src.hasgates)
				view(src)<<"[src]: Gate [src.gates+1], OPEN!"
				if(src.gates==0)
					spawn(1)
						if(src.reanimated==0)
							while(src.gates>0)
								if(src.health>100)
									src.alldamage(4*src.gates,0,src)
								src.koamm+=0.3*src.gates
								src.HealGateTime++
								sleep(10)
				src.gates+=1
				if(src.gates==3)
					var/I='Base.dmi'
					I += rgb(120,0,0)
					src.Oicon=src.icon
					src.icon=I
					src.overlays+='BEyes.dmi'
		raseng()
			if(prob(30))//was 10%
				if(src.rasenganon==0)
					src.rasengancharge=0;src.rasenganon=1;src.rasengantype=1
					var/A='Icons/Jutsus/Rasengan.dmi';src.overlays-=A;src.overlays+=A;flick("Power",A)
					src.rasenganD=src.chakra*pick(0.25,0.35,0.45,0.50,0.45,0.35,0.25)
					spawn(1)
						while(src.rasenganon)
							view(2,src)<< sound('SFX/RasCharge.wav',0,0,volume=15)
							if(!src.rasengancharge)
								src.rasenganD-=10
								//for(var/obj/Jutsu/Kiriame/S2 in src.loc)
									//src.RasenganD=0
								if(src.rasenganD<=0||src.ko>0)
									src.overlays-='Icons/Jutsus/Rasengan.dmi';src<<"Your Rasengan ran out of energy!";src.rasenganon=0
							sleep(8)
						src.rasenganD=0
						src.overlays-='Icons/Jutsus/Rasengan.dmi'
		chidori()
			if(prob(30))
				if(src.chidorion==0)
					src.chidoricharge=0;src.chidorion=1;src.chidoritype=1
					var/A='Icons/Jutsus/Chidori.dmi';src.overlays-=A;src.overlays+=A;flick("Power",A)
					src.chidoriD=src.chakra*pick(0.25,0.35,0.45,0.50,0.45,0.35,0.25)
					spawn(1)
						while(src.chidorion)
							view(3,src)<< sound('SFX/LightningSFX.wav',0,0,volume=15)
							if(!src.chidoricharge)
								src.chidoriD-=10
								//usr.icon_state="weapon"
								//for(var/obj/Jutsu/Kiriame/S2 in src.loc)
									//src.RasenganD=0
								if(src.chidoriD<=0||src.ko>0)
									src.overlays-='Icons/Jutsus/Chidori.dmi';src<<"Your Chidori ran out of energy!";src.chidorion=0
							sleep(6)
						src.chidoriD=0
						src.overlays-='Icons/Jutsus/Chidori.dmi'
		raikiri()
			if(prob(15))
				if(src.chidorion==0)
					src.chidoricharge=0;src.chidorion=1;src.chidoritype=2
					var/A='Icons/Jutsus/Chidori.dmi';src.overlays-=A;src.overlays+=A;flick("Power",A)
					src.chidoriD=src.chakra*(pick(0.25,0.35,0.45,0.50,0.45,0.35,0.25)*2)
					spawn(1)
						while(src.chidorion)
							view(3,src)<< sound('SFX/LightningSFX.wav',0,0,volume=19)
							if(!src.chidoricharge)
								src.chidoriD-=12
								//usr.icon_state="weapon"
								//for(var/obj/Jutsu/Kiriame/S2 in src.loc)
									//src.RasenganD=0
								if(src.chidoriD<=0||src.ko>0)
									src.overlays-='Icons/Jutsus/Chidori.dmi';src<<"Your Raikiri ran out of energy!";src.chidorion=0
							sleep(6)
						src.chidoriD=0
						src.overlays-='Icons/Jutsus/Chidori.dmi'
		humanbol()
			if(src.hbolder==0)
				src.hbolder=1
				src.overlays-='Icons/Jutsus/AkimichiTechniques.dmi';src.overlays+='Icons/Jutsus/AkimichiTechniques.dmi'
				src.movedelay=src.speed1
				spawn(150)
					src.hbolder=0
					src.overlays-='Icons/Jutsus/AkimichiTechniques.dmi';src.overlays-='Icons/Jutsus/AkimichiTechniques.dmi'
					src.movedelay=src.savedspeed
		bonebs()
			view(src)<<"[src]: Digital Shrapnel!"
			var/obj/jutsu/bonebullets/A=new()
			A.power=src.tai*1.8
			A.owner=src;A.loc=src.loc
			A.dir=src.dir;walk(A,A.dir)
		watercan()
			var/obj/jutsu/water2/A=new()
			A.power=src.nin*1.2
			A.owner=src;A.loc=src.loc
			A.dir=src.dir;walk(A,A.dir)
		windwave()
			var/obj/jutsu/wind1/A=new()
			A.power=src.nin*1.5
			A.owner=src;A.loc=src.loc
			A.dir=src.dir;walk(A,A.dir)
		rockthrow()
			var/obj/jutsu/smallrock/A=new()
			A.power=((src.nin*0.4)+(src.tai*0.8))
			A.owner=src;A.loc=src.loc
			A.dir=src.dir;walk(A,A.dir)






























////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


mob/proc/Generate_A_Name()
	var/I = pick(1,3,2)
	if(I > 20)
		I = 20
	var/Name = Generate_Name(I)
	src.name="[Name]"

var/list
	SoftConSoft = list("nin","lin","fin","vin","sin","hin","win","nen","non","nun","ner","wer","her","ver","mer","ner","ler","zer","fer","mon","fom","fim","fem","fev","fen","ven","nis","mis","his","lis","ris","wis","vis","ves","res","mes","nes","les","las","has","vas","was","mas","maz","laz","haz","raz","ras","ram","ran","ron","von","nean","mean","vean","kean","lean","loon","rean","roon","wool","weal","wath","rath","wrath","wran","wram","wron","wrun","wrol","wrel","wral","nith","mith","sith","lith","thith","fear","feer","footh","steer","stom","strom","strim","stroll","streth","meth","neth","heth","leth","liss","miss","niss","hiss","nill","mill","hill","fill","fran")
	HardConSoft = list("tin","bin","gin","kin","cin","pin","din","ton","bon","kon","gon","jon","xon","pon","con","cor","dor","gor","jor","kor","tor","ben","ken","ten","pen","cen","gen","jir","bir","kir","gir","gem","dem","kem","tem","pem","jem","xem","ter","ger","per","ber","fer","der","dam","fam","kam","cam","tam","tan","ban","pan","quith","quon","quen","toon","toom","tomb","bomb","gomb","komb","romb","pomb","poon","poom","boom","boon","bean","been","bien","kien","kill","kiss","diss","piss","tiss","giss","biss","bill","pill","till","jill","cill")
	VowConSoft = list("so","no","mo","ho","fo","wo","lo","noo","moo","loo","woo","voo","la","va","na","sa","ra","ma","ha","hi","mi","ni","li","wi","me","ne","se","he","le","ve","we","re","nea","fea","foo","wea","fie","lie","nie","mie","psy")
	SoftConHard = list("nit","vit","hit","wit","sit","lit","let","ret","met","net","vet","mot","not","sot","rot","hot","lot","fot","vot","wot","lib","sib","nib","mib","mob","nob","sob","wob","lob","hop","mop","nop","fop","lop","rop","vop","xop","rip","nip","hip","lip","xip","vip","vok","nok","lok","fok","wok","mok","hok","mik","sik","hik","lik","nik","rik","wik","nak","rak","gak","sak","lak","mak","wak","vak","hig","nig","mig","lig","wig","heg","neg","leg","meg")
	HardConHard = list("tot","bot","got","dot","kot","cot","pot","jot","tok","bok","gok","dok","kok","cok","pok","jok","tob","bob","gob","dob","kob","cob","pob","job","tog","bog","gog","dog","kog","cog","pog","jog","tid","bid","gid","did","kid","cid","pid","jid","ted","bed","ged","ded","ked","ced","ped","jed","tuk","buk","guk","lud","pud","bud","tig","big","gig","lig","pig","jig","cig","kig","dig","bag","hag","sag","nag","lag","jag","mag","nak","lak","sak","tak","hak","jak","bak")
	VowConHard = list("to","bo","ko","go","jo","xo","co","po","ti","bi","ki","gi","ji","xi","ci","pi","te","be","ke","ge","je","ce","pe","tu","bu","ku","ju","cu","pu","ta","ba","ka","ga","ja","ca","pa","pui","qui","boo","coo","doo","koo","pea","bea","kea")
	SoftVow = list("os","on","om","or","ol","en","em","es","el","er","ef","of","af","ar","al","an","am","av","as","im","in","ir","iw","il","if","iv","uf","ul","um","un","ean","ein","eam","ien","ies","iel","ien","iem","aim","ain","ail","air","aiv","aith","eth","ith","oom","oon","ool","aph","iph","eph")
	HardVow = list("ot","ob","og","ok","oc","op","it","ib","ig","ik","ic","ip","et","eb","eg","ec","ep","ek","ak","at","ab","ap","ac","ag","ad","ed","od","id","eat","iet","ait","iak","aik","eak","iap","ack","ick","ock","oock","alk","ey","y")
	L_SCS = list("SV","HV","HCH","HCS","VCH")
	L_HCH = list("SV","HV","SCH","SCS","VCS")
	L_HCS = list("SV","HV","HCH","HCS","VCH")
	L_SCH = list("SV","HV","SCH","SCS","VCS")
	L_VCS = list("SCH","SCS","VCS","HCH","HCS","VCH")
	L_VCH = list("SCH","SCS","VCS","HCH","HCS","VCH")
	L_SV = list("HCH","HCS","VCH")
	L_HV = list("SCH","SCS","VCS")






proc/Get_Next_Syll_Type(A)
	switch(A)
		if("SCS")
			return pick(L_SCS)
		if("HCH")
			return pick(L_HCH)
		if("HCS")
			return pick(L_HCS)
		if("SCH")
			return pick(L_SCH)
		if("VCS")
			return pick(L_VCS)
		if("VCH")
			return pick(L_VCH)
		if("SV")
			return pick(L_SV)
		if("HV")
			return pick(L_HV)

proc/Get_Next_Syll(A)
	switch(A)
		if("SCS")
			return pick(SoftConSoft)
		if("HCH")
			return pick(HardConHard)
		if("HCS")
			return pick(HardConSoft)
		if("SCH")
			return pick(SoftConHard)
		if("VCS")
			return pick(VowConSoft)
		if("VCH")
			return pick(VowConHard)
		if("SV")
			return pick(SoftVow)
		if("HV")
			return pick(HardVow)


proc/Generate_Name(S)   //S = Number of syllables.
	if(S > 0)
		var/G = S-1
		var/F_Current = pick("SCH","SCS","VCS","HCH","HCS","VCH","HV","SV")
		var/Word = Get_Next_Syll(F_Current)
		while(G > 0)
			G--
			F_Current = Get_Next_Syll_Type(F_Current)
			Word += Get_Next_Syll(F_Current)
		Word = "[uppertext(copytext(Word,1,2))][copytext(Word,2)]"
		return Word
	else
		return ""




mob
	proc
		myreplacement()
			if(src.assassin==0)
				if(src.rank=="Academy Student")
					src.spawner1(src.spawnloc)
				if(src.rank=="Genin")
					src.spawner1(src.spawnloc)
				if(src.rank=="Chuunin")
					src.spawner3(src.spawnloc)
				if(src.rank=="Special Jounin")
					src.spawner4(src.spawnloc)
				if(src.rank=="Jounin")
					src.spawner5(src.spawnloc)
				if(src.rank=="Civilan")
					src.spawner6(src.spawnloc)



mob
	proc
		spawner6(loc)// 1-4 level ninja
			if(!loc)
				return
			var/sh = loc
			var/mob/enemy/Test_Ninja/A=new()
			if(A)
				A.loc=sh
		spawner1(loc)// 1-15 level ninja
			if(!loc)
				return
			var/sh = loc
			var/mob/enemy/Rouge_Ninja/A=new()
			if(A)
				A.loc=sh
		spawner2(loc)// 16-32 level ninja
			if(!loc)
				return
			var/sh = loc
			var/mob/enemy/Rouge_Ninja2/A=new()
			if(A)
				A.loc=sh
		spawner3(loc)// 16-32 level ninja
			if(!loc)
				return
			var/sh = loc
			var/mob/enemy/Rouge_Ninja3/A=new()
			if(A)
				A.loc=sh
		spawner4(loc)// 16-32 level ninja
			if(!loc)
				return
			var/sh = loc
			if(prob(90))
				var/mob/enemy/Rouge_Ninja4/A=new()
				if(A)
					A.loc=sh
			else
				var/mob/enemy/Rouge_Ninja6/A=new()
				if(A)
					A.loc=sh
		spawner5(loc)// 16-32 level ninja
			if(!loc)
				return
			var/sh = loc
			if(prob(95))
				var/mob/enemy/Rouge_Ninja5/A=new()
				if(A)
					A.loc=sh
			else
				var/mob/enemy/Rouge_Ninja7/A=new()
				if(A)
					A.loc=sh




mob
	proc
		bountyhunterhire(var/price,loc)
			if(price<1000)
				var/sh = loc
				var/mob/enemy/Rouge_Ninja/A=new()
				if(A)
					A.assassin=1
					A.village=src.village
					A.yen+=price*0.5
					A.loc=sh
			if(price>1000&&price<=5000)
				var/sh = loc
				var/mob/enemy/Rouge_Ninja2/A=new()
				if(A)
					A.assassin=1
					A.village=src.village
					A.yen+=price*0.5
					A.loc=sh
			if(price>5000&&price<=10000)
				var/sh = loc
				var/mob/enemy/Rouge_Ninja3/A=new()
				if(A)
					A.assassin=1
					A.village=src.village
					A.yen+=price*0.5
					A.loc=sh
			if(price>10000&&price<=30000)
				var/sh = loc
				var/mob/enemy/Rouge_Ninja4/A=new()
				if(A)
					A.assassin=1
					A.village=src.village
					A.yen+=price*0.5
					A.loc=sh
			if(price>30000&&price<=40000)
				var/sh = loc
				var/mob/enemy/Rouge_Ninja5/A=new()
				if(A)
					A.assassin=1
					A.village=src.village
					A.yen+=price*0.5
					A.loc=sh
			if(price>40000&&price<=75000)
				var/sh = loc
				var/mob/enemy/Rouge_Ninja6/A=new()
				if(A)
					A.assassin=1
					A.village=src.village
					A.yen+=price*0.5
					A.loc=sh
			if(price>75000)
				var/sh = loc
				var/mob/enemy/Rouge_Ninja7/A=new()
				if(A)
					A.assassin=1
					A.village=src.village
					A.yen+=price*0.5
					A.loc=sh










//////////////////////////////////////////////////////////////////////////////////
mob
	var
		expgive=0
		jutsus = list()//this is for npc only? or for reanimated corpses too?, think about it







mob
	enemy
		run=1
		koamm=0
		yen=0
		New()
			..()
			spawn(30)
				if(prob(40))
					src.yen+=rand(5,100)
				if(src&&src.assassin)
					step(src,SOUTH)
					src.Say("Lets see.... bounties....*[src] Pulls out a book and begins flipping through pages writing down certain names.*")
					var/targets=list()
					var/havetargets=0
					for(var/mob/M in world)
						if(src)
							if(M.client&&M.bounty>=1&&M.village!=src.village)
								targets+=M
								havetargets+=1
								if(prob(85))
									src.Say(pick("Hmm...Okay [M] added.","Adding [M].","Wow definately adding [M].","[M]..."))
						sleep(2)
					if(havetargets<=0)
						src.Say("Hmmm... No more bounties right now...")
						sleep(10)
						src.Say(pick("Weird...","Okay then.","I'll return the news of my failure...","Oh no!"))
						//this is the part where they return half the money they have on them to their village saying they also failed to take down a bounty
						for(var/mob/Y in world)
							if(Y.client&&Y.village==src.village)
								Y<<"<font color=red>Village Info:</font><font color=yellow> [src] has failed to collect a bounty returning to the village."
								sleep(1)
						if(src.village=="Leaf")
							LeafVillagePool+=src.yen
						if(src.village=="Rock")
							RockVillagePool+=src.yen
						if(src.village=="Rain")
							RainVillagePool+=src.yen
						if(src.village=="Sound")
							SoundVillagePool+=src.yen
						if(src.village=="Waterfall")
							WaterfallVillagePool+=src.yen
						if(src.village=="Cloud")
							CloudVillagePool+=src.yen
						if(src.village=="Sand")
							SandVillagePool+=src.yen
						src.yen=0
						spawn(150)
							if(src)
								del src
					else
						src.target=pick(targets)
						src.Say("Prepare yourself [src.target], because you'll be hunted by me!")
					AIassassin(src,src.target)
		Test_Ninja
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			health = 100
			Mhealth=1000
			level=1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(3,10))
					src.needface()
				spawn(rand(2,8))
					//src.name=pick("Kago","Sal","Maru","Sul","Fei","Bui")
					src.Generate_A_Name()
					src.clan=pick("Uchiha","","Sand","Yamanaka","Nara","Hozuki","Senju","Akimichi","Inuzuka","Hyuuga","Kaguya","Namikaze","")
					spawn(1)
						//var/X=5
						var/list/L = src.jutsus
						src.npcjutsugive() // make one for clan jutsu aswell
						if(src.clan=="Uchiha")
							if(prob(8))
								L.Add("crows")
						if(src.clan=="Inuzuka")
							L.Add("Beast Mode")
							//L.add("Man Beast Claws")
							//L.add("Tsuuga")
						if(src.clan=="Kaguya")
							L.Add("bonebullets")
						if(src.clan=="Namikaze")
							L.Add("teleport")
					src.movedelay+=0.35//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
					src.rank="Civilan"
					src.combolimit=pick(1,3,2)
					src.level=rand(1,4)//was 1,125
					src.Mhealth=rand(15,35)*(src.level*0.12)
					src.Mchakra=rand(9,33)*src.level
					src.chakra=src.Mchakra
					src.expgive=rand(25,45)*src.level
					src.Mtai=rand(1.5,2.5)*(src.level*2)
					src.Mnin=rand(1.5,2.5)*(src.level*2)
					src.Mgen=rand(1.5,2.5)*(src.level*2)
					src.tai=src.Mtai
					src.nin=src.Mnin
					src.gen=src.Mgen
					src.health=src.Mhealth
					//src.clan=pick("Uchiha","","","Yamanaka","Nara",)
					if(src.assassin)
						src.name="[src.name] [src.clan]"
					else
						src.name="([src.rank])[src.name] [src.clan]"

				spawn(rand(10,20))
					if(src)
						src.spawnloc=src.loc
			Del()
				src.myreplacement()
				sleep(10)
				..()
		Rouge_Ninja
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			health = 100
			Mhealth=1000
			level=1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(3,10))
					src.needface()
				spawn(rand(2,8))
					//src.name=pick("Kago","Sal","Maru","Sul","Fei","Bui")
					src.Generate_A_Name()
					src.clan=pick("Uchiha","","Sand","Yamanaka","Nara","Hozuki","Senju","Akimichi","Inuzuka","Hyuuga","Kaguya","Namikaze","")
					spawn(1)
						//var/X=5
						var/list/L = src.jutsus
						src.npcjutsugive() // make one for clan jutsu aswell
						if(src.clan=="Uchiha")
							if(prob(8))
								L.Add("crows")
						if(src.clan=="Inuzuka")
							L.Add("Beast Mode")
							//L.add("Man Beast Claws")
							//L.add("Tsuuga")
						if(src.clan=="Kaguya")
							L.Add("bonebullets")
						if(src.clan=="Namikaze")
							L.Add("teleport")
					src.movedelay+=0.35//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
					src.rank="Academy Student"
					src.combolimit=pick(1,3,2)
					src.level=rand(1,10)//was 1,125
					src.Mhealth=rand(100,250)*(src.level*0.12)
					src.Mchakra=rand(9,33)*src.level
					src.chakra=src.Mchakra
					src.expgive=rand(10,20)*src.level
					src.Mtai=rand(2.5,5.5)*(src.level*2)
					src.Mnin=rand(2.5,5.5)*(src.level*2)
					src.Mgen=rand(2.5,5.5)*(src.level*2)
					src.tai=src.Mtai
					src.nin=src.Mnin
					src.gen=src.Mgen
					src.health=src.Mhealth
					//src.clan=pick("Uchiha","","","Yamanaka","Nara",)
					if(src.assassin)
						src.name="[src.name] [src.clan]"
					else
						src.name="([src.rank])[src.name] [src.clan]"

				spawn(rand(10,20))
					if(src)
						src.spawnloc=src.loc
			Del()
				src.myreplacement()
				sleep(10)
				..()
		Rouge_Ninja2
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			health = 100
			Mhealth=1000
			level=1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(3,10))
					src.needface()
				spawn(rand(2,8))
					//src.name=pick("Kago","Sal","Maru","Sul","Fei","Bui")
					src.Generate_A_Name()
					src.clan=pick("Uchiha","","Sand","Yamanaka","Nara","Hozuki","Senju","Akimichi","Inuzuka","Hyuuga","Kaguya","Namikaze","")
					spawn(1)
						//var/X=5
						var/list/L = src.jutsus
						src.npcjutsugive()
						if(src.clan=="Uchiha")
							if(prob(8))
								L.Add("crows")
						if(src.clan=="Inuzuka")
							L.Add("Beast Mode")
							L.Add("Man Beast Claws")
							L.Add("Tsuuga")
						if(src.clan=="Kaguya")
							L.Add("bonebullets")
						if(src.clan=="Namikaze")
							L.Add("teleport")
					src.movedelay+=0.25//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
					src.rank="Genin"
					src.combolimit=pick(1,3,2)
					src.level=rand(16,32)//was 1,125
					src.Mhealth=rand(100,250)*(src.level*0.25)
					src.Mchakra=rand(9,33)*src.level
					src.chakra=src.Mchakra
					src.expgive=rand(20,40)*(src.level*2)
					if(prob(2))
						src.expgive*=rand(2,3.5)
					src.Mtai=rand(2.5,5.5)*(src.level*2)
					src.Mnin=rand(2.5,5.5)*(src.level*2)
					src.Mgen=rand(2.5,5.5)*(src.level*2)
					src.tai=src.Mtai
					src.nin=src.Mnin
					src.gen=src.Mgen
					src.health=src.Mhealth
					//src.clan=pick("Uchiha","","","Yamanaka","Nara",)
					if(src.assassin)
						src.name="[src.name] [src.clan]"
					else
						src.name="([src.rank])[src.name] [src.clan]"

				spawn(rand(10,20))
					if(src)
						src.spawnloc=src.loc
			Del()
				src.myreplacement()
				sleep(10)
				..()
		Rouge_Ninja3
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			health = 100
			Mhealth=1000
			level=1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(3,10))
					src.needface()
				spawn(rand(2,8))
					//src.name=pick("Kago","Sal","Maru","Sul","Fei","Bui")
					src.Generate_A_Name()
					src.clan=pick("Uchiha","","Sand","Yamanaka","Nara","Hozuki","Senju","Akimichi","Inuzuka","Hyuuga","Kaguya","Namikaze","")
					spawn(1)
						//var/X=5
						var/list/L = src.jutsus
						src.npcjutsugive()
						if(src.clan=="Uchiha")
							if(prob(8))
								L.Add("crows")
						if(src.clan=="Inuzuka")
							L.Add("Beast Mode")
							L.Add("Man Beast Claws")
							L.Add("Tsuuga")
						if(src.clan=="Kaguya")
							L.Add("bonebullets")
						if(src.clan=="Namikaze")
							L.Add("teleport")
					src.movedelay+=0.15//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
					src.rank="Chuunin"
					src.combolimit=pick(1,3,2)
					src.level=rand(33,100)//was 1,125
					src.Mhealth=rand(100,250)*(src.level*0.50)
					src.Mchakra=rand(13,38)*src.level
					src.chakra=src.Mchakra
					src.expgive=rand(10,20)*src.level
					if(prob(2))
						src.expgive*=rand(2,3.5)
					src.Mtai=rand(2.5,5.5)*(src.level*2)
					src.Mnin=rand(2.5,5.5)*(src.level*2)
					src.Mgen=rand(2.5,5.5)*(src.level*2)
					src.tai=src.Mtai
					src.nin=src.Mnin
					src.gen=src.Mgen
					src.health=src.Mhealth
					//src.clan=pick("Uchiha","","","Yamanaka","Nara",)
					if(src.assassin)
						src.name="[src.name] [src.clan]"
					else
						src.name="([src.rank])[src.name] [src.clan]"

				spawn(rand(10,20))
					if(src)
						src.spawnloc=src.loc
			Del()
				src.myreplacement()
				sleep(10)
				..()
		Rouge_Ninja4
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			health = 100
			Mhealth=1000
			level=1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(3,10))
					src.needface()
				spawn(rand(2,8))
					//src.name=pick("Kago","Sal","Maru","Sul","Fei","Bui")
					src.Generate_A_Name()
					src.clan=pick("Uchiha","","Sand","Yamanaka","Nara","Hozuki","Senju","Akimichi","Inuzuka","Hyuuga","Kaguya","Namikaze","")
					spawn(1)
						//var/X=5
						var/list/L = src.jutsus
						src.npcjutsugive()
						if(src.clan=="Uchiha")
							if(prob(12))
								L.Add("crows")
						if(src.clan=="Inuzuka")
							L.Add("Beast Mode")
							L.Add("Man Beast Claws")
							L.Add("Tsuuga")
						if(src.clan=="Kaguya")
							L.Add("bonebullets")
						if(src.clan=="Namikaze")
							L.Add("teleport")
					src.movedelay+=0.05//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
					src.rank="Special Jounin"
					src.combolimit=pick(1,3,2)
					src.level=rand(100,200)//was 1,125
					src.Mhealth=rand(100,250)*(src.level)
					src.Mchakra=rand(9,33)*src.level
					src.chakra=src.Mchakra
					src.expgive=rand(10,20)*src.level
					if(prob(2))
						src.expgive*=rand(2,3.5)
					src.Mtai=rand(2.5,5.5)*(src.level*2)
					src.Mnin=rand(2.5,5.5)*(src.level*2)
					src.Mgen=rand(2.5,5.5)*(src.level*2)
					src.tai=src.Mtai
					src.nin=src.Mnin
					src.gen=src.Mgen
					src.health=src.Mhealth
					//src.clan=pick("Uchiha","","","Yamanaka","Nara",)
					if(src.assassin)
						src.name="[src.name] [src.clan]"
					else
						src.name="([src.rank])[src.name] [src.clan]"

				spawn(rand(10,20))
					if(src)
						src.spawnloc=src.loc
			Del()
				src.myreplacement()
				sleep(10)
				..()
		Rouge_Ninja5
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			health = 100
			Mhealth=1000
			level=1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(3,10))
					src.needface()
				spawn(rand(2,8))
					//src.name=pick("Kago","Sal","Maru","Sul","Fei","Bui")
					src.Generate_A_Name()
					src.clan=pick("Uchiha","","Sand","Yamanaka","Nara","Hozuki","Senju","Akimichi","Inuzuka","Hyuuga","Kaguya","Namikaze","")
					spawn(1)
						//var/X=5
						var/list/L = src.jutsus
						src.npcjutsugive()
						if(src.clan=="Uchiha")
							if(prob(30))
								L.Add("crows")
						if(src.clan=="Inuzuka")
							L.Add("Beast Mode")
							L.Add("Man Beast Claws")
							L.Add("Tsuuga")
						if(src.clan=="Kaguya")
							L.Add("bonebullets")
						if(src.clan=="Namikaze")
							L.Add("teleport")
					src.movedelay+=0.02//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
					src.rank="Jounin"
					src.combolimit=pick(1,3,2)
					src.level=rand(250,300)//was 1,125
					src.Mhealth=rand(100,250)*(src.level)
					src.Mchakra=rand(15,40)*src.level
					src.chakra=src.Mchakra
					src.expgive=rand(10,20)*src.level
					if(prob(1))
						src.expgive*=rand(3,6.5)
					src.Mtai=rand(2.5,5.5)*src.level
					src.Mnin=rand(2.5,5.5)*(src.level*2)
					src.Mgen=rand(2.5,5.5)*(src.level*2)
					src.tai=src.Mtai
					src.nin=src.Mnin
					src.gen=src.Mgen
					src.health=src.Mhealth
					//src.clan=pick("Uchiha","","","Yamanaka","Nara",)
					if(src.assassin)
						src.name="[src.name] [src.clan]"
					else
						src.name="([src.rank])[src.name] [src.clan]"

				spawn(rand(10,20))
					if(src)
						src.spawnloc=src.loc
			Del()
				src.myreplacement()
				sleep(10)
				..()
		Rouge_Ninja6
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			health = 100
			Mhealth=1000
			level=1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(3,10))
					src.needface()
				spawn(rand(2,8))
					//src.name=pick("Kago","Sal","Maru","Sul","Fei","Bui")
					//src.Generate_A_Name()
					src.name="Masked Ninja"
					src.clan=pick("Uchiha","","Sand","Yamanaka","Nara","Hozuki","Senju","Akimichi","Inuzuka","Hyuuga","Kaguya","Namikaze","")
					spawn(1)
						//var/X=5
						var/list/L = src.jutsus
						src.npcjutsugive()
						if(src.clan=="Uchiha")
							if(prob(90))
								L.Add("crows")
						if(src.clan=="Inuzuka")
							L.Add("Beast Mode")
							L.Add("Man Beast Claws")
							L.Add("Tsuuga")
						if(src.clan=="Kaguya")
							L.Add("bonebullets")
						if(src.clan=="Namikaze")
							L.Add("teleport")
					src.movedelay-=0.5//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
					src.rank="Special Jounin"
					src.combolimit=pick(1,3,2)
					src.level=rand(200,270)//was 1,125
					src.Mhealth=rand(100,250)*(src.level)
					src.Mchakra=rand(20,60)*src.level
					src.chakra=src.Mchakra
					src.expgive=rand(50,70)*src.level
					if(prob(5))
						src.expgive*=rand(3,6.5)
					src.Mtai=rand(2.5,5.5)*src.level
					src.Mnin=rand(2.5,5.5)*(src.level*2.5)
					src.Mgen=rand(2.5,5.5)*(src.level*2.5)
					src.tai=src.Mtai
					src.nin=src.Mnin
					src.gen=src.Mgen
					src.health=src.Mhealth
					//src.clan=pick("Uchiha","","","Yamanaka","Nara",)
					//src.name="([src.rank])[src.name] [src.clan]"

				spawn(rand(10,20))
					if(src)
						src.spawnloc=src.loc
			Del()
				src.myreplacement()
				sleep(10)
				..()
		Rouge_Ninja7
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			health = 100
			Mhealth=1000
			level=1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(3,10))
					src.needface()
				spawn(rand(2,8))
					//src.name=pick("Kago","Sal","Maru","Sul","Fei","Bui")
					//src.Generate_A_Name()
					src.name="Boss Ninja"
					src.clan=pick("Uchiha","","Sand","Yamanaka","Nara","Hozuki","Senju","Akimichi","Inuzuka","Hyuuga","Kaguya","Namikaze","")
					spawn(1)
						//var/X=5
						var/list/L = src.jutsus
						src.npcjutsugive()
						if(src.clan=="Uchiha")
							if(prob(90))
								L.Add("crows")
						if(src.clan=="Inuzuka")
							L.Add("Beast Mode")
							L.Add("Man Beast Claws")
							L.Add("Tsuuga")
						if(src.clan=="Kaguya")
							L.Add("bonebullets")
						if(src.clan=="Namikaze")
							L.Add("teleport")
					src.movedelay-=0.8//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
					src.rank="Jounin"
					src.combolimit=3
					src.level=rand(300,350)//was 1,125
					src.Mhealth=rand(200,350)*(src.level)
					src.Mchakra=rand(25,90)*src.level
					src.chakra=src.Mchakra
					src.expgive=rand(100,140)*src.level
					if(prob(7))
						src.expgive*=rand(3,6.5)
					src.Mtai=rand(2.5,5.5)*src.level
					src.Mnin=rand(2.5,5.5)*(src.level*3.5)
					src.Mgen=rand(2.5,5.5)*(src.level*3.5)
					src.tai=src.Mtai
					src.nin=src.Mnin
					src.gen=src.Mgen
					src.health=src.Mhealth
					//src.clan=pick("Uchiha","","","Yamanaka","Nara",)
					//src.name="([src.rank])[src.name] [src.clan]"

				spawn(rand(10,20))
					if(src)
						src.spawnloc=src.loc
			Del()
				src.myreplacement()
				sleep(10)
				..()
		Six_Paths
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			health = 100
			Mhealth=1000
			level=1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(1,3))
					src.name="Pain"
					if(prob(25))
						src.deva=1
					else if(prob(25))
						src.naraka=1
					else if(prob(25))
						src.preta=1
					else if(prob(25))
						src.asura=1
					else if(prob(25))
						src.humanp=1
					else
						src.animalp=1
					src.yen=rand(543,8765)
					var/X=5
					var/list/L = src.jutsus
					L.Add("Chakra Rod")
					spawn(1)
						while(X)
							L.Add(pick("clone","kawarimi"))
							X-=1
							sleep(1)
					if(src.deva)
						L.Add("push")
						L.Add("pull")
						src.path="Deva"
						src.movedelay-=0.45
						src.combolimit=3
					if(src.naraka)
						L.Add("judgement")
						//L.Add("pull")
						src.movedelay+=0.20
						src.path="Naraka"
						src.combolimit=2
					if(src.preta)
						L.Add("absorb")
						//L.Add("pull")
						src.movedelay-=0.05
						src.path="Preta"
						src.combolimit=2
					if(src.animalp)
						L.Add("summon")
						//L.Add("pull")
						src.path="Animal"
						src.combolimit=1
					if(src.humanp)
						L.Add("soul strike")
						//L.Add("pull")
						src.path="Human"
						src.combolimit=3
						src.movedelay-=0.30
					if(src.asura)
						L.Add("missle")
						L.Add("missles")
						src.path="Asura"
						src.movedelay+=0.30
						src.combolimit=3
					//src.movedelay+=0.35//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
					//src.combolimit=pick(3,2)
					src.level=rand(220,260)//was 1,125
					src.Mhealth=rand(150,200)*(src.level)
					src.expgive=rand(40,80)*src.level
					src.Mtai=rand(2,3)*(src.level*3)
					src.Mnin=rand(2,2.5)*(src.level*3)
					src.Mgen=rand(1.5,2.5)*(src.level*3)
					src.tai=src.Mtai
					src.nin=src.Mnin
					src.gen=src.Mgen
					src.health=src.Mhealth
					src.name="[src.name]([src.path])([src.level])"

				spawn(rand(10,20))
					if(src)
						src.spawnloc=src.loc
mob
	enemy
		Start_Finish
			//human = 1
			density=1
			//NPC = 1
			icon='Guy.dmi'
			health = 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
			Mhealth=10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
			level=1
			layer=MOB_LAYER
			New()
				..()
				spawn(rand(1,3))
					src.koamm -= 10000
					src.name="Itachi"
					src.clan="Uchiha"
					var/Base='Guy.dmi'
					Base+=rgb(201,145,100)
					usr.icon=Base
					src.overlays+='MaleEyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays+='pants.dmi'
					src.overlays+='Sleeveless Shirt.dmi'
					src.overlays+='itachiH.dmi'
					src.overlays+='AKAS.dmi'
					spawn(1)
						var/list/L = src.jutsus
						L.Add("kawarimi")
						L.Add("clone")
						L.Add("crows")
						L.Add("finishstart")
						//L.Add("finishstart")
						L.Add("fireball")
						L.Add("tsukuyomi")
					src.movedelay-=0.18//pick(0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5)
					src.combolimit=3
					//src.level=rand(1,10)//was 1,125
					//src.Mhealth=rand(100,250)*(src.level)
					src.expgive=500
					src.Mtai=0.0001
					src.Mnin=0.0001
					src.Mgen=8000
					src.tai=src.Mtai
					src.nin=src.Mnin
					src.gen=src.Mgen
					src.health=src.Mhealth
					//src.clan=pick("Uchiha","","","Yamanaka","Nara",)
					src.name="[src.name] [src.clan]"

				spawn(rand(10,20))
					if(src)
						src.spawnloc=src.loc
