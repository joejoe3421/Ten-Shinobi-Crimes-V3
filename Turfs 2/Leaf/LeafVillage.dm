obj
	BuildingSigns
		icon = 'Signs.dmi'
		layer=TURF_LAYER+3
		Dojo
			icon_state = "Dojo"
		Kage
			icon_state = "Kage"
		Exam
			icon_state = "Exam"
		Barber
			icon_state="Barber"
		Weapon
			icon_state="Weapons"
		Clothes
			icon_state="Clothes"
	LeafVillage
		KHTop
			icon='KH.dmi'
			icon_state="top"
			layer=MOB_LAYER+1
	TallBuilding1
		icon = 'TallB1.dmi'
		icon_state = "1"
		New()
			src.overlays+=image('TallB1.dmi',icon_state = "2",pixel_y=233,layer=MOB_LAYER+1)
		density=1
turf
	LeafVillage
		name="Building"
		//icon='GRND.dmi'
		KH
			icon='KH.dmi'



