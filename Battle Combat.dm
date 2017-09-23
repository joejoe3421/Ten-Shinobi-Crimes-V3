mob
	var
		tmp/combo=0//as in the combo number
		combolimit=2
		attackdelay=4
		tmp/canattack=1
		tmp/guard=0



mob
	verb
		Attack()// make a macro later
			set category = "Skills"
			set name = "Attack"
			set hidden = 1
			//if(src.gates>=4&&src.combo>=2)
				//src.combo=0
			if(src.canattack==0||src.bind>0)
				return
			if(src.ko||src.absorbing)
				return
			if(src.combo>=src.combolimit)
				return
			if(src.target&&src.target in view(src))
				//src.dir=get_dir(src,src.target)
				if(src.gates>=4)
					if(src.health>=src.Mhealth*0.05)
						flick("zan",src);var/mob/M=src.target
						if(M.z==src.z)
							var/movgo=list()
							var/many=0
							for(var/turf/T in oview(1,M))
								if(T.density==0)
									movgo+=T
									many+=1
							if(many<=0)

							else
								src.loc=pick(movgo)
							/*var/Z=rand(1,4)
							if(Z==1)
								src.loc=locate(M.x,M.y-1,M.z)
							if(Z==2)
								src.loc=locate(M.x,M.y+1,M.z)
							if(Z==3)
								src.loc=locate(M.x-1,M.y,M.z)
							if(Z==4)
								src.loc=locate(M.x+1,M.y,M.z)*/
				src.dir=get_dir(src,src.target)
			if(src.combo==0)
				//src<<"Combo start"
				spawn(1.5)
					//src<<"Counter began"
					while(src.combo)
						var/combonumber=src.combo
						sleep(5)
						if(src.combo==combonumber)
							//src<<"combonumber = [combonumber], combo = [src.combo]"
							src.combo=0
							//src<<"Counter reset"
			src.combo+=1
			src.canattack=0
			var/timeminus=(usr.gates*0.25)+(bya*0.2)
			var/attacktime=src.attackdelay-timeminus
			if(attacktime<0.10)
				attacktime=0.1
			spawn(attacktime)
				src.canattack=1
				if(src.attackdelay>0.1)
					if(prob(3))
						src.attackdelay-=0.01
			//src<<"Combo +1([src.combo])"
			if(src.weapon=="")
				if(src.combo==1)
					if(src.clan=="Sand")
						var/obj/SAND = new/obj
						SAND.loc = src.loc
						SAND.layer = src.layer+1
						SAND.dir = src.dir
						//SAND.pixel_x=-16
						flick('Sand Attack 1.dmi',SAND)
					else if(src.bya||src.chakraS)
						flick("jyuken",src)
					else
						flick("Attack1",src)
				if(src.combo==2)
					if(src.clan=="Sand")
						var/obj/SAND = new/obj
						SAND.loc = src.loc
						SAND.layer = src.layer-1
						SAND.dir = src.dir
						//SAND.pixel_x=-16
						flick('Sand Attack 2.dmi',SAND)
					else
						if(src.bya||src.chakraS)
							flick("jyuken",src)
						else
							flick("Attack2",src)
				if(src.combo==3)
					flick("Attack",src)
			else
				flick("weaponslash",src)
			if(prob(40))
				spawn() src.voice("a")
			for(var/mob/M in get_step(src,src.dir))
				var/dodging=M.dodgerate*(10-((M.tai/150)-(src.tai/150)))
				if(dodging<0)
					dodging=0
				if(dodging>99)
					dodging=99
				if(prob(dodging))
					flick("zan",M)
					if(M.dodgerate<9)
						if(prob(3))
							M.dodgerate+=pick(0.02,0.04,0.02)
				else
					//if(M.ko==0)
						//M.dir=get_dir(M,src)
					if(src.weapon=="")
						if(src.style=="Jyuken")
							src.strikeblow2(M,src.tai*rand(0.9,1.1))
						else if(src.gates>=3)
							src.gatestrike(M,src.tai*rand(0.9,1.2))
							spawn(1)
								src.taiincrease(2)
						else if(src.manbeastclaws)
							M.weapondamage(src.tai*rand(0.9,1.2),pick(0,1,0),src)
						else if(src.chakraS)
							if(src.special=="Scalpes")
								M.weapondamage(((src.gen*0.30)+usr.CC)*rand(1.2,1.6),pick(0,1,0),src)
							else
								M.weapondamage(((src.gen*0.30)+usr.CC)*rand(0.9,1.2),pick(0,1,0),src)
						else
							M.taidamage(src.tai*rand(0.9,1.2),0,src,"close")
							spawn(1)
								src.taiincrease(0.1)
							if(src.preta)
								M.chakra-=((src.tai*rand(0.9,1.2))/10)
								src.chakra+=((src.tai*rand(0.9,1.2))/10)*0.25
					else
						M.weapondamage(src.tai*rand(0.9,1.2),pick(0,1,0),src)
				break




















mob/verb
	G()
		set hidden=1
		//src.icon_state="defend"
		if(src.ko==0&&src.doingseals==0)
			src.icon_state="Block"
			src.guard=1
	GRelease()
		set hidden=1
		if(src.ko==0)
			src.icon_state=""
		src.guard=0