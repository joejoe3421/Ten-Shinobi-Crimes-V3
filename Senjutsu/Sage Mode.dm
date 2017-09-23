mob
	var
		tmp/sagemode=0
		sagetype="None"
		nenergy=0
		Mnenergy=100
		sagemastery=3
		sagecharge=0
		tmp/sagepower=0
		fullsageboost=0.10 // 0.10 means that person'a ninjuts plus 10%, each animal type has different boosts, (maybe in different things?)
		sageenergyuse = 0.50 //by default 50%. 90% max. 1% least






obj
	skill
		sagecharge
			verb
				sagecharge()
					set category = "Skills"
					set name = "Gather Energy"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+50
					if(usr.handseal(0,0))
						if(usr.sagecharge)
							usr<<"You no longer gather nature energy by meditating via X and Z."
							usr.sagecharge=0
						else
							usr<<"Holding X then Z will now gather Natural energy."
							usr.sagecharge=1
		sagemode
			verb
				sagecharge2()
					set category = "Skills"
					set name = "Sage Mode"
					if(usr.sagemode)
						usr<<"You exit Sage Mode."
						usr.sagemode=0
						return
					if(usr.nenergy<=0)
						usr<<"You need more Natural energy to go into sage mode."
						return
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+1100
					if(usr.handseal(0,1))
						//usr<<"You meditate for Sage Mode."
						var/time=round(101-usr.sagemastery)
						if(time>50)
							usr<<"You meditate for Sage Mode.([time])"
						else
							usr<<"You meditate for Sage Mode"
						usr.icon_state="rest"
						var/poweradd = ((((usr.sagemastery+101)/2)*usr.fullsageboost)*0.01)/time
						var/leastneeded = ((((usr.sagemastery+101)/2)*usr.fullsageboost)*0.01)*0.5
						while(usr.icon_state=="rest"&&time>0&&usr.sagemode==0)
							time-=1
							usr.sagepower+=poweradd
							sleep(10)
						if(usr.sagepower>=leastneeded&&usr.sagemode==0)
							usr.sagemode=1
							if(usr)//.sagepower<leastneeded*2)
								if(prob(usr.sagemastery))
									usr<<"You enter Perfect [usr.sagetype] Sage Mode!"
								else
									usr<<"You enter Imperfect [usr.sagetype] Sage Mode!"
									usr.sagepower= usr.sagepower*0.5
								usr.icon_state=""
								oview(usr)<<"<b><font color=red>[usr]: Sage Mode!"
							spawn(10)
								if(usr.sagemastery<35)
									usr.sagemastery+=1
								while(usr.sagemode)
									usr.nenergy-=1
									if(usr.sagemastery<100)
										if(prob(1))
											usr.sagemastery+=pick(0.1,0.2,0.3,0.4,0.5,0.4,0.3,0.2,0.1)
									if(usr.Mnenergy<500)
										if(prob(2))
											usr.Mnenergy+=pick(3,4,5,4,3,2,4,6,4,2,3)
									if(usr.Mnenergy>=500&&usr.Mnenergy<=10000)
										if(prob(2))
											usr.Mnenergy+=pick(1,2,1)
									if(usr.nenergy<=0)
										usr.sagemode=0
										usr<<"Due to your lack of natural energy you slip out of Sage Mode."
									sleep(5+(usr.sagemastery*0.10))
								usr.sagemode=0
								usr.sagepower=0
						else
							usr.sagepower=0
							usr<<"You failed to enter sage mode."