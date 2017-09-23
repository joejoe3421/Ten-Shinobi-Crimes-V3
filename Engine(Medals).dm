///world.SetMedal("Dragon slayer", killer)
mob/proc
	AwardMedal(medal)
		spawn(1)
			if("[medal]" in src.medals)
				return
			var/hasmedal=world.GetMedal(medal,src)
			sleep(20)
			if(!hasmedal)
				world.SetMedal(medal,src)
				src<<"<font size=3><font color=yellow>You've attained the [medal] Medal!"
				src.medalnumber+=1
				src.medals+="[medal]"
			else
				src<<"<font size=2><font color=yellow>You've attained the [medal] Medal!"
				src.medalnumber+=1
				src.medals+="[medal]"



mob
	var
		medalnumber=0//use for specific prizes like good stuff
		medals=list()