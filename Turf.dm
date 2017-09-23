turf
	density=1
turf
	Floor
		density=0
		grass
			icon='grass.dmi'
		WoodFloor
			density=0
			icon='turfs.dmi'
			icon_state="rawr10"
		TileFloor
			density=0
			icon='turfs.dmi'
			icon_state="rawr11"


turf/start1
	//icon = 'Turf.dmi'
	density = 0

turf/start2
	//icon = 'Turf.dmi'
	density = 0

turf/start3
	//icon = 'Turf.dmi'
	density = 0

var
	tmp
		leafalert=0
		sandalert=0
	leafhasalert=0
	sandhasalert=0

turf
	leafenter
		density = 0
		Entered(mob/O)
			if(istype(O,/mob) && O.client)
				if(O.village!="Leaf")
					if(leafalert==0&&leafhasalert)
						spawn(1)
							for(var/mob/M in world)
								if(M.village=="Leaf")
									M<<"<font size=2><font color=red><B>Village News: An intruder has entered the village!"

						leafalert=1
						spawn(6000)
							leafalert=0


	sandenter
		density = 0
		Entered(mob/O)
			if(istype(O,/mob) && O.client)
				if(O.village!="Sand")
					if(sandalert==0&&sandhasalert)
						spawn(1)
							for(var/mob/M in world)
								if(M.village=="Sand")
									M<<"<font size=2><font color=red><B>Village News: An intruder has entered the village!"
						sandalert=1
						spawn(6000)
							sandalert=0


////////////////////////////////////
////////////
///////////////////////

turf
	MapWarps
		density=0
		var/LevelTo
		Entered(mob/M)
			if(istype(M,/mob) && M.client)
				//var/counts=0
				var/check=0
				if(M)
					check=1
				if(check)
					/*f(M.x==world.maxx&&dir==SOUTH)
						M.x=world.maxx
						M.z=LevelTo
						counts++*/
					if(M.x==1&&M.dir==WEST)
						M.x=world.maxx
						M.z=LevelTo
						//counts++
					if(M.x==world.maxx&&M.dir==EAST)
						M.x=1
						M.z=LevelTo
						//counts++
					/*if(M.x==world.maxx&&M.dir==NORTH)
						M.x=1
						M.z=LevelTo
						counts++*/
					if(M.y==1&&M.dir==SOUTH)
						M.y=world.maxy
						M.z=LevelTo
						//counts++
					/*if(M.y==1&&M.dir==NORTH)
						M.y=1
						M.z=LevelTo
						counts++*/
					/*if(M.y==world.maxy&&M.dir==SOUTH)
						M.y=world.maxy
						M.z=LevelTo
						counts++*/
					if(M.y==world.maxy&&M.dir==NORTH)
						M.y=1
						M.z=LevelTo
						//counts++






/////////////////////
//////////////////////////////////
/////////////////






















turf
	Tree
		icon = 'Turf.dmi'
		Tree1
			layer = MOB_LAYER+1
			icon_state = "1"
		Tree2
			layer = MOB_LAYER+1
			icon_state = "2"
		Tree3
			layer = MOB_LAYER+1
			icon_state = "3"
		Tree4
			layer = MOB_LAYER+1
			icon_state = "4"
		Tree5
			layer = MOB_LAYER+1
			icon_state = "5"
		Tree6
			layer = MOB_LAYER+1
			icon_state = "6"
		Tree7
			layer = MOB_LAYER+1
			icon_state = "7"
		Tree8
			layer = MOB_LAYER+1
			icon_state = "8"
		Tree9
			layer = MOB_LAYER+1
			icon_state = "9"
		Tree10
			layer = MOB_LAYER+1
			icon_state = "10"
		Tree11
			layer = MOB_LAYER+1
			icon_state = "11"
		Tree12
			layer = MOB_LAYER+1
			icon_state = "12"
		Tree13
			density = 1
			opacity=1
			icon_state = "13"
		Tree14
			density = 1
			opacity=1
			icon_state = "14"

obj/scenery
	density = 0
	icon = 'Turf.dmi'
	Bed
		icon_state = "bed"
		verb
			Sleep()
				set category = null
				set src in view(0)
				usr.Frozen=1
				usr.icon_state = "rest"
				usr << output("You lay down in the bed and begin to rest your wounds..","output1")
				//spawn() usr.HPRecover()
				//spawn() usr.Restrecover()
	Bedcover
		icon_state = "bedcover"
		layer = MOB_LAYER+1
	Target
		icon_state = "Target"
		density = 1
	Cave
		icon_state = "cave"
	Desk
		icon_state = "desk"
		density = 1
	chairs
		icon_state = "chairs"
	Leaf
		icon_state = "Leaf"
	Mist
		icon_state = "Mist"
	Suna
		icon_state = "Suna"
	Sound
		icon_state = "Sound"
	window
		icon_state = "window"
		opacity=0
	window2
		icon_state = "window2"
		opacity=0
	barber
		icon_state = "barber"
	Weapons
		icon_state = "Weapons"
	flowershop
		icon_state = "flowershop"
	bookstore
		icon_state = "bookstore"
	sheet
		icon_state = "sheet"
		density = 1
	mirrordesk
		icon_state = "mirrordesk"
		density = 1
	barberchair
		icon_state = "barberchair"
	kunaidisplay
		icon_state = "kunaidisplay"
		density = 1
	scrolls
		icon_state = "scrolls"
		density = 1
	sworddisplay
		icon_state = "sworddisplay"
		density = 1
	books
		icon_state = "books"
		density = 1
	flowerstand
		icon_state = "Flowersstand"
		density = 1
	plate
		icon_state = "plate"
		density = 1
	Clothshop
		icon_state = "ClothsShop"
	rack
		icon_state = "rack"
		density = 1
	Aca1
		icon_state = "Aca1"
	Aca2
		icon_state = "Aca2"
	Gen1
		icon_state = "Gen1"
	Gen2
		icon_state = "Gen2"
	Lanturan
		icon = 'Turf.dmi'
		icon_state = "Lanturan"
		density = 1
		verb
			Light()
				set category = null
				set src in view(1)
				if(icon_state == "Lanturan")
					src.icon_state = "LanturanLit"
				else
					src.icon_state = "Lanturan"
	roomsign
		icon_state = "roomsign"
	Fridge
		icon_state = "Fridge"
		density = 1
	Stove
		icon_state = "Stove"
		density = 1
	table
		icon_state = "table"
		density = 1
	chairnorth
		icon_state = "chairnorth"
		layer = MOB_LAYER+1
	chairsouth
		icon_state = "chairsouth"
	chaireast
		icon_state = "chaireast"
	chairwest
		icon_state = "chairwest"
	hangingpaper
		icon_state = "hangingpaper"
		layer = MOB_LAYER+1
	wire1
		icon_state = "wire1"
		layer = MOB_LAYER+1
	wire2
		icon_state = "wire2"
		layer = MOB_LAYER+1
	wire3
		icon_state = "wire3"
		layer = MOB_LAYER+1
	wire4
		icon_state = "wire4"
		layer = MOB_LAYER+1

turf/walls
	icon = 'Turf.dmi'
	density = 1
	Farmfencee
		icon_state = "Farmfencee"
	Farmfencew
		icon_state = "Farmfencew"
	Farmfencen
		icon_state = "Farmfencen"
	Farmfences
		icon_state = "Farmfences"
	MFence
		icon_state = "MFence"
	MFenceE
		icon_state = "MFenceE"
	MFenceW
		icon_state = "MFenceW"
	WFence
		icon_state = "WFence"
	WFenceE
		icon_state = "WFenceE"
	WFenceW
		icon_state = "WFenceW"
	chuuninwall
		icon_state = "chuuninwall"
	Schoolwall
		icon_state = "SchoolWall"
	Soundwall
		icon_state = "Soundwall"
	Support
		icon_state = "Support"

turf/floors
	icon = 'Turf.dmi'
	density = 0
	floor10
		icon_state = "floor10"
	floor1
		icon_state = "floor1"
	soundfloor
		icon_state = "Soundfloor"
	stonepath
		icon_state = "stonepath"
	stairs
		icon_state = "stairs"
		density = 0
	bridgeeast
		icon_state = "BridgeE"
	bridgenorth
		icon_state = "BridgeN"
	sbridgeeast
		icon_state = "SBridgeE"
	sbridgenorth
		icon_state = "SBridgeN"
	roof
		icon_state = "roof"
	roofover
		icon_state = "roofover"
	tatamifloor
		icon_state = "tatamifloor"
	chuuninfloor
		icon_state = "chuuninfloor"

turf
	Houses
		icon = 'Turf.dmi'
		density = 1
		opacity=1
		RedH1
			icon = 'Turf.dmi'
			icon_state = "RH1"
		RedH2
			icon = 'Turf.dmi'
			icon_state = "RH2"
		RedH3
			icon = 'Turf.dmi'
			icon_state = "RH3"
		RedH4
			icon = 'Turf.dmi'
			icon_state = "RH4"
			opacity=0
		RedH5
			icon = 'Turf.dmi'
			icon_state = "RH5"
			opacity=0
		RedH6
			icon = 'Turf.dmi'
			icon_state = "RH6"
			opacity=0
		BlueH1
			icon = 'Turf.dmi'
			icon_state = "H1"
		BlueH2
			icon = 'Turf.dmi'
			icon_state = "H2"
		BlueH3
			icon = 'Turf.dmi'
			icon_state = "H3"
		BlueH4
			icon = 'Turf.dmi'
			icon_state = "H4"
			opacity=0
		BlueH5
			icon = 'Turf.dmi'
			icon_state = "H5"
			opacity=0
		BlueH6
			icon = 'Turf.dmi'
			icon_state = "H6"
			opacity=0
		BlueH7
			icon = 'Turf.dmi'
			icon_state = "H7"
		BlueH8
			icon = 'Turf.dmi'
			icon_state = "H8"
		BlueH9
			icon = 'Turf.dmi'
			icon_state = "H9"
		GreenH1
			icon = 'Turf.dmi'
			icon_state = "GH1"
		GreenH2
			icon = 'Turf.dmi'
			icon_state = "GH2"
		GreenH3
			icon = 'Turf.dmi'
			icon_state = "GH3"
		GreenH4
			icon = 'Turf.dmi'
			icon_state = "GH4"
			opacity=0
		GreenH5
			icon = 'Turf.dmi'
			icon_state = "GH5"
			opacity=0
		GreenH6
			icon = 'Turf.dmi'
			icon_state = "GH6"
			opacity=0
		InnerWall
			icon = 'Turf.dmi'
			icon_state = "H7"
		InnerWall2
			icon = 'Turf.dmi'
			icon_state = "H8"
		InnerWall3
			icon = 'Turf.dmi'
			icon_state = "H9"
		Sand1
			icon = 'Turf.dmi'
			icon_state = "S1"
			density = 1
		Sand2
			icon = 'Turf.dmi'
			icon_state = "S2"
			density = 1
		Sand3
			icon = 'Turf.dmi'
			icon_state = "S3"
			density = 1
		Sand4
			icon = 'Turf.dmi'
			icon_state = "S4"
			density = 1
			opacity=0
		Sand5
			icon = 'Turf.dmi'
			icon_state = "S5"
			density = 1
			opacity=0
		Sand6
			icon = 'Turf.dmi'
			icon_state = "S6"
			density = 1
			opacity=0
		Sand7
			icon = 'Turf.dmi'
			icon_state = "S7"
			density = 1
		Sand8
			icon = 'Turf.dmi'
			icon_state = "S8"
			density = 1
		Sand9
			icon = 'Turf.dmi'
			icon_state = "S9"
			density = 1

turf/konohawall
	icon = 'Turf.dmi'
	density = 1
	KonohaW1
		icon_state = "KonohaW1"
	KonohaW2
		icon_state = "KonohaW2"
	KonohaS1
		icon_state = "KonohaS1"
	KonohaS2
		icon_state = "KonohaS2"

turf/path
	icon = 'Turf.dmi'
	density = 0
	path
		icon_state = "path"
	pathne
		icon_state = "pathne"
	pathnw
		icon_state = "pathnw"
	pathsw
		icon_state = "pathsw"
	pathse
		icon_state = "pathse"


turf
	Lands
		icon='Turf.dmi'
		density=0
		layer=1
		g1
			icon_state="Grass"
		gate
			icon_state="shrinearch"