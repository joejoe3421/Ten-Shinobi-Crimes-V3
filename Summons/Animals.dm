mob/clam
	name="Clam"
	icon='NA.dmi'
	icon_state=""
	density=1
	Frozen=1
	health=100
	layer=MOB_LAYER+0.001
	//pixel_y = -12
	//pixel_x = -32
	New()
		..()
		spawn(1)
			while(src)
				src.pixel_y = rand(-132,132)
				src.pixel_x = rand(-132,132)
				sleep(rand(100,250))
		spawn(rand(5000,6000))//8-10 minutes
			if(src)
				del src

///owner cant die if clam is alive
//owner only ko's and gets back up
//cooldown 800 seconds





