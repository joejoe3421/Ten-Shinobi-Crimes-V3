
turf/Buildings/Infastructure
	icon='HakumeiGetsu.dmi'
	Wall1
		icon_state = "wallSW"
	Wall2
		icon_state = "wallS"
	Wall3
		icon_state = "wallSE"
	Wall4
		icon_state = "wallUPW"
	Wall5
		icon_state = "wallUP"
	Wall6
		icon_state = "wallUPE"
	EarthWall
		icon_state="EarthWall"
	TopWalls
		TopWall1
			icon_state="roof"
		TopWall2
			icon_state="roof2"
		TopWall3
			icon_state="roof3"
		TopWall4
			icon_state="roof4"
		TopWall5
			icon_state="roof5"
		TopWall6
			icon_state="roof6"
		TopWall7
			icon_state="roof7"
		TopWall8
			icon_state="roof8"
		TopWall9
			icon_state="roof9"
		TopWall10
			icon_state="roof10"
		TopWall11
			icon_state="roof11"
		TopWall12
			icon_state="roof12"
		TopWall13
			icon_state="roof13"

turf
	var
		village=""
turf/Buildings/Furnature
	icon = 'Housestuffz.dmi'
	Throne
		icon_state = "throne"
		density=0
	Bed
		House1
			name="Bed"
			icon_state="1"
			layer=3
			density=0
			verb
				Rest()
					//if(usr.Mogu)
						//return
					if(usr.resting)
						usr.resting=0
						usr<<"You stop resting."
						//usr.Frozen=0
						sleep(50)
						usr.CanRest=1
						return
					if(!usr.CanRest)
						return
					else
						usr.CanRest=0
					if(usr.moving==1||usr.kaiten==1||usr.ko>=1||usr.gates>=1)
						usr<<"You're body is under too much strain to rest right now!";return
					else
						usr.resting=1
						usr<<"You lay down in the bed."
						//usr.Frozen=1
						while(usr&&usr.resting)
							if(usr.health<usr.Mhealth)
								usr.health+=(usr.Mhealth/35)
							if(usr.koamm>0)
								usr.koamm-=0.60
								if(usr.koamm<0)
									usr.koamm=0
							if(usr.chakra<usr.Mchakra)
								usr.chakra+=(usr.Mchakra/170)
							if(usr.chakrapool<usr.chakrapoolmax)
								usr.chakrapool+=(usr.chakrapoolmax/85)
							sleep(10)
						if(usr)
							usr<<"You're fully relaxed."
							usr.resting=0
							//usr.Frozen=0
						return
			BedCovers
				name="Bed Covers"
				icon_state="1Cover"
				layer=MOB_LAYER+1
				density=0
	Chairs
		density=0
		House14
			icon_state = "14"
		House15
			icon_state = "15"
		House16
			icon_state = "16"
		House17
			icon_state = "17"
			layer=MOB_LAYER+1
		House18
			icon_state = "18"
		verb/Rest()
			if(usr.resting)
				usr.resting=0
				usr<<"You stop resting."
				//usr.Frozen=0
				sleep(50)
				usr.CanRest=1
				return
			if(!usr.CanRest)
				return
			else
				usr.CanRest=0
			if(usr.moving==1||usr.kaiten==1||usr.ko>=1||usr.gates>=1)
				usr<<"You're body is under too much strain to rest right now!";return
			else
				usr.resting=1
				usr<<"You sit and relax."
				//usr.Frozen=1
				while(usr&&usr.resting)
					if(usr.health<usr.Mhealth)
						usr.health+=(usr.Mhealth/70)
					if(usr.koamm>0)
						usr.koamm-=0.60
						if(usr.koamm<0)
							usr.koamm=0
					if(usr.chakra<usr.Mchakra)
						usr.chakra+=(usr.Mchakra/300)
					if(usr.chakrapool<usr.chakrapoolmax)
						usr.chakrapool+=(usr.chakrapoolmax/260)
					sleep(10)
				if(usr)
					usr<<"You're fully relaxed."
					usr.resting=0
					//usr.Frozen=0
				return

	BookCase
		Bookcase1
			icon_state="BookCase1"
		Bookcase2
			icon_state="BookCase2"
			layer=MOB_LAYER+1
		Bookcase3
			icon_state="BookCase3"
			layer=MOB_LAYER+1
		Bookcase4
			icon_state="BookCase4"
		Bookcase5
			icon_state="BookCase5"
			layer=MOB_LAYER+1
		Bookcase6
			icon_state="BookCase6"
			layer=MOB_LAYER+1
		Books1
			icon_state="book1"
			layer=MOB_LAYER+1
		Books4
			icon_state="book4"
			layer=MOB_LAYER+1
		Books2
			icon_state="book2"
			layer=MOB_LAYER+1
		Books3
			icon_state="book3"
			layer=MOB_LAYER+1
	Appliances
		Oven
			icon_state = "Oven"
			density = 1
	House2
		icon_state = "2"
		density = 1
	House7
		icon_state = "7"
		density = 1
	Shelf1
		icon_state="30"
		density = 1
	Shelf2
		icon_state="31"
		density = 1
	Shelf3
		icon_state="32"
	Shelf4
		icon_state="33"
	Shelf5
		layer=MOB_LAYER+1
		icon_state="34"
	Shelf6
		layer=MOB_LAYER+1
		icon_state="35"
	Shelf7
		layer=MOB_LAYER+1
		icon_state="36"
	Shelf8
		icon_state="37"
		density = 1
	/*Chart1
		icon_state="chart1"
		icon='Chart.dmi'
		density = 1
	Chart1
		icon_state="chart2"
		icon='Chart.dmi'*/
		density = 1
turf/Buildings/ShopStuff
	icon = 'Scenary.dmi'
	ScrollsObj
		icon_state="scrolls"
		density=1
	TunicObj
		icon_state="Tunic"
		density=1
	Jar
		icon_state="jar"
		density=1
	ShurikenThing
		icon_state="Shuriken for sell"
		density=1
	KunaiThing
		icon_state="kunai for sell"
		density=1
	BigShurikenThing
		icon_state="big shuriken for sell 1"
		density=1
	BigShurikenThing2
		icon_state="big shuriken for sell 2"
		density=1
	SwordShelf1
		icon_state="swordshelf1"
		density=1
	SwordShelf2
		icon_state="swordshelf2"
		density=1
	SwordShelf3
		icon_state="swordshelf3"
		layer=MOB_LAYER+1
	SwordShelf4
		icon_state="swordshelf4"
		layer=MOB_LAYER+1
	ArrowRacks1
		icon_state="arrow racks 1"
		density=1
	ArrowRacks2
		icon_state="arrow racks 2"














turf/Buildings/House1/Roof
	layer=MOB_LAYER+2
	NewRoof
		icon = 'House 5 base 2.dmi'
		Part1 icon_state="0,0"
		Part2 icon_state="0,1"
		Part3 icon_state="0,2"
		Part4 icon_state="1,0"
		Part5 icon_state="1,1"
		Part6 icon_state="1,2"
		Part7 icon_state="2,0"
		Part8 icon_state="2,1"
		Part9 icon_state="2,2"
	Part1
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof Top Left side"
		pixel_x = -32;pixel_y = 32
	Part2
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof middle Left side"
		pixel_x = -32//;pixel_y = -32
	Part3
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof Bottom Left side"
		pixel_x = -32;pixel_y = -32
	Part4
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof Top right side"
		pixel_x = 32;pixel_y = 32
	Part5
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof middle right side"
		pixel_x = 32//;pixel_y = -32
	Part6
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof Bottom right side"
		pixel_x = 32;pixel_y = -32
	Part7//
		icon = 'House 5 base 2.dmi'
		icon_state = "Bottom 1"
		pixel_y = -32
		layer=MOB_LAYER+2.1
		New()
			..()
			spawn(1)
				src.icon_state=pick("Bottom 1","Bottom 2","Bottom 3","Bottom 4")
	Part8
		icon = 'House 5 base 2.dmi'
		icon_state = "Bottom 2"
	Part9
		icon = 'House 5 base 2.dmi'
		icon_state = "Bottom 3"
	Part10
		icon = 'House 5 base 2.dmi'
		icon_state = "Bottom 4"
	Part11//
		icon = 'House 5 base 2.dmi'
		icon_state = "Top 1"
		pixel_y = 32
		layer=MOB_LAYER+2.1
		New()
			..()
			spawn(1)
				src.icon_state=pick("Top 1","Top 2","Top 3","Top 4")
	Part12
		icon = 'House 5 base 2.dmi'
		icon_state = "Top 2"
	Part13
		icon = 'House 5 base 2.dmi'
		icon_state = "Top 3"
	Part14
		icon = 'House 5 base 2.dmi'
		icon_state = "Top 4"
	Part15edit
		icon = 'House 5 base 2.dmi'
		icon_state = "Middle 1"//pick("Middle 1","Middle 2","Middle 3","Middle 4")
		density=1
		layer=MOB_LAYER+2.2
		New()
			..()
			spawn(1)
				src.icon_state = pick("Middle 1","Middle 2","Middle 3","Middle 4")
				src.overlays+=/turf/Buildings/House1/Roof/Part1
				src.overlays+=/turf/Buildings/House1/Roof/Part2
				src.overlays+=/turf/Buildings/House1/Roof/Part3
				src.overlays+=/turf/Buildings/House1/Roof/Part4
				src.overlays+=/turf/Buildings/House1/Roof/Part5
				src.overlays+=/turf/Buildings/House1/Roof/Part6
				src.overlays+=/turf/Buildings/House1/Roof/Part7
				src.overlays+=/turf/Buildings/House1/Roof/Part11
	Part19
		icon = 'House 5 base 2.dmi'
		icon_state = "Miz1"
		density=1
		New()
			..()
			spawn(1)
				src.icon_state=pick("Miz1","Miz2")
	Part21
		icon = 'House 5 base 2.dmi'
		icon_state = "Edge1"
		layer=MOB_LAYER+1
	Part22
		icon = 'House 5 base 2.dmi'
		icon_state = "Edge2"
		layer=MOB_LAYER+1
	Part23
		icon = 'House 5 base 2.dmi'
		icon_state = "Edge3"
		layer=MOB_LAYER+1



turf/Buildings/House2/Roof
	layer=MOB_LAYER+2
	NewRoof
		icon = 'House5Roof.dmi'
		Part1 icon_state="0,0"
		Part2 icon_state="0,1"
		Part3 icon_state="0,2"
		Part4 icon_state="1,0"
		Part5 icon_state="1,1"
		Part6 icon_state="1,2"
		Part7 icon_state="2,0"
		Part8 icon_state="2,1"
		Part9 icon_state="2,2"
	Part1
		icon = 'House5Roof.dmi'
		icon_state = "Roof Top Left side"
		pixel_x = -32;pixel_y = 32
	Part2
		icon = 'House5Roof.dmi'
		icon_state = "Roof middle Left side"
		pixel_x = -32//;pixel_y = -32
	Part3
		icon = 'House5Roof.dmi'
		icon_state = "Roof Bottom Left side"
		pixel_x = -32;pixel_y = -32
	Part4
		icon = 'House5Roof.dmi'
		icon_state = "Roof Top right side"
		pixel_x = 32;pixel_y = 32
	Part5
		icon = 'House5Roof.dmi'
		icon_state = "Roof middle right side"
		pixel_x = 32//;pixel_y = -32
	Part6
		icon = 'House5Roof.dmi'
		icon_state = "Roof Bottom right side"
		pixel_x = 32;pixel_y = -32
	Part7//
		icon = 'House5Roof.dmi'
		icon_state = "Bottom 1"
		pixel_y = -32
		layer=MOB_LAYER+2.1
		New()
			..()
			spawn(1)
				src.icon_state=pick("Bottom 1","Bottom 2","Bottom 3","Bottom 4")
	Part8
		icon = 'House5Roof.dmi'
		icon_state = "Bottom 2"
	Part9
		icon = 'House5Roof.dmi'
		icon_state = "Bottom 3"
	Part10
		icon = 'House5Roof.dmi'
		icon_state = "Bottom 4"
	Part11//
		icon = 'House5Roof.dmi'
		icon_state = "Top 1"
		pixel_y = 32
		layer=MOB_LAYER+2.1
		New()
			..()
			spawn(1)
				src.icon_state=pick("Top 1","Top 2","Top 3","Top 4")
	Part12
		icon = 'House5Roof.dmi'
		icon_state = "Top 2"
	Part13
		icon = 'House5Roof.dmi'
		icon_state = "Top 3"
	Part14
		icon = 'House5Roof.dmi'
		icon_state = "Top 4"
	Part15edit
		icon = 'House5Roof.dmi'
		icon_state = "Middle 1"//pick("Middle 1","Middle 2","Middle 3","Middle 4")
		density=1
		opacity=1
		layer=MOB_LAYER+2.2
		New()
			..()
			spawn(2)
				src.icon_state = pick("Middle 1","Middle 2","Middle 3","Middle 4")
				src.overlays+=/turf/Buildings/House2/Roof/Part1
				src.overlays+=/turf/Buildings/House2/Roof/Part2
				src.overlays+=/turf/Buildings/House2/Roof/Part3
				src.overlays+=/turf/Buildings/House2/Roof/Part4
				src.overlays+=/turf/Buildings/House2/Roof/Part5
				src.overlays+=/turf/Buildings/House2/Roof/Part6
				src.overlays+=/turf/Buildings/House2/Roof/Part7
				src.overlays+=/turf/Buildings/House2/Roof/Part11
	Part19
		icon = 'House5Roof.dmi'
		icon_state = "Miz1"
		density=1
		opacity=1
		layer=MOB_LAYER+2.2
		New()
			..()
			spawn(3)
				src.icon_state=pick("Miz1","Miz2")
				src.overlays+=/turf/Buildings/House2/Roof/Part1
				src.overlays+=/turf/Buildings/House2/Roof/Part2
				src.overlays+=/turf/Buildings/House2/Roof/Part3
				src.overlays+=/turf/Buildings/House2/Roof/Part4
				src.overlays+=/turf/Buildings/House2/Roof/Part5
				src.overlays+=/turf/Buildings/House2/Roof/Part6
				src.overlays+=/turf/Buildings/House2/Roof/Part7
				src.overlays+=/turf/Buildings/House2/Roof/Part11
	Part21
		icon = 'House5Roof.dmi'
		icon_state = "Edge1"
		layer=MOB_LAYER+1
	Part22
		icon = 'House5Roof.dmi'
		icon_state = "Edge2"
		layer=MOB_LAYER+1
	Part23
		icon = 'House5Roof.dmi'
		icon_state = "Edge3"
		layer=MOB_LAYER+1