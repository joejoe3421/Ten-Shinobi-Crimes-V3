
turf/Buildings/
	ByondSymbol
		icon='byondsymbol.dmi'
		layer=MOB_LAYER+10
	ClanSymbol
		icon='ClanSymbol.dmi'
		layer=MOB_LAYER+10
		Leaf
			Aburame icon_state="Aburame"
			Akimichi icon_state="Akimichi"
			Hyuuga icon_state="Hyuuga"
			Inuzuka icon_state="Inuzuka"
		Rock
			Iwazuka icon_state="Iwazuka"
	zDensity
		density=1
		layer = 999
		Enter(A)
			if(isobj(A))
				return 0
			if(ismob(A))
				var/mob/M = A
				if(M.density==0)
					return 1
				else
					return 0
	zAllow
		density=0
		layer = 999
	zAntiNPC
		density=0
		layer=999
		//Enter(A)
		//	if(ismob(A))
		//		var/mob/M=A
		//		if(!M.client&&M.icon=='Wolf.dmi'||M.AOS||M.AWA&&M.target==""||M.AWA&&M.target==null)
		//			return 0
		//		else
turf/Buildings/Rainwalls
	icon='Rainbuildings.dmi'
	Wall1
		icon_state = "rainsw"
	Wall2
		icon_state = "rains"
	Wall3
		icon_state = "rainse"
	Wall4
		icon_state = "rainnw"
	Wall5
		icon_state = "rainn"
	Wall6
		icon_state = "rainne"
	Roofs
		roof1
			icon_state = "m"
		roof2
			icon_state = "m2"
		roof3
			icon_state = "rml"
		roof4
			icon_state = "rmr"
		roof5
			icon_state = "t"
		roof6
			icon_state = "b"
		roof7
			icon_state = "rbr"
		roof8
			icon_state = "rtr"
		roof9
			icon_state = "rtl"
		roof10
			icon_state = "rbl"
	Roof2
		layer=MOB_LAYER+3

		Part1
			icon_state="Roof1"
		Part2
			icon_state="Roof2"
		Part3
			icon_state="Roof3"
		Part4
			icon_state="Roof4"
		Part5
			icon_state="Roof5"
		Part6
			icon_state="Roof6"
		Part7
			icon_state="Roof7"
		Part8
			icon_state="Roof8"
		Part9
			icon_state="Roof9"

	window
		icon_state = "w"
	Floor
		icon_state = "F"
	Floor2
		icon_state = "Tiles"
	Floor3
		icon_state = "Tiles2"
	Door
		icon_state = "Door"
	Stairs
		icon_state = "bridgeup"
		density = 0
	LightingRod
		Lrod1
			icon_state = "lrod1"
		Lrod2
			icon_state = "lrod2"
		Lrod3
			icon_state = "lrod3"
		Lrod4
			icon_state = "lrod4"
	Signs
		sign1
			icon_state = "s1"
		sign2
			icon_state = "s2"
		sign3
			icon_state = "s3"
		sign4
			icon_state = "s4"
	InsideBuildings
		Painting1
			icon_state="paint1"
		Painting2
			icon_state="paint2"
		Painting3
			icon_state="paint3"
		Plant
			icon_state="palm"
		Codeofarms
			icon_state="arms"
		FLoor
			icon_state="wood"
	Pipes
		Pipe1
			icon_state = "pipe"
		Pipe2
			icon_state = "pipe2"
		Pipe3
			icon_state = "Cmid"
		Pipe4
			icon_state = "mid"
		Pipe5
			icon_state = "raa"
		Pipe6
			icon_state = "rs"
		Pipe7
			icon_state = "ls"
		Pipe8
			icon_state = "x"
		Pipe9
			icon_state = "sp"
		Pipe10
			icon_state = "esp"
		Pipe11
			icon_state = "bsp"
		Pipe12
			icon_state = "ph"
		Pipe13
			icon_state = "bs"
		Pipe14
			icon_state = "as"
		Pipe15
			icon_state = "hmid"
		Pipe16
			icon_state = "hcmid"
		Pipe17
			icon_state = "c"
		Pipe18
			icon_state = "end"
		Pipe19
			icon_state = "mu"
		Pipe20
			icon_state = "n"
		Pipe21
			icon_state = "bhh"
		Pipe22
			icon_state = "v"
		Pipe23
			icon_state = "g"
	RainSymbol
		rainsign
			icon_state = "1"
			density=1
		rainsign2
			icon_state = "2"
			density=1
	RainStrip
		Girl1
			icon_state="g1"
		Girl2
			icon_state="g2"
		Girl3
			icon_state="g3"
		Girl4
			icon_state="g4"
		Girl5
			icon_state="g5"


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
turf/Buildings/House2
	icon = 'House 5 base 1.dmi'
	Part1
		icon_state = "1"
		density=1
	Part2
		icon_state = "2"
		density=1
	Part3
		icon_state = "3"
		density=1
	Part4
		icon_state = "4"
		density=1
	Part5
		icon_state = "5"
		density=1
	Part6
		icon_state = "6"
		density=1
	Part7
		icon_state = "7"
		density=1
	Part8
		icon_state = "8"
		density=1
	Part9
		icon_state = "9"
		density=1
	Part10
		icon_state = "10"
		density=1
	Part11
		icon_state = "11"
		density=1
	Part12
		icon_state = "12"
		density=1
turf/Buildings/House1
	Part1
		icon = 'House 5 base 2.dmi'
		icon_state = "1"
		density=1
	Part2
		icon = 'House 5 base 2.dmi'
		icon_state = "2"
		density=1
	Part3
		icon = 'House 5 base 2.dmi'
		icon_state = "3"
		density=1
	Part4
		icon = 'House 5 base 2.dmi'
		icon_state = "4"
		density=1
	Part5
		icon = 'House 5 base 2.dmi'
		icon_state = "5"
		density=1
	Part6
		icon = 'House 5 base 2.dmi'
		icon_state = "6"
		density=1
	Part7
		icon = 'House 5 base 2.dmi'
		icon_state = "7"
		density=1
		layer=MOB_LAYER+2
	Part8
		icon = 'House 5 base 2.dmi'
		icon_state = "8"
		density=1
	Part9
		icon = 'House 5 base 2.dmi'
		icon_state = "9"
		density=1
	Part10
		icon = 'House 5 base 2.dmi'
		icon_state = "10"
		density=1
	Part11
		icon = 'House 5 base 2.dmi'
		icon_state = "11"
		density=1
	Part12
		icon = 'House 5 base 2.dmi'
		icon_state = "12"
		density=1
	Part13
		icon='HouseStuff.dmi'
		icon_state="Left side"
		density=1
	Part14
		icon='HouseStuff.dmi'
		icon_state="Right side"
		density=1
	Part15
		icon='HouseStuff.dmi'
		icon_state="Door opening"
		density=0
	Part16
		icon='HouseStuff.dmi'
		icon_state="Shutters right Bottom"
		density=1
	Part17
		icon='HouseStuff.dmi'
		icon_state="Shutters Right Top"
		density=1
	Part18
		icon='HouseStuff.dmi'
		icon_state="Shutters Left Bottom"
		density=1
	Part19
		icon='HouseStuff.dmi'
		icon_state="Shutters Left Top"
		density=1
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
	Part2
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof middle Left side"
	Part3
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof Bottom Left side"
	Part4
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof Top right side"
	Part5
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof middle right side"
	Part6
		icon = 'House 5 base 2.dmi'
		icon_state = "Roof Bottom right side"
	Part7
		icon = 'House 5 base 2.dmi'
		icon_state = "Bottom 1"
	Part8
		icon = 'House 5 base 2.dmi'
		icon_state = "Bottom 2"
	Part9
		icon = 'House 5 base 2.dmi'
		icon_state = "Bottom 3"
	Part10
		icon = 'House 5 base 2.dmi'
		icon_state = "Bottom 4"
	Part11
		icon = 'House 5 base 2.dmi'
		icon_state = "Top 1"
	Part12
		icon = 'House 5 base 2.dmi'
		icon_state = "Top 2"
	Part13
		icon = 'House 5 base 2.dmi'
		icon_state = "Top 3"
	Part14
		icon = 'House 5 base 2.dmi'
		icon_state = "Top 4"
	Part15
		icon = 'House 5 base 2.dmi'
		icon_state = "Middle 1"
		density=1
	Part16
		icon = 'House 5 base 2.dmi'
		icon_state = "Middle 2"
		density=1
	Part17
		icon = 'House 5 base 2.dmi'
		icon_state = "Middle 3"
		density=1
	Part18
		icon = 'House 5 base 2.dmi'
		icon_state = "Middle 4"
		density=1
	Part19
		icon = 'House 5 base 2.dmi'
		icon_state = "Miz1"
		density=1
	Part20
		icon = 'House 5 base 2.dmi'
		icon_state = "Miz2"
		density=1
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
turf/Buildings/House1/Roof2
	layer=MOB_LAYER+2
	Part1
		icon = 'House5Roof.dmi'
		icon_state = "Roof Top Left side"
	Part2
		icon = 'House5Roof.dmi'
		icon_state = "Roof middle Left side"
	Part3
		icon = 'House5Roof.dmi'
		icon_state = "Roof Bottom Left side"
	Part4
		icon = 'House5Roof.dmi'
		icon_state = "Roof Top right side"
	Part5
		icon = 'House5Roof.dmi'
		icon_state = "Roof middle right side"
	Part6
		icon = 'House5Roof.dmi'
		icon_state = "Roof Bottom right side"
	Part7
		icon = 'House5Roof.dmi'
		icon_state = "Bottom 1"
	Part8
		icon = 'House5Roof.dmi'
		icon_state = "Bottom 2"
	Part9
		icon = 'House5Roof.dmi'
		icon_state = "Bottom 3"
	Part10
		icon = 'House5Roof.dmi'
		icon_state = "Bottom 4"
	Part11
		icon = 'House5Roof.dmi'
		icon_state = "Top 1"
	Part12
		icon = 'House5Roof.dmi'
		icon_state = "Top 2"
	Part13
		icon = 'House5Roof.dmi'
		icon_state = "Top 3"
	Part14
		icon = 'House5Roof.dmi'
		icon_state = "Top 4"
	Part15
		icon = 'House5Roof.dmi'
		icon_state = "Middle 1"
		density=1
	Part16
		icon = 'House5Roof.dmi'
		icon_state = "Middle 2"
		density=1
	Part17
		icon = 'House5Roof.dmi'
		icon_state = "Middle 3"
		density=1
	Part18
		icon = 'House5Roof.dmi'
		icon_state = "Middle 4"
		density=1
	Part19
		icon = 'House5Roof.dmi'
		icon_state = "Miz1"
		density=1
	Part20
		icon = 'House5Roof.dmi'
		icon_state = "Miz2"
		density=1
	Part21
		icon = 'House5Roof.dmi'
		icon_state = "Edge1"
		density=1
	Part22
		icon = 'House5Roof.dmi'
		icon_state = "Edge2"
		density=1
turf/Buildings/House1/Roof3
	layer=MOB_LAYER+2
	Part1
		icon = 'House5Roof2.dmi'
		icon_state = "Roof Top Left side"
	Part2
		icon = 'House5Roof2.dmi'
		icon_state = "Roof middle Left side"
	Part3
		icon = 'House5Roof2.dmi'
		icon_state = "Roof Bottom Left side"
	Part4
		icon = 'House5Roof2.dmi'
		icon_state = "Roof Top right side"
	Part5
		icon = 'House5Roof2.dmi'
		icon_state = "Roof middle right side"
	Part6
		icon = 'House5Roof2.dmi'
		icon_state = "Roof Bottom right side"
	Part7
		icon = 'House5Roof2.dmi'
		icon_state = "Bottom 1"
	Part8
		icon = 'House5Roof2.dmi'
		icon_state = "Bottom 2"
	Part9
		icon = 'House5Roof2.dmi'
		icon_state = "Bottom 3"
	Part10
		icon = 'House5Roof2.dmi'
		icon_state = "Bottom 4"
	Part11
		icon = 'House5Roof2.dmi'
		icon_state = "Top 1"
	Part12
		icon = 'House5Roof2.dmi'
		icon_state = "Top 2"
	Part13
		icon = 'House5Roof2.dmi'
		icon_state = "Top 3"
	Part14
		icon = 'House5Roof2.dmi'
		icon_state = "Top 4"
	Part15
		icon = 'House5Roof2.dmi'
		icon_state = "Middle 1"
		density=1
	Part16
		icon = 'House5Roof2.dmi'
		icon_state = "Middle 2"
		density=1
	Part17
		icon = 'House5Roof2.dmi'
		icon_state = "Middle 3"
		density=1
	Part18
		icon = 'House5Roof2.dmi'
		icon_state = "Middle 4"
		density=1
	Part19
		icon = 'House5Roof2.dmi'
		icon_state = "Miz1"
		density=1
	Part20
		icon = 'House5Roof2.dmi'
		icon_state = "Miz2"
		density=1
	Part21
		icon = 'House5Roof2.dmi'
		icon_state = "Edge1"
		density=1
	Part22
		icon = 'House5Roof2.dmi'
		icon_state = "Edge2"
		density=1
turf/Buildings/House1/Roof4
	layer=MOB_LAYER+2
	icon = 'House5Roof3.dmi'
	Part1
		icon_state = "Roof Top Left side"
	Part2
		icon_state = "Roof middle Left side"
	Part3
		icon_state = "Roof Bottom Left side"
	Part4
		icon_state = "Roof Top right side"
	Part5
		icon_state = "Roof middle right side"
	Part6
		icon_state = "Roof Bottom right side"
	Part7
		icon_state = "Bottom 1"
	Part8
		icon_state = "Bottom 2"
	Part9
		icon_state = "Bottom 3"
	Part10
		icon_state = "Bottom 4"
	Part11
		icon_state = "Top 1"
	Part12
		icon_state = "Top 2"
	Part13
		icon_state = "Top 3"
	Part14
		icon_state = "Top 4"
	Part15
		icon_state = "Middle 1"
		density=1
	Part16
		icon_state = "Middle 2"
		density=1
	Part17
		icon_state = "Middle 3"
		density=1
	Part18
		icon_state = "Middle 4"
		density=1
	Part19
		icon_state = "Miz1"
		density=1
	Part20
		icon_state = "Miz2"
		density=1
	Part21
		icon_state = "Edge1"
		density=1
	Part22
		icon_state = "Edge2"
		density=1
turf/Buildings/Konoha/Fence
	Fence1
		icon='Scenary.dmi'
		icon_state="GateType0"
		layer=MOB_LAYER+1
	Fence2
		icon='Scenary.dmi'
		icon_state="GateType1"
		layer=MOB_LAYER+1
	Fence3
		icon='Scenary.dmi'
		icon_state="GateType2"
		layer=MOB_LAYER+1
	Fence4
		icon='Scenary.dmi'
		icon_state="GateType3"
		layer=MOB_LAYER+1
	Fence5
		icon='Scenary.dmi'
		icon_state="GateType4"
		layer=MOB_LAYER+1
		//beast = 1
		//beast = 1
	Fence6
		icon='Scenary.dmi'
		icon_state="GateType5"
		layer=MOB_LAYER+1
		//gwest = 1
		//geast = 1
	Fence7
		icon='Scenary.dmi'
		icon_state="GateType6"
		layer=MOB_LAYER+1
		density=1
	Fence8
		icon='Scenary.dmi'
		icon_state="GateType7"
		layer=MOB_LAYER+1
		density=1
	Fence9
		icon='Scenary.dmi'
		icon_state="GateType8"
		layer=MOB_LAYER+1
	Fence10
		icon='Scenary.dmi'
		icon_state="GateType9"
		layer=MOB_LAYER+1
	Fence11
		icon='Scenary.dmi'
		icon_state="GateType10"
		layer=MOB_LAYER+1
turf/Buildings/Konoha/Hospital
	icon='TESTtransperent.png'
	layer=MOB_LAYER+1
turf/Buildings/Konoha/BigBuilding
	icon='konohahouse.png'
	layer=MOB_LAYER+10
turf/Buildings/Sound/SoundOrganizationHouse
	icon='SOHOUSE.png'
	layer=MOB_LAYER+10
turf/Buildings/Sound/SoundVillageHouse
	icon='SoundBuilding.dmi'
	layer=MOB_LAYER+1
/*turf/Buildings/Sound/Home
	icon = 'BuildingSoung.dmi'
	icon_state = "1"
	layer=400
turf/Buildings/Sound/Painting3
	icon = 'new picture.dmi'
	icon_state = "pic3"
	layer=400
turf/Buildings/Sound/Painting1
	icon = 'new picture.dmi'
	icon_state = "pic1"
	layer=400
turf/Buildings/Sound/Painting2
	icon = 'new picture.dmi'
	icon_state = "pic2"
	layer=400
turf/Buildings/Sound/Painting4
	icon = 'new picture.dmi'
	icon_state = "pic4"
	layer=400
turf/Buildings/Sound/Painting5
	icon = 'new picture.dmi'
	icon_state = "pic5"
	layer=400
turf/Buildings/Sound/Painting6
	icon = 'new picture.dmi'
	icon_state = "pic6"
	layer=400
turf/Buildings/Sound/Painting7
	icon = 'new picture 2.dmi'
	icon_state = "pic1"
	layer=400
turf/Buildings/Sound/Painting8
	icon = 'new picture 2.dmi'
	icon_state = "pic2"
	layer=400
turf/Buildings/Sound/Home1
	icon = 'BuildingSoung.dmi'
	icon_state = "old roof"
	layer=400*/
/*turf/Buildings/Sound/Home2
	icon = 'BuildingSoung.dmi'
	icon_state = "new"
	layer=400
turf/Buildings/Sound/roof
	icon = 'BuildingSoung.dmi'
	icon_state = "uchiha"
	layer=400*/
turf/Buildings/Rock
	EarthHospital
		icon='EarthHospital.png'
		layer=MOB_LAYER+1
	RockHouse
		icon='RockHouse.png'
		layer=MOB_LAYER+1
	RockVillageHouses
		icon='RockVillageHouses.png'
		layer=MOB_LAYER+1
turf/Buildings/Konoha/Memorial
	icon='Memorial.dmi'
	layer=TURF_LAYER+1
turf/Buildings/Gate1
	Part1
		icon='KonohaGate.dmi'
		icon_state="TopPiece"
		layer=MOB_LAYER+1
	Part2
		icon='KonohaGate.dmi'
		icon_state="MidPiece"
		density=1
	Part3
		icon='KonohaGate.dmi'
		icon_state="Edge12"
		density=1
	Part4
		icon='KonohaGate.dmi'
		icon_state="Edge22"
		density=1
	Part5
		icon='KonohaGate.dmi'
		icon_state="MidPiece2"
		layer=MOB_LAYER+1
	Part3
		icon='KonohaGate.dmi'
		icon_state="Edge1"
		density=1
	Part4
		icon='KonohaGate.dmi'
		icon_state="Edge2"
		density=1
turf/Buildings/Gate1/Roof
	layer=MOB_LAYER+3
	Part1
		icon='KonohaGate.dmi'
		icon_state="Roof1"
	Part2
		icon='KonohaGate.dmi'
		icon_state="Roof2"
	Part3
		icon='KonohaGate.dmi'
		icon_state="Roof3"
	Part4
		icon='KonohaGate.dmi'
		icon_state="Roof4"
	Part5
		icon='KonohaGate.dmi'
		icon_state="Roof5"
	Part6
		icon='KonohaGate.dmi'
		icon_state="Roof6"
	Part7
		icon='KonohaGate.dmi'
		icon_state="Roof7"
	Part8
		icon='KonohaGate.dmi'
		icon_state="Roof8"
	Part9
		icon='KonohaGate.dmi'
		icon_state="Roof9"
turf/Buildings/Gate1/Roof2
	layer=MOB_LAYER+3
	icon='SoundGate.dmi'
	Part1
		icon_state="Roof1"
	Part2
		icon_state="Roof2"
	Part3
		icon_state="Roof3"
	Part4
		icon_state="Roof4"
	Part5
		icon_state="Roof5"
	Part6
		icon_state="Roof6"
	Part7
		icon_state="Roof7"
	Part8
		icon_state="Roof8"
	Part9
		icon_state="Roof9"
turf/Buildings/Gate/Gatez
	icon='Gate2.dmi'
	layer=MOB_LAYER+3
	z001
		icon_state="1"
	z002
		icon_state="2"
	z003
		icon_state="3"
	z004
		icon_state="4"
	z005
		icon_state="5"
	z006
		icon_state="6"
	z007
		icon_state="7"
	z008
		icon_state="8"
	z009
		icon_state="9"
	z010
		icon_state="10"
	z011
		icon_state="11"
	z012
		icon_state="12"
	z013
		icon_state="13"
	z014
		icon_state="14"
	z015
		icon_state="15"
	z016
		icon_state="16"
	z017
		icon_state="17"
	z018
		icon_state="18"
	z019
		icon_state="19"
	z020
		icon_state="20"
	z021
		icon_state="21"
	z022
		icon_state="22"
	z023
		icon_state="23"
	z024
		icon_state="24"
	z025
		icon_state="25"
	z026
		icon_state="26"
	z027
		icon_state="27"
	z028
		icon_state="28"
	z029
		icon_state="29"
	z030
		icon_state="30"
	z031
		icon_state="31"
	z032
		icon_state="32"
	z033
		icon_state="33"
	z034
		icon_state="34"
	z035
		icon_state="35"
	z036
		icon_state="36"
	z037
		icon_state="37"
	z038
		icon_state="38"
	z039
		icon_state="39"
	z040
		icon_state="40"
	z041
		icon_state="41"
	z042
		icon_state="42"
	z043
		icon_state="43"
	z044
		icon_state="44"
	z045
		icon_state="45"
	z046
		icon_state="46"
	z047
		icon_state="47"
	z048
		icon_state="48"
	z049
		icon_state="49"
	z050
		icon_state="50"
	z051
		icon_state="51"
	z052
		icon_state="52"
	z053
		icon_state="53"
	z054
		icon_state="54"
	z055
		icon_state="55"
	z056
		icon_state="56"
	z057
		icon_state="57"
	z058
		icon_state="58"
	z059
		icon_state="59"
	z060
		icon_state="60"
	z061
		icon_state="61"
	z062
		icon_state="62"
	z063
		icon_state="63"
	z064
		icon_state="64"
	z065
		icon_state="65"
	z066
		icon_state="66"
	z067
		icon_state="67"
	z068
		icon_state="68"
	z069
		icon_state="69"
	z070
		icon_state="70"
	z071
		icon_state="71"
	z072
		icon_state="72"
	z073
		icon_state="73"
	z074
		icon_state="74"
	z075
		icon_state="75"
	z076
		icon_state="76"
	z077
		icon_state="77"
	z078
		icon_state="78"
	z079
		icon_state="79"
	z080
		icon_state="80"
	z081
		icon_state="81"
	z082
		icon_state="82"
	z083
		icon_state="83"
	z084
		icon_state="84"
	z085
		icon_state="85"
	z086
		icon_state="86"
	z087
		icon_state="87"
	z088
		icon_state="88"
	z089
		icon_state="89"
	z090
		icon_state="90"
	z091
		icon_state="91"
	z092
		icon_state="92"
	z093
		icon_state="93"
	z094
		icon_state="94"
	z095
		icon_state="95"
	z096
		icon_state="96"
	z097
		icon_state="97"
	z098
		icon_state="98"
	z099
		icon_state="99"
	z100
		icon_state="100"
	z101
		icon_state="101"
	z102
		icon_state="102"
	z103
		icon_state="103"
	z104
		icon_state="104"
	z105
		icon_state="105"
	z106
		icon_state="106"
	z107
		icon_state="107"
		layer = 3
	z108
		icon_state="108"
		layer = 3
	z109
		icon_state="109"
		layer = 3
	z110
		icon_state="110"
		layer = 3
	z111
		icon_state="111"
		layer = 3
	z112
		icon_state="112"
		layer = 3
	z113
		icon_state="113"
		layer = 3
	z114
		icon_state="114"
		layer = 3
	z115
		icon_state="115"
	z116
		icon_state="116"
	z117
		icon_state="117"
		layer = 3
	z118
		icon_state="118"
		layer = 3
	z119
		icon_state="119"
	z120
		icon_state="120"
		layer = 3
turf/Buildings/Fence
	Fence1
		icon = 'House 5 base 2.dmi'
		icon_state = "Fence1"
	Fence2
		icon = 'House 5 base 2.dmi'
		icon_state = "Fence2"
		layer=MOB_LAYER+1
turf/Buildings/Signs
	layer=MOB_LAYER+1
	WeaponSigns
		WeaponSign1
			icon='Scenary.dmi'
			icon_state="higher sign1(weapon)"
		WeaponSign2
			icon='Scenary.dmi'
			icon_state="higher sign 2(weapon)"
		WeaponSign3
			icon='Scenary.dmi'
			icon_state="higher sign 3(weapon)"
		WeaponSign4
			icon='Scenary.dmi'
			icon_state="higher sign 4(weapon)"
		WeaponSign5
			icon='Scenary.dmi'
			icon_state="higher sign 5(weapon)"
		WeaponSign6
			icon='Scenary.dmi'
			icon_state="higher sign 6(weapon)"
		WeaponSign7
			icon='Scenary.dmi'
			icon_state="higher sign 7(weapon)"
	FoodSigns
		FoodSign1
			icon='Scenary.dmi'
			icon_state="higher sign 1(barbaque)"
		FoodSign2
			icon='Scenary.dmi'
			icon_state="higher sign 2(barbaque)"
		FoodSign3
			icon='Scenary.dmi'
			icon_state="higher sign 3(barbaque)"
	ScrollSigns
		ScrollSign1
			icon='Scenary.dmi'
			icon_state="higher sign 1(scroll)"
		ScrollSign2
			icon='Scenary.dmi'
			icon_state="higher sign 2(scroll)"
		ScrollSign3
			icon='Scenary.dmi'
			icon_state="higher sign 3(scroll)"
	ItemSigns
		ItemSign1
			icon='Scenary.dmi'
			icon_state="higher sign 1(item)"
		ItemSign2
			icon='Scenary.dmi'
			icon_state="higher sign 2(item)"
		ItemSign3
			icon='Scenary.dmi'
			icon_state="higher sign 3(item)"
turf/Buildings/Scenary
	/*Bench1
		icon = 'Scenary.dmi'
		icon_state="bench3"
		density=0
		verb
			Rest()
				if(usr.Mogu)
					return
				if(usr.resting)
					usr.resting=0
					usr<<"You stop resting."
					usr.Frozen=0
					sleep(50)
					usr.CanRest=1
					return
				if(!usr.CanRest)
					return
				else
					usr.CanRest=0
				if(usr.GateIn!=""||usr.Pill!="")
					usr<<"You're body is under too much strain to rest right now!";return
				else
					usr.resting=1
					usr<<"You sit and relax."
					usr.Frozen=1
					while(usr.resting)
						if(usr.health<usr.maxhealth)
							usr.health+=(usr.maxhealth/80)
						if(usr.stamina<usr.maxstamina)
							usr.stamina+=(usr.maxstamina/65)
						if(usr.ChakraPool<usr.MaxChakraPool)
							usr.ChakraPool+=(usr.MaxChakraPool/210)
						sleep(10)
					usr<<"You're fully relaxed."
					usr.resting=0
					usr.Frozen=0
					return
	Bench2
		icon = 'Scenary.dmi'
		icon_state="bench4"
		density=0
		verb
			Rest()
				if(usr.Mogu)
					return
				if(usr.resting)
					usr.resting=0
					usr<<"You stop resting."
					usr.Frozen=0
					sleep(50)
					usr.CanRest=1
					return
				if(!usr.CanRest)
					return
				else
					usr.CanRest=0
				if(usr.GateIn!=""||usr.Pill!="")
					usr<<"You're body is under too much strain to rest right now!";return
				else
					usr.resting=1
					usr<<"You sit and relax."
					usr.Frozen=1
					while(usr.resting)
						if(usr.health<usr.maxhealth)
							usr.health+=(usr.maxhealth/80)
						if(usr.stamina<usr.maxstamina)
							usr.stamina+=(usr.maxstamina/65)
						if(usr.ChakraPool<usr.MaxChakraPool)
							usr.ChakraPool+=(usr.MaxChakraPool/210)
						sleep(10)
					usr<<"You're fully relaxed."
					usr.resting=0
					usr.Frozen=0
					return*/
	Lamp
		icon = 'Scenary.dmi'
		icon_state="lamp"
		density=1
	Lamp2
		icon = 'Scenary.dmi'
		icon_state="lamp4"
		density=1
	LampSky
		icon='Scenary.dmi'
		icon_state="lamp2"
		layer=MOB_LAYER+1
	UchihaSign
		icon = 'Scenary.dmi'
		icon_state="Uchihasign1"
		layer=MOB_LAYER+4
	UchihaSign2
		icon = 'Scenary.dmi'
		icon_state="Uchihasign2"
		layer=MOB_LAYER+4
	UchihaSign3
		icon = 'Scenary.dmi'
		icon_state="Uchihasign3"
		layer=MOB_LAYER+4
	UchihaSign4
		icon = 'Scenary.dmi'
		icon_state="Uchihasign4"
		layer=MOB_LAYER+4
	Railings
		icon = 'Scenary.dmi'
		density=1
		layer=MOB_LAYER+1
		Railing1
			icon_state="1"
		Railing2
			icon_state="2"
		Railing3
			icon_state="3"
		Railing4
			icon_state="4"
		Railing5
			icon_state="5"
		Railing6
			icon_state="6"
		Railing7
			icon_state="7"
		Railing8
			icon_state="8"
		Railing9
			icon_state="9"
		Railing10
			icon_state="10"
	Statue
		Hunterstatue
			icon = 'Doug.dmi'
			Top
				layer = MOB_LAYER+1
				icon_state = "HunterStatue"
				density = 1

		Doug
			icon = 'Doug.dmi'
			Top
				layer = MOB_LAYER+1
				icon_state = "top"
			Bottom
				layer = MOB_LAYER+1
				icon_state = "bottom"
				density = 1
				DblClick()
					var/usetext = {"
				<html>
				<STYLE>BODY {font-family: Verdana;font-size: 10px}</STYLE>
				<head>
				<BODY>
				<title>Doug</title>
				</head>
				<body bgcolor=#000000 text=#f5f5f5>
				<center><h2>Amekage<br></h2>
				<p>
				<b><center><h2>Biography</h2>
				<br>
				Doug the Great was the once great Amekage of the former Rain Village. Without his superior strength and cunning wit, Rain would've surely fallen before it was given to the new leader of Rain.
				It is unknown where Doug went, but many of the villages hope for his return. When Doug returned, he became a worthy power to the Rain Village as the new Rain formed.

				<p>
				<br>
				</body>
				</html>
				"}
					usr << browse(usetext)
		Phoenix
			icon = 'Phoenix.dmi'
			Top
				layer = FLY_LAYER+1
				icon_state = "top"
			Bottom
				layer = MOB_LAYER+1
				icon_state = "bottom"
				density = 1
				DblClick()
					var/usetext = {"
				<html>
				<STYLE>BODY {font-family: Verdana;font-size: 10px}</STYLE>
				<head>
				<BODY>
				<title>Ketsueki, Phoenix</title>
				</head>
				<body bgcolor=#000000 text=#f5f5f5>
				<center><h2>Amekoutei<br></h2>
				<p>
				<b><center><h2>Biography</h2>
				<br>
				Phoenix of the Ketsueki Clan was the first known Amekoutei of the Hidden Rain Village that led his village through the war and saved it in its time of need. Phoenix was also the one who single-handedly brought the Ketsueki Clan, along with Kinomi, into Rain Village and destroyed racism towards that clan.
				He led the Rain Village into victory, becoming their "Ever Eternal Leader."

				<p>
				<br>
				</body>
				</html>
				"}
					usr << browse(usetext)
	Symbols
		summoneffect1
			icon='summoningeffect.dmi'
			dir=NORTH
			density=0
		summoneffect2
			icon='summoningeffect.dmi'
			dir=EAST
			density=0
		summoneffect3
			icon='summoningeffect.dmi'
			dir=SOUTH
			density=0
		summoneffect4
			icon='summoningeffect.dmi'
			dir=WEST
			density=0
		summoncircle
			icon='summoncircle.dmi'
			icon_state=""
			layer=TURF_LAYER+1
			density=0
	layer=TURF_LAYER+1
turf
	var
		village=""
turf/Buildings/CityTiles
	Tiles1
		icon='Landscapes.dmi'
		icon_state="Tiles"
		layer=1
		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=100;var/countb=1;var/list/L = list()
					while(countb<10)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('Step.wav',0,0,0,counta)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=10
	Tiles2
		icon='Landscapes.dmi'
		icon_state="Tiles2"
		layer=1
		Entered(mob/M)
			if(ismob(M))
				if(prob(50))
					var/counta=100;var/countb=1;var/list/L = list()
					while(countb<10)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('Step.wav',0,0,0,counta)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=10
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
						usr.Frozen=0
						sleep(50)
						usr.CanRest=1
						return
					if(!usr.CanRest)
						return
					else
						usr.CanRest=0
					if(usr.moving==1||usr.Frozen==1||usr.kaiten==1||usr.ko>=1||usr.bind>=1)
						usr<<"You're body is under too much strain to rest right now!";return
					else
						usr.resting=1
						usr<<"You sit and relax."
						usr.Frozen=1
						while(usr.resting)
							if(usr.health<usr.Mhealth)
								usr.health+=(usr.Mhealth/35)
							if(usr.koamm>0)
								usr.koamm-=0.006
							if(usr.chakra<usr.Mchakra)
								usr.chakra+=(usr.Mchakra/170)
							if(usr.chakrapool<usr.chakrapoolmax)
								usr.chakrapool+=(usr.chakrapoolmax/85)
							sleep(10)
						usr<<"You're fully relaxed."
						usr.resting=0
						usr.Frozen=0
						return
			BedCovers
				name="Bed Covers"
				icon_state="1Cover"
				layer=MOB_LAYER+1
				density=0
	Chairs
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
			//if(usr.Mogu)
				//return
			if(usr.resting)
				usr.resting=0
				usr<<"You stop resting."
				usr.Frozen=0
				sleep(50)
				usr.CanRest=1
				return
			if(!usr.CanRest)
				return
			else
				usr.CanRest=0
			if(usr.moving==1||usr.Frozen==1||usr.kaiten==1||usr.ko>=1||usr.bind>=1)
				usr<<"Not right now!";return
			else
				usr.resting=1
				usr<<"You sit and relax."
				usr.Frozen=1
				while(usr.resting)
					if(usr.health<usr.Mhealth)
						usr.health+=(usr.Mhealth/45)
					if(usr.koamm>0)
						usr.koamm-=0.003
					if(usr.chakra<usr.Mchakra)
						usr.chakra+=(usr.Mchakra/210)
					sleep(10)
				usr<<"You're fully relaxed."
				usr.resting=0
				usr.Frozen=0
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

//////////////////////////////////////////////////////////////////////
//Christmas Time
turf/ChristmasTime
	//Tree
		//icon='ChristmasTree.png'
		//layer=MOB_LAYER+1
	ChristmasDecoration
		icon='ChristmasLights.dmi'
		Lights
			icon_state="Lights"
			layer=MOB_LAYER+1
