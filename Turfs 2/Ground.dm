area
	Shades
		icon='Shade.dmi'
		icon_state="1"
		layer=20
		mouse_opacity=0
		Light1
			icon='Shade.dmi'
			icon_state="L1"
		Dark1
			icon='Shade.dmi'
			icon_state="1"
		Dark2
			icon='Shade.dmi'
			icon_state="2"
		Dark3
			icon='Shade.dmi'
			icon_state="3"
		Darker
			icon='Shade.dmi'
			icon_state="4"
		Darkest
			icon='Shade.dmi'
			icon_state="5"
turf
	Opacity
		opacity=1
		density=1
	Black
		//icon='Misc Effects.dmi'
		icon_state="Black"
		density=1
	Shades
		icon='Shade.dmi'
		icon_state="1"
		mouse_opacity=0
		Light1
			icon='Shade.dmi'
			icon_state="L1"
		Light10
			icon='Shade.dmi'
			icon_state="L10"
		Light11
			icon='Shade.dmi'
			icon_state="L11"
		Shade0
			icon='Shade.dmi'
			icon_state="Shade0"
		Shade1
			icon='Shade.dmi'
			icon_state="Shade1"
		Shade2
			icon='Shade.dmi'
			icon_state="Shade2"
turf
	/*BuildingDensity
		density=1
	HighLayerDensity
		density=1
		layer=99999
	TopLayerDensity
		density=1
		New()
			src.dir=pick(NORTH,EAST,WEST,SOUTH)
			for(var/turf/T in view(src,0))
				src.icon=T.icon
				src.icon_state=T.icon_state
				T.icon_state="blank"
	BottomLayerDensity
		density=1
		New()
			src.dir=pick(NORTH,EAST,WEST,SOUTH)
			for(var/turf/T in view(src,0))
				src.icon=T.icon
				src.icon_state=T.icon_state
				T.icon_state="blank"
	LayerPlusBlock
		layer=999
		mouse_opacity=2
		icon='Shade.dmi'
		icon_state="B"
		mouse_opacity=2
		New()
			for(var/turf/T in range(src,0))
				if(T.density)
					src.density=1
		Entered(mob/M)
			if(istype(M,/mob))
				if(M.fightlayer=="HighGround")
					if(M.laststep<>null)
						M.loc=M.laststep
					else
						return 0
			if(istype(M,/mob))
				if(M.stepcounter==3&&M.speeddelay==2)
					M.stepcounter=0
					if(M.foot=="Left")
						view(M,6) << sound('Sounds/Walk/grassl.ogg',0,0,0,25)
						M.foot="Right"
					else
						if(M.foot=="Right")
							view(M,6) << sound('Sounds/Walk/grassr.ogg',0,0,0,25)
							M.foot="Left"
				else
					if(M.stepcounter==5&&M.speeddelay==1.5)
						M.stepcounter=0
						if(M.foot=="Left")
							view(M,6) << sound('Sounds/Walk/grassl.ogg',0,0,0,25)
							M.foot="Right"
						else
							if(M.foot=="Right")
								view(M,6) << sound('Sounds/Walk/grassr.ogg',0,0,0,25)
								M.foot="Left"
					else
						M.stepcounter++
		New()
			src.icon_state="blank"
			..()
	LayerPlusLastStep
		layer=999
		mouse_opacity=2
		icon='Shade.dmi'
		icon_state="S"
		Entered(var/mob/M)
			if(istype(M,/mob))
				M.laststep=M.loc
				if(M.stepcounter==3&&M.speeddelay==2)
					M.stepcounter=0
					if(M.foot=="Left")
						view(M,6) << sound('Sounds/Walk/man_fs_l_mt_con.ogg',0,0,0,25)
						M.foot="Right"
					else
						if(M.foot=="Right")
							view(M,6) << sound('Sounds/Walk/man_fs_r_mt_con.ogg',0,0,0,25)
							M.foot="Left"
				else
					if(M.stepcounter==5&&M.speeddelay==1.5)
						M.stepcounter=0
						if(M.foot=="Left")
							view(M,6) << sound('Sounds/Walk/man_fs_l_mt_con.ogg',0,0,0,25)
							M.foot="Right"
						else
							if(M.foot=="Right")
								view(M,6) << sound('Sounds/Walk/man_fs_r_mt_con.ogg',0,0,0,25)
								M.foot="Left"
					else
						M.stepcounter++

		New()
			src.icon_state="blank"
			..()
	LayerMinus
		layer=TURF_LAYER+999
		mouse_opacity=2
		icon='Shade.dmi'
		icon_state="C"
		New()
			src.icon_state="blank"
			..()
		Entered(var/atom/movable/M)
			if(istype(M))
				M.layer=TURF_LAYER+1
				for(var/obj/HAIR/H in M.overlays)
					if(H) H.layer=TURF_LAYER+1
				for(var/obj/O in M.overlays)
					if(O&&isobj(O)) O.layer=TURF_LAYER+1
				if(ismob(M)) usr.overlays-=/obj/MaleParts/UnderShade
		Exited(var/atom/movable/M)
			if(istype(M))
				M.layer=initial(M.layer)
				for(var/obj/HAIR/H in M.overlays)
					if(H) H.layer=MOB_LAYER
				for(var/obj/O in M.overlays)
					if(O&&isobj(O)) O.layer=MOB_LAYER
				if(ismob(M)) usr.overlays+=/obj/MaleParts/UnderShade
	LayerPlus
		layer=TURF_LAYER+999
		mouse_opacity=2
		icon='Shade.dmi'
		icon_state="C"
		New()
			src.icon_state="blank"
			..()
		Entered(var/atom/movable/M)
			if(istype(M)&&ismob(M))
				M.layer=TURF_LAYER+5
				M:ReAddClothing()
				for(var/obj/O in M.overlays)
					if(O&&isobj(O)) O.layer=TURF_LAYER+5
			//	if(ismob(M)) usr.overlays-=/obj/MaleParts/UnderShade
		Exited(var/atom/movable/M)
			if(istype(M)&&ismob(M))
				M.layer=initial(M.layer)
				M:ReAddClothing()
			//	for(var/obj/HAIR/H in M.overlays)
			//		if(H) H.layer=MOB_LAYER
				for(var/obj/O in M.overlays)
					if(O&&isobj(O)) O.layer=MOB_LAYER
			//	if(ismob(M)) usr.overlays+=/obj/MaleParts/UnderShade
	LayerPlus1
		layer=999
		mouse_opacity=2
		icon='Shade.dmi'
		icon_state="C"
		Click()
			if(get_dist(src, usr) <=1)
				usr.overlays=0
				usr.UpdateHMB()
				usr.Name(usr.name)
				usr.overlays+=/obj/MaleParts/UnderShade
				if(usr.fightlayer=="Normal")
					usr.layer=MOB_LAYER+7
					usr.fightlayer="HighGround"
					usr.RestoreOverlays()
					for(var/turf/LayerPlusLastStep/LS in range(src))
						usr.loc=locate(LS.x,LS.y,LS.z)
						usr.laststep=usr.loc
						break
				else
					if(usr.fightlayer=="HighGround")
						usr.layer=MOB_LAYER
						usr.fightlayer="Normal"
						usr.RestoreOverlays()
					else
						if(usr.fightlayer=="Normal")
							..()
						if(usr.fightlayer=="HighGround")
							if(usr.laststep<>null)
								usr.loc=usr.laststep
		New()
			src.icon_state="blank"
			..()
		Entered(var/mob/M)
			if(istype(M,/mob))
				if(M.stepcounter==3&&M.speeddelay==2)
					M.stepcounter=0
					if(M.foot=="Left")
						view(M,6) << sound('Sounds/Walk/man_fs_l_mt_con.ogg',0,0,0,25)
						M.foot="Right"
					else
						if(M.foot=="Right")
							view(M,6) << sound('Sounds/Walk/man_fs_r_mt_con.ogg',0,0,0,25)
							M.foot="Left"
				else
					if(M.stepcounter==5&&M.speeddelay==1.5)
						M.stepcounter=0
						if(M.foot=="Left")
							view(M,6) << sound('Sounds/Walk/man_fs_l_mt_con.ogg',0,0,0,25)
							M.foot="Right"
						else
							if(M.foot=="Right")
								view(M,6) << sound('Sounds/Walk/man_fs_r_mt_con.ogg',0,0,0,25)
								M.foot="Left"
					else
						M.stepcounter++
	LayerPlusStepHigh
		layer=999
		mouse_opacity=2
		icon='Shade.dmi'
		icon_state="C"
		New()
			..()
			src.icon_state="blank"
		Entered(mob/M)
			if(istype(M,/mob))
				M.overlays=0
				M.UpdateHMB()
				M.Name(M.name)
				M.overlays+=/obj/MaleParts/UnderShade
				if(M.fightlayer=="Normal")
					M.layer=MOB_LAYER+7
					M.fightlayer="HighGround"
					M.RestoreOverlays()
				else
					if(M.fightlayer=="HighGround")
						M.layer=MOB_LAYER
						M.fightlayer="Normal"
						M.RestoreOverlays()
					else
						if(M.fightlayer=="Normal")
							..()
						if(M.fightlayer=="HighGround")
							if(M.laststep<>null)
								M.loc=M.laststep
			if(istype(M,/mob))
				if(M.stepcounter==3&&M.speeddelay==2)
					M.stepcounter=0
					if(M.foot=="Left")
						view(M,6) << sound('Sounds/Walk/man_fs_l_mt_con.ogg',0,0,0,25)
						M.foot="Right"
					else
						if(M.foot=="Right")
							view(M,6) << sound('Sounds/Walk/man_fs_r_mt_con.ogg',0,0,0,25)
							M.foot="Left"
				else
					if(M.stepcounter==5&&M.speeddelay==1.5)
						M.stepcounter=0
						if(M.foot=="Left")
							view(M,6) << sound('Sounds/Walk/man_fs_l_mt_con.ogg',0,0,0,25)
							M.foot="Right"
						else
							if(M.foot=="Right")
								view(M,6) << sound('Sounds/Walk/man_fs_r_mt_con.ogg',0,0,0,25)
								M.foot="Left"
					else
						M.stepcounter++
	Spawns
		New()
			..()
			src.icon_state="blank"
		icon='Misc Effects.dmi'
		icon_state="spawn"
		StartSpot
			icon='Misc Effects.dmi'
			icon_state="start"
			var/Village="Hidden Leaf"
		RespawnSpot
			var/Village="Hidden Leaf"
			icon='Misc Effects.dmi'
			icon_state="start"*/
	Ground
		density=0
		icon='GRND.dmi'
		Trees
			MTree1
				icon='NTree1.dmi'
				B1
					icon_state="1,0"
					density=1
					layer=TURF_LAYER+2
					pixel_x=-32
				B2
					icon_state="2,0"
					density=1
					layer=TURF_LAYER+2
					New()
						..()
						src.dir=pick(NORTH,EAST,WEST,SOUTH)
						if(src.dir==NORTH||src.dir==SOUTH)
							src.overlays+=/turf/Ground/Trees/MTree1/B1
							src.overlays+=/turf/Ground/Trees/MTree1/B3
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left2/B02
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left2/B03
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left2/B05
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left/B11
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left/B12
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left/B13
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left/B14
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left/B15
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left/B16
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Middle/B21
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Middle/B22
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Middle/B23
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Middle/B24
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Middle/B25
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Middle/B26
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right/B31
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right/B32
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right/B33
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right/B34
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right/B35
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right/B36
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right2/B43
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right2/B44
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right2/B45
						else
							if(src.dir==WEST)
								src.icon='NTree2.dmi'
								src.overlays+=/turf/Ground/Trees/MTree2/B1
								src.overlays+=/turf/Ground/Trees/MTree2/B3
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left2/B02
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left2/B03
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left2/B05
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B11
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B12
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B13
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B14
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B15
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B16
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B21
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B22
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B23
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B24
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B25
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B26
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B31
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B32
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B33
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B34
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B35
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B36
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right2/B43
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right2/B44
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right2/B45
							else
								if(src.dir==EAST)
									src.icon='NTree3.dmi'
									src.overlays+=/turf/Ground/Trees/MTree3/B1
									src.overlays+=/turf/Ground/Trees/MTree3/B3
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left2/B03
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B11
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B12
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B13
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B14
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B15
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B21
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B22
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B23
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B24
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B25
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B26
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Right/B32
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Right/B33
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Right/B34
				B3
					icon_state="3,0"
					density=1
					layer=TURF_LAYER+2
					pixel_x=32
				Overlays
					layer=MOB_LAYER+6
					Left2
						B02
							icon_state = "0,2"
							pixel_x=-64
							pixel_y=64
						B03
							icon_state = "0,3"
							pixel_x=-64
							pixel_y=96
						B05
							icon_state = "0,5"
							pixel_x=-64
							pixel_y=160
					Left
						B11
							icon_state = "1,1"
							pixel_x=-32
							pixel_y=32
						B12
							icon_state = "1,2"
							pixel_x=-32
							pixel_y=64
						B13
							icon_state = "1,3"
							pixel_x=-32
							pixel_y=96
						B14
							icon_state = "1,4"
							pixel_x=-32
							pixel_y=128
						B15
							icon_state = "1,5"
							pixel_x=-32
							pixel_y=160
						B16
							icon_state = "1,6"
							pixel_x=-32
							pixel_y=192
					Middle
						B21
							icon_state = "2,1"
							pixel_y=32
						B22
							icon_state = "2,2"
							pixel_y=64
						B23
							icon_state = "2,3"
							pixel_y=96
						B24
							icon_state = "2,4"
							pixel_y=128
						B25
							icon_state = "2,5"
							pixel_y=160
						B26
							icon_state = "2,6"
							pixel_y=192
					Right
						B31
							icon_state = "3,1"
							pixel_x=32
							pixel_y=32
						B32
							icon_state = "3,2"
							pixel_x=32
							pixel_y=64
						B33
							icon_state = "3,3"
							pixel_x=32
							pixel_y=96
						B34
							icon_state = "3,4"
							pixel_x=32
							pixel_y=128
						B35
							icon_state = "3,5"
							pixel_x=32
							pixel_y=160
						B36
							icon_state = "3,6"
							pixel_x=32
							pixel_y=192
					Right2
						B43
							icon_state = "4,3"
							pixel_x=64
							pixel_y=96
						B44
							icon_state = "4,4"
							pixel_x=64
							pixel_y=128
						B45
							icon_state = "4,5"
							pixel_x=64
							pixel_y=160
			MTree2
				icon='NTree2.dmi'
				B1
					icon_state="1,0"
					density=1
					layer=TURF_LAYER+2
					pixel_x=-32
				B2
					icon_state="2,0"
					density=1
					layer=TURF_LAYER+2
					New()
						..()
						//var/obj/TL=new /turf/Ground/Trees/MTree1/B1(src.loc)
						//TL.loc=locate(src.x-1,src.y,src.z)
						//var/obj/TR=new /turf/Ground/Trees/MTree1/B3(src.loc)
						//TR.loc=locate(src.x+1,src.y,src.z)
						//for(var/turf/Ground/Trees/MTree1/Overlays/TO in world.MT1)
						src.overlays+=/turf/Ground/Trees/MTree2/B1
						src.overlays+=/turf/Ground/Trees/MTree2/B3
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left2/B02
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left2/B03
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left2/B05
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B11
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B12
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B13
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B14
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B15
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B16
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B21
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B22
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B23
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B24
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B25
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B26
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B31
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B32
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B33
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B34
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B35
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B36
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right2/B43
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right2/B44
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right2/B45
				B3
					icon_state="3,0"
					density=1
					layer=TURF_LAYER+2
					pixel_x=32
				Overlays
					layer=MOB_LAYER+6
					Left2
						B02
							icon_state = "0,2"
							pixel_x=-64
							pixel_y=64
						B03
							icon_state = "0,3"
							pixel_x=-64
							pixel_y=96
						B05
							icon_state = "0,5"
							pixel_x=-64
							pixel_y=160
					Left
						B11
							icon_state = "1,1"
							pixel_x=-32
							pixel_y=32
						B12
							icon_state = "1,2"
							pixel_x=-32
							pixel_y=64
						B13
							icon_state = "1,3"
							pixel_x=-32
							pixel_y=96
						B14
							icon_state = "1,4"
							pixel_x=-32
							pixel_y=128
						B15
							icon_state = "1,5"
							pixel_x=-32
							pixel_y=160
						B16
							icon_state = "1,6"
							pixel_x=-32
							pixel_y=192
					Middle
						B21
							icon_state = "2,1"
							pixel_y=32
						B22
							icon_state = "2,2"
							pixel_y=64
						B23
							icon_state = "2,3"
							pixel_y=96
						B24
							icon_state = "2,4"
							pixel_y=128
						B25
							icon_state = "2,5"
							pixel_y=160
						B26
							icon_state = "2,6"
							pixel_y=192
					Right
						B31
							icon_state = "3,1"
							pixel_x=32
							pixel_y=32
						B32
							icon_state = "3,2"
							pixel_x=32
							pixel_y=64
						B33
							icon_state = "3,3"
							pixel_x=32
							pixel_y=96
						B34
							icon_state = "3,4"
							pixel_x=32
							pixel_y=128
						B35
							icon_state = "3,5"
							pixel_x=32
							pixel_y=160
						B36
							icon_state = "3,6"
							pixel_x=32
							pixel_y=192
					Right2
						B43
							icon_state = "4,3"
							pixel_x=64
							pixel_y=96
						B44
							icon_state = "4,4"
							pixel_x=64
							pixel_y=128
						B45
							icon_state = "4,5"
							pixel_x=64
							pixel_y=160
			MTree3
				icon = 'NTree3.dmi'
				icon_state = ""
				B1
					icon_state = "1,0"
					pixel_x=-32
					layer=TURF_LAYER+2
				B2
					icon_state = "2,0"
					density=1
					layer=TURF_LAYER+2
					New()
						..()
						src.overlays+=/turf/Ground/Trees/MTree3/B1
						src.overlays+=/turf/Ground/Trees/MTree3/B3
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left2/B03
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B11
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B12
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B13
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B14
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B15
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B21
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B22
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B23
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B24
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B25
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B26
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Right/B32
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Right/B33
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Right/B34
				B3
					icon_state = "3,0"
					layer=TURF_LAYER+2
					pixel_x=32
				Overlays
					layer=MOB_LAYER+6
					Left2
						B03
							icon_state = "0,3"
							pixel_x=-64
							pixel_y=96
					Left
						B11
							icon_state = "1,1"
							pixel_x=-32
							pixel_y=32
						B12
							icon_state = "1,2"
							pixel_x=-32
							pixel_y=64
						B13
							icon_state = "1,3"
							pixel_x=-32
							pixel_y=96
						B14
							icon_state = "1,4"
							pixel_x=-32
							pixel_y=128
						B15
							icon_state = "1,5"
							pixel_x=-32
							pixel_y=160
					Middle
						B21
							icon_state = "2,1"
							pixel_y=32
						B22
							icon_state = "2,2"
							pixel_y=64
						B23
							icon_state = "2,3"
							pixel_y=96
						B24
							icon_state = "2,4"
							pixel_y=128
						B25
							icon_state = "2,5"
							pixel_y=160
						B26
							icon_state = "2,6"
							pixel_y=192
					Right
						B32
							icon_state = "3,2"
							pixel_x=32
							pixel_y=64
						B33
							icon_state = "3,3"
							pixel_x=32
							pixel_y=96
						B34
							icon_state = "3,4"
							pixel_x=32
							pixel_y=128
			NPTree
				icon = 'NPTree.dmi'
				icon_state = ""
				B1
					icon_state = "1,0"
					layer=TURF_LAYER+2
					pixel_x=-32
				B2
					icon_state = "2,0"
					layer=TURF_LAYER+2
					density=1
					New()
						..()
						src.overlays+=/turf/Ground/Trees/NPTree/B1
						src.overlays+=/turf/Ground/Trees/NPTree/B3
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left2/B02
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left2/B03
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left2/B04
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left/B11
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left/B12
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left/B13
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left/B14
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left/B15
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left/B16
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Middle/B21
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Middle/B22
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Middle/B23
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Middle/B24
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Middle/B25
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Middle/B26
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right/B31
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right/B32
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right/B33
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right/B34
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right/B35
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right2/B42
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right2/B43
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right2/B44
				B3
					icon_state = "3,0"
					layer=TURF_LAYER+2
					pixel_x=32
				Overlays
					layer=MOB_LAYER+6
					Left2
						B02
							icon_state = "0,2"
							pixel_x=-64
							pixel_y=64
						B03
							icon_state = "0,3"
							pixel_x=-64
							pixel_y=96
						B04
							icon_state = "0,4"
							pixel_x=-64
							pixel_y=128
					Left
						B11
							icon_state = "1,1"
							pixel_x=-32
							pixel_y=32
						B12
							icon_state = "1,2"
							pixel_x=-32
							pixel_y=64
						B13
							icon_state = "1,3"
							pixel_x=-32
							pixel_y=96
						B14
							icon_state = "1,4"
							pixel_x=-32
							pixel_y=128
						B15
							icon_state = "1,5"
							pixel_x=-32
							pixel_y=160
						B16
							icon_state = "1,6"
							pixel_x=-32
							pixel_y=192
					Middle
						B21
							icon_state = "2,1"
							pixel_y=32
						B22
							icon_state = "2,2"
							pixel_y=64
						B23
							icon_state = "2,3"
							pixel_y=96
						B24
							icon_state = "2,4"
							pixel_y=128
						B25
							icon_state = "2,5"
							pixel_y=160
						B26
							icon_state = "2,6"
							pixel_y=192
					Right
						B31
							icon_state = "3,1"
							pixel_x=32
							pixel_y=32
						B32
							icon_state = "3,2"
							pixel_x=32
							pixel_y=64
						B33
							icon_state = "3,3"
							pixel_x=32
							pixel_y=96
						B34
							icon_state = "3,4"
							pixel_x=32
							pixel_y=128
						B35
							icon_state = "3,5"
							pixel_x=32
							pixel_y=160
					Right2
						B42
							icon_state = "4,2"
							pixel_x=64
							pixel_y=64
						B43
							icon_state = "4,3"
							pixel_x=64
							pixel_y=96
						B44
							icon_state = "4,4"
							pixel_x=64
							pixel_y=128
		Bush
			icon='Flowers.dmi'
			layer=TURF_LAYER+1
			//Hengable=1
			New()
				src.dir=pick(NORTH,EAST,WEST,SOUTH)
				..()
			ShortGrass
				icon_state="grassbladeshort"
			TallGrass
				icon_state="grassblades"
				layer=MOB_LAYER+1
				/*Entered(var/mob/M)
					if(istype(M,/mob))
						src.layer=MOB_LAYER+1
						M.overlays+=src
						/*if(M.injutsu==0&&M.dashable<>2)
							if(M.stepcounter==3&&M.speeddelay==2)
								M.stepcounter=0
								if(M.foot=="Left")
									view(M,6) << sound('Sounds/Walk/grassl.ogg',0,0,0,25)
									M.foot="Right"
								else
									if(M.foot=="Right")
										view(M,6) << sound('Sounds/Walk/grassr.ogg',0,0,0,25)
										M.foot="Left"
							else
								if(M.stepcounter==5&&M.speeddelay==1.5)
									M.stepcounter=0
									if(M.foot=="Left")
										view(M,6) << sound('Sounds/Walk/grassl.ogg',0,0,0,25)
										M.foot="Right"
									else
										if(M.foot=="Right")
											view(M,6) << sound('Sounds/Walk/grassr.ogg',0,0,0,25)
											M.foot="Left"
								else
									M.stepcounter++*/
					..()
				Exited(var/mob/M)
					if(istype(M,/mob))
						M.overlays-=src
						M.overlays-=src
						M.overlays-=src
						src.layer=TURF_LAYER+1
					..()*/
			TallGrassArea
				layer=TURF_LAYER
				icon_state="grassblades2x"
		Grass
			icon='GRND.dmi'
			icon_state="grass"
			New()
				src.dir=pick(NORTH,EAST,WEST,SOUTH)
				//if(prob(50))
				//	src.overlays+=/turf/Ground/GrassOva
				..()
			//Entered(var/mob/M)
				//if(istype(M,/mob))
					/*if(M.injutsu==0&&M.dashable<>2)
						if(M.stepcounter==3&&M.speeddelay==2)
							M.stepcounter=0
							if(M.foot=="Left")
								view(M,6) << sound('Sounds/Walk/grassl.ogg',0,0,0,25)
								M.foot="Right"
							else
								if(M.foot=="Right")
									view(M,6) << sound('Sounds/Walk/grassr.ogg',0,0,0,25)
									M.foot="Left"
						else
							if(M.stepcounter==5&&M.speeddelay==1.5)
								M.stepcounter=0
								if(M.foot=="Left")
									view(M,6) << sound('Sounds/Walk/grassl.ogg',0,0,0,25)
									M.foot="Right"
								else
									if(M.foot=="Right")
										view(M,6) << sound('Sounds/Walk/grassr.ogg',0,0,0,25)
										M.foot="Left"
							else
								M.stepcounter++*/
		GrassDark
			icon='GRND.dmi'
			icon_state="grassD"
			New()
				src.dir=pick(NORTH,EAST,WEST,SOUTH)
				//if(prob(50))
				//	src.overlays+=/turf/Ground/GrassOva
				..()
			//Entered(var/mob/M)
				//if(istype(M,/mob))
					/*if(M.injutsu==0&&M.dashable<>2)
						if(M.stepcounter==3&&M.speeddelay==2)
							M.stepcounter=0
							if(M.foot=="Left")
								view(M,6) << sound('Sounds/Walk/grassl.ogg',0,0,0,25)
								M.foot="Right"
							else
								if(M.foot=="Right")
									view(M,6) << sound('Sounds/Walk/grassr.ogg',0,0,0,25)
									M.foot="Left"
						else
							if(M.stepcounter==5&&M.speeddelay==1.5)
								M.stepcounter=0
								if(M.foot=="Left")
									view(M,6) << sound('Sounds/Walk/grassl.ogg',0,0,0,25)
									M.foot="Right"
								else
									if(M.foot=="Right")
										view(M,6) << sound('Sounds/Walk/grassr.ogg',0,0,0,25)
										M.foot="Left"
							else
								M.stepcounter++*/
			Spots
				Spot1
					icon_state="grassDspot"
			Edges
				Left
					icon_state="GDEdgeL"
				Right
					icon_state="GDEdgeR"
				Top
					icon_state="GDEdgeT"
				Bottom
					icon_state="GDEdgeB"
		Sand
			icon_state="sand"
			New()
				src.dir=pick(NORTH,EAST,WEST,SOUTH)
				//if(prob(50))
				//	src.overlays+=/turf/Ground/GrassOva
				..()
			//Entered(var/mob/M)
				//if(istype(M,/mob))
					/*if(M.injutsu==0&&M.dashable<>2)
						if(M.stepcounter==3&&M.speeddelay==2)
							M.stepcounter=0
							if(M.foot=="Left")
								view(M,6) << sound('Sounds/Walk/man_fs_l_mt_snd.ogg',0,0,0,25)
								M.foot="Right"
							else
								if(M.foot=="Right")
									view(M,6) << sound('Sounds/Walk/man_fs_r_mt_snd.ogg',0,0,0,25)
									M.foot="Left"
						else
							if(M.stepcounter==5&&M.speeddelay==1.5)
								M.stepcounter=0
								if(M.foot=="Left")
									view(M,6) << sound('Sounds/Walk/man_fs_l_mt_snd.ogg',0,0,0,25)
									M.foot="Right"
								else
									if(M.foot=="Right")
										view(M,6) << sound('Sounds/Walk/man_fs_r_mt_snd.ogg',0,0,0,25)
										M.foot="Left"
							else
								M.stepcounter++*/
			Spots
				Spot1
					icon_state="sandspot"
			Edges
				Left
					icon_state="SEdgeL"
				Right
					icon_state="SEdgeR"
				Top
					icon_state="SEdgeT"
				Bottom
					icon_state="SEdgeB"
		Water
			icon = 'Beach.dmi'
			icon_state="water235"
			layer = TURF_LAYER
			density=0
			/*New()
				..()
				src.overlays+=/obj/wateredges/a
				src.overlays+=/obj/wateredges/b
				src.overlays+=/obj/wateredges/c
				src.overlays+=/obj/wateredges/d
				src.overlays+=/obj/wateredges/e
				src.overlays+=/obj/wateredges/f
				src.overlays+=/obj/wateredges/g
				src.overlays+=/obj/wateredges/h*/
			Entered(mob/M)
				if(ismob(M))
					var/counta=100;var/countb=1;var/list/L = list()
					while(countb<10)
						var/list/S = range(countb)
						for(var/mob/X in L)
							S-=X
						S<<sound('StepInWater.wav',0,0,0,14)
						for(var/mob/X in S)
							L+=X
						countb++;counta-=10
					if(M.WaterWalkingMastery!=10)
						var/Z=(rand(M.Mchakra*0.001,M.Mchakra*0.03))/(M.WaterWalkingMastery+1)
						M.chakra-=rand(Z*0.5,Z*1.5)
						if(prob(20))
							M.WaterWalkingMastery+=pick(0.01,0.02)
							if(M.WaterWalkingMastery>10)
								M.WaterWalkingMastery=10
					if(M.WaterWalkingMastery>=10)
						M.chakra-=0.01
						if(M.run>=1)
							if(M.element == "Wind" || M.element == "Water"||M.hassuiton||M.hasfuuton)
								//if(M.hassuiton || M.hasfuuton)
								flick("jump",M)
								var/obj/O = new/obj(src)
								O.loc = M.loc
								O.dir = M.dir
								O.pixel_y=-16
								O.pixel_x=-16
								O.layer=MOB_LAYER+0.1
								O.icon = 'waterdash.dmi'
								O.icon_state = "water top"
								var/obj/O2 = new/obj(src)
								O2.loc = M.loc
								O2.dir=M.dir
								O2.pixel_y=-16
								O2.pixel_x=-16
								O2.layer=MOB_LAYER-0.1
								O2.icon = 'waterdash.dmi'
								O2.icon_state = "water bottom"
								spawn(5)
									if(O2)
										del O2
									if(O)
										del O
					if(M.clan=="Hozuki"&&M.hydration<100)
						M.hydration+=pick(1,2,1)
						if(M.hydration>=100)
							M.hydration=100
					if(prob(0.8)&&M.CC<100)
						M.CC+=pick(0.1,0.2,0.3,0.4,0.3,0.2,0.1)
						M<<"You get a little better at controlling your chakra."
						if(M.CC>100)
							M.CC=100
					if(M.chakra<=0)
						M<<"<b>You ran out of chakra!"
						M.health-=rand(M.Mhealth*0.01,M.Mhealth*0.05)//;return
						if(M.clan!="Hoshigaki")
							M.run=0
							M.icon_state=""
					return 1
				else return 1

			Edges
				Left
					icon_state="DWEdgeL"
				Right
					icon_state="DWEdgeR"
				Top
					icon_state="DWEdgeT"
				Bottom
					icon_state="DWEdgeB"
		WaterZoneEnter
			icon='Shade.dmi'
			icon_state="S"
			layer=999
			mouse_opacity=2
			New()
				..()
				src.dir=pick(NORTH,EAST,WEST,SOUTH)
				for(var/turf/T in view(src,0))
					src.icon=T.icon
					src.icon_state=T.icon_state
					T.icon_state="blank"
				//src.icon_state="blank"
			Entered(var/mob/M)
				if(istype(M,/mob))
					var/check=0
					if(M.waterwalk)
						check=1
					if(M.element == "Wind" || M.element == "Water")
						if(M.hassuiton || M.hasfuuton)
							var/obj/O = new/obj(src)
							O.loc = src
							O.icon = 'GRND.dmi'
							O.icon_state = "Icywater"
							check=1
							spawn(5) del(O)
					if(!check)
						if(!M.swimming)
							//M.firing=1
							M.canattack=0
							//M.stepcounter=0
							M.icon_state="swim"
							M.swimming=1
							//M.overlays-=/obj/MaleParts/UnderShade
							//M.overlays+=/obj/MiscEffects/WaterRing
							//M.overlays+=/obj/MiscEffects/WaterRing
		WaterZoneExit
			icon='Shade.dmi'
			icon_state="B"
			layer=999
			mouse_opacity=2
			New()
				..()
				src.icon_state="blank"
			Entered(var/mob/M)
				if(istype(M,/mob))
					var/check=0
					if(M.waterwalk)
						check=1
					if(M.element == "Wind" || M.element == "Water")
						if(M.hassuiton || M.hasfuuton)
							var/obj/O = new/obj(src)
							O.loc = src
							O.icon = 'GRND.dmi'
							O.icon_state = "Icywater"
							check=1
							spawn(5) del(O)
					if(!check)
						if(M.swimming)
							//if(!M.injutsu)
								//M.firing=0
							M.canattack=1
							//M.stepcounter=0
							M.icon_state=""
							M.swimming=null
							//M.overlays+=/obj/MaleParts/UnderShade
							//M.overlays-=/obj/MiscEffects/WaterRing
							//M.overlays-=/obj/MiscEffects/WaterRing
		/*ClimbZoneExit
			icon='Shade.dmi'
			icon_state="B"
			layer=999
			mouse_opacity=2
			New()
				..()
				src.dir=pick(NORTH,EAST,WEST,SOUTH)
				for(var/turf/T in view(src,0))
					src.icon=T.icon
					src.icon_state=T.icon_state
					T.icon_state="blank"
				//src.icon_state="blank"
			Entered(var/mob/M)
				if(istype(M,/mob))
					//if(!M.waterwalk)
					if(M.client)
						if(M.copy=="Climb")
							M.icon_state=""
							M.canattack=1
							M.firing=0
							M.arrow=null
							M.client.images-=M.ArrowTasked
							var/AT=M.ArrowTasked
							del(AT)
							M.copy=null
							M.ArrowTasked=null
							M.arrow=null
		ClimbZoneFall
			icon='Shade.dmi'
			icon_state="S"
			layer=999
			mouse_opacity=2
			density=1
			New()
				..()
				src.dir=pick(NORTH,EAST,WEST,SOUTH)
				for(var/turf/T in view(src,0))
					src.icon=T.icon
					src.icon_state=T.icon_state
					T.icon_state="blank"*/
				//src.icon_state="blank"
		Dirt
			icon_state="dirt"
			New()
				src.dir=pick(NORTH,EAST,WEST,SOUTH)
				//if(prob(50))
				//	src.overlays+=/turf/Ground/GrassOva
				..()
			//Entered(var/mob/M)
				//if(istype(M,/mob))
					/*if(M.injutsu==0&&M.dashable<>2)
						if(M.stepcounter==3&&M.speeddelay==2)
							M.stepcounter=0
							if(M.foot=="Left")
								view(M,6) << sound('Sounds/Walk/man_fs_l_mt_drt.ogg',0,0,0,25)
								M.foot="Right"
							else
								if(M.foot=="Right")
									view(M,6) << sound('Sounds/Walk/man_fs_r_mt_drt.ogg',0,0,0,25)
									M.foot="Left"
						else
							if(M.stepcounter==5&&M.speeddelay==1.5)
								M.stepcounter=0
								if(M.foot=="Left")
									view(M,6) << sound('Sounds/Walk/man_fs_l_mt_drt.ogg',0,0,0,25)
									M.foot="Right"
								else
									if(M.foot=="Right")
										view(M,6) << sound('Sounds/Walk/man_fs_r_mt_drt.ogg',0,0,0,25)
										M.foot="Left"
							else
								M.stepcounter++*/
			Types
				DirtSand
					icon_state="dirtsand"
			Spots
				Spot1
					icon_state="dirtspot"
			Edges
				Left
					icon_state="DEdgeL"
				Right
					icon_state="DEdgeR"
				Top
					icon_state="DEdgeT"
				Bottom
					icon_state="DEdgeB"
				BottomLeft
					icon_state="DEdgeBL"
		Cliff
			icon_state="cliff"
			density=1
			//fightlayer="HighGround"
			var/Climbable=1
			New()
				var/list/dir_list=list(NORTH,EAST,WEST,SOUTH)
				src.dir=pick(dir_list)
				//for(var/turf/T in range(src,0))
				//	T.density=1
				..()
			Edges
				//layer=MOB_LAYER+6
				Left
					icon_state="CEdgeL"
					density=1
				Right
					icon_state="CEdgeR"
					density=1
				Top
					icon_state="CEdgeT"
					density=1
				VeryTop
					icon_state="CEdgeTop"
					density=1
				Bottom
					icon_state="CEdgeB"
					density=1
				BottomRight
					//layer=MOB_LAYER+6
					icon_state="CEdgeBR"
					density=1
				BottomLeft
					//layer=MOB_LAYER+6
					icon_state="CEdgeBL"
					density=1
				VeryBottomRight
					icon_state="CEdgeVBR"
					density=1
				VeryBottomLeft
					icon_state="CEdgeVBL"
					density=1
				VeryTopRight
					icon_state="CEdgeVTR"
					density=1
				VeryTopLeft
					icon_state="CEdgeVTL"
					density=1
		PebbleStones
			icon_state="dirtst"
			//Hengable=1
			New()
				var/list/dir_list=list(NORTH,EAST,WEST,SOUTH)
				src.dir=pick(dir_list)
				var/list/state_list=list("dirtst","dirtst2","dirtst3","rock2","rock3")
				src.icon_state=pick(state_list)
				if(src.icon_state=="rock3")
					src.density=1
				..()
			/*Entered(var/mob/player/M)
				if(istype(M,/mob))
					if(src.icon_state=="rock1")
						if(M.dashable<>2)
							M.injutsu=1
						spawn(4)M.injutsu=0
					if(src.icon_state=="rock2")
						if(M.dashable<>2)
							M.injutsu=1
						spawn(8) if(M) M.injutsu=0
					if(M.injutsu==0&&M.dashable<>2)
						if(M.stepcounter==3&&M.speeddelay==2)
							M.stepcounter=0
							if(M.foot=="Left")
								view(M,6) << sound('Sounds/Walk/man_fs_l_mt_drt.ogg',0,0,0,25)
								M.foot="Right"
							else
								if(M.foot=="Right")
									view(M,6) << sound('Sounds/Walk/man_fs_r_mt_drt.ogg',0,0,0,25)
									M.foot="Left"
						else
							if(M.stepcounter==5&&M.speeddelay==1.5)
								M.stepcounter=0
								if(M.foot=="Left")
									view(M,6) << sound('Sounds/Walk/man_fs_l_mt_drt.ogg',0,0,0,25)
									M.foot="Right"
								else
									if(M.foot=="Right")
										view(M,6) << sound('Sounds/Walk/man_fs_r_mt_drt.ogg',0,0,0,25)
										M.foot="Left"
							else
								M.stepcounter++*/


obj/Ground
	name=""
	Trees
		layer=MOB_LAYER+6
		New()
			src.dir=pick(NORTH,EAST,WEST,SOUTH)
		MidPineTree
			icon='TreeMidd1.dmi'
			icon_state="r"
		MidPineTree2
			icon='TreePine.dmi'
			icon_state="r"
		MidTree2
			icon='Tree2.dmi'
			icon_state="r"
		MidTree3
			icon='Tree3.dmi'
			icon_state="r"
		MidTree4
			icon='Tree4.dmi'
			icon_state="r"
		MidPineTreeEnd
			icon='TreeMidd1.dmi'
			icon_state="end"
			layer=OBJ_LAYER
			New()
				src.dir=pick(NORTH,EAST,WEST,SOUTH)
				var/obj/Top= new/obj/Ground/Trees/MidPineTree(src.loc)
				Top.dir=src.dir
				src.overlays+=Top
		MidPineTreeEnd2
			icon='TreePine.dmi'
			icon_state="end"
			layer=OBJ_LAYER
			New()
				src.dir=pick(NORTH,EAST,WEST,SOUTH)
				//var/obj/Top = image('TreePine.dmi',src,icon_state="r",layer=MOB_LAYER+6)
				var/obj/Top= new/obj/Ground/Trees/MidPineTree2(src.loc)
				Top.dir=src.dir
				src.overlays+=Top
		MidTree2End
			icon='Tree2.dmi'
			icon_state="end"
			layer=OBJ_LAYER
			New()
				src.dir=pick(NORTH,EAST,WEST,SOUTH)
				var/obj/Top= new/obj/Ground/Trees/MidTree2(src.loc)
				Top.dir=src.dir
				src.overlays+=Top
		MidTree3End
			icon='Tree3.dmi'
			icon_state="end"
			layer=OBJ_LAYER
			New()
				src.dir=pick(NORTH,EAST,WEST,SOUTH)
				var/obj/Top= new/obj/Ground/Trees/MidTree3(src.loc)
				Top.dir=src.dir
				src.overlays+=Top
		MidTree4End
			icon='Tree4.dmi'
			icon_state="end"
			layer=OBJ_LAYER
			New()
				src.dir=pick(NORTH,EAST,WEST,SOUTH)
				var/obj/Top= new/obj/Ground/Trees/MidTree4(src.loc)
				Top.dir=src.dir
				src.overlays+=Top
	Flowers
		icon='Flowers.dmi'
		layer=TURF_LAYER+3
		//Hengable=1
		/*Entered(var/mob/player/M)
			if(istype(M,/mob))
				if(M.foot=="Left")
					view(M,13) << sound('Sounds/Walk/man_fs_l_mt_drt.ogg',0,0,0,25)
					M.foot="Right"
				else
					view(M,13) << sound('Sounds/Walk/man_fs_r_mt_drt.ogg',0,0,0,25)
					M.foot="Left"*/
		Flower1
			icon_state="2"
			New()
				src.pixel_x+=rand(3,30)
				src.pixel_x-=rand(3,30)
				src.pixel_y+=rand(1,5)
				..()
		Flower2
			icon_state="3"
			New()
				src.pixel_x+=rand(3,30)
				src.pixel_x-=rand(3,30)
				src.pixel_y+=rand(1,5)
				..()
		Flower3
			icon_state="3"
			New()
				src.pixel_x+=rand(3,30)
				src.pixel_x-=rand(3,30)
				src.pixel_y+=rand(1,5)
				..()
		Flower4
			icon_state="4"
			New()
				src.pixel_x+=rand(3,30)
				src.pixel_x-=rand(3,30)
				src.pixel_y+=rand(1,5)
				..()
		Flower5
			icon_state="5"
			New()
				src.pixel_x+=rand(3,30)
				src.pixel_x-=rand(3,30)
				src.pixel_y+=rand(1,5)
				..()
		Flower6
			icon_state="6"
			New()
				src.pixel_x+=rand(3,30)
				src.pixel_x-=rand(3,30)
				src.pixel_y+=rand(1,5)
				..()
/*turf
	Ground
		icon='GRND.dmi'
		Trees
			MTree1
				icon='NTree1.dmi'
				B1
					icon_state="1,0"
					density=1
					layer=TURF_LAYER+2
					pixel_x=-32
				B2
					icon_state="2,0"
					density=1
					layer=TURF_LAYER+2
					New()
						..()
						src.dir=pick(NORTH,EAST,WEST,SOUTH)
						if(src.dir==NORTH||src.dir==SOUTH)
							src.overlays+=/turf/Ground/Trees/MTree1/B1
							src.overlays+=/turf/Ground/Trees/MTree1/B3
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left2/B02
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left2/B03
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left2/B05
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left/B11
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left/B12
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left/B13
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left/B14
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left/B15
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Left/B16
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Middle/B21
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Middle/B22
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Middle/B23
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Middle/B24
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Middle/B25
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Middle/B26
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right/B31
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right/B32
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right/B33
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right/B34
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right/B35
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right/B36
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right2/B43
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right2/B44
							src.overlays+=/turf/Ground/Trees/MTree1/Overlays/Right2/B45
						else
							if(src.dir==WEST)
								src.icon='NTree2.dmi'
								src.overlays+=/turf/Ground/Trees/MTree2/B1
								src.overlays+=/turf/Ground/Trees/MTree2/B3
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left2/B02
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left2/B03
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left2/B05
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B11
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B12
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B13
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B14
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B15
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B16
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B21
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B22
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B23
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B24
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B25
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B26
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B31
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B32
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B33
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B34
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B35
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B36
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right2/B43
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right2/B44
								src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right2/B45
							else
								if(src.dir==EAST)
									src.icon='NTree3.dmi'
									src.overlays+=/turf/Ground/Trees/MTree3/B1
									src.overlays+=/turf/Ground/Trees/MTree3/B3
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left2/B03
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B11
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B12
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B13
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B14
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B15
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B21
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B22
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B23
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B24
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B25
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B26
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Right/B32
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Right/B33
									src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Right/B34
				B3
					icon_state="3,0"
					density=1
					layer=TURF_LAYER+2
					pixel_x=32
				Overlays
					layer=MOB_LAYER+6
					Left2
						B02
							icon_state = "0,2"
							pixel_x=-64
							pixel_y=64
						B03
							icon_state = "0,3"
							pixel_x=-64
							pixel_y=96
						B05
							icon_state = "0,5"
							pixel_x=-64
							pixel_y=160
					Left
						B11
							icon_state = "1,1"
							pixel_x=-32
							pixel_y=32
						B12
							icon_state = "1,2"
							pixel_x=-32
							pixel_y=64
						B13
							icon_state = "1,3"
							pixel_x=-32
							pixel_y=96
						B14
							icon_state = "1,4"
							pixel_x=-32
							pixel_y=128
						B15
							icon_state = "1,5"
							pixel_x=-32
							pixel_y=160
						B16
							icon_state = "1,6"
							pixel_x=-32
							pixel_y=192
					Middle
						B21
							icon_state = "2,1"
							pixel_y=32
						B22
							icon_state = "2,2"
							pixel_y=64
						B23
							icon_state = "2,3"
							pixel_y=96
						B24
							icon_state = "2,4"
							pixel_y=128
						B25
							icon_state = "2,5"
							pixel_y=160
						B26
							icon_state = "2,6"
							pixel_y=192
					Right
						B31
							icon_state = "3,1"
							pixel_x=32
							pixel_y=32
						B32
							icon_state = "3,2"
							pixel_x=32
							pixel_y=64
						B33
							icon_state = "3,3"
							pixel_x=32
							pixel_y=96
						B34
							icon_state = "3,4"
							pixel_x=32
							pixel_y=128
						B35
							icon_state = "3,5"
							pixel_x=32
							pixel_y=160
						B36
							icon_state = "3,6"
							pixel_x=32
							pixel_y=192
					Right2
						B43
							icon_state = "4,3"
							pixel_x=64
							pixel_y=96
						B44
							icon_state = "4,4"
							pixel_x=64
							pixel_y=128
						B45
							icon_state = "4,5"
							pixel_x=64
							pixel_y=160
			MTree2
				icon='NTree2.dmi'
				B1
					icon_state="1,0"
					density=1
					layer=TURF_LAYER+2
					pixel_x=-32
				B2
					icon_state="2,0"
					density=1
					layer=TURF_LAYER+2
					New()
						..()
						//var/obj/TL=new /turf/Ground/Trees/MTree1/B1(src.loc)
						//TL.loc=locate(src.x-1,src.y,src.z)
						//var/obj/TR=new /turf/Ground/Trees/MTree1/B3(src.loc)
						//TR.loc=locate(src.x+1,src.y,src.z)
						//for(var/turf/Ground/Trees/MTree1/Overlays/TO in world.MT1)
						src.overlays+=/turf/Ground/Trees/MTree2/B1
						src.overlays+=/turf/Ground/Trees/MTree2/B3
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left2/B02
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left2/B03
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left2/B05
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B11
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B12
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B13
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B14
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B15
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Left/B16
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B21
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B22
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B23
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B24
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B25
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Middle/B26
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B31
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B32
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B33
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B34
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B35
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right/B36
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right2/B43
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right2/B44
						src.overlays+=/turf/Ground/Trees/MTree2/Overlays/Right2/B45
				B3
					icon_state="3,0"
					density=1
					layer=TURF_LAYER+2
					pixel_x=32
				Overlays
					layer=MOB_LAYER+6
					Left2
						B02
							icon_state = "0,2"
							pixel_x=-64
							pixel_y=64
						B03
							icon_state = "0,3"
							pixel_x=-64
							pixel_y=96
						B05
							icon_state = "0,5"
							pixel_x=-64
							pixel_y=160
					Left
						B11
							icon_state = "1,1"
							pixel_x=-32
							pixel_y=32
						B12
							icon_state = "1,2"
							pixel_x=-32
							pixel_y=64
						B13
							icon_state = "1,3"
							pixel_x=-32
							pixel_y=96
						B14
							icon_state = "1,4"
							pixel_x=-32
							pixel_y=128
						B15
							icon_state = "1,5"
							pixel_x=-32
							pixel_y=160
						B16
							icon_state = "1,6"
							pixel_x=-32
							pixel_y=192
					Middle
						B21
							icon_state = "2,1"
							pixel_y=32
						B22
							icon_state = "2,2"
							pixel_y=64
						B23
							icon_state = "2,3"
							pixel_y=96
						B24
							icon_state = "2,4"
							pixel_y=128
						B25
							icon_state = "2,5"
							pixel_y=160
						B26
							icon_state = "2,6"
							pixel_y=192
					Right
						B31
							icon_state = "3,1"
							pixel_x=32
							pixel_y=32
						B32
							icon_state = "3,2"
							pixel_x=32
							pixel_y=64
						B33
							icon_state = "3,3"
							pixel_x=32
							pixel_y=96
						B34
							icon_state = "3,4"
							pixel_x=32
							pixel_y=128
						B35
							icon_state = "3,5"
							pixel_x=32
							pixel_y=160
						B36
							icon_state = "3,6"
							pixel_x=32
							pixel_y=192
					Right2
						B43
							icon_state = "4,3"
							pixel_x=64
							pixel_y=96
						B44
							icon_state = "4,4"
							pixel_x=64
							pixel_y=128
						B45
							icon_state = "4,5"
							pixel_x=64
							pixel_y=160
			MTree3
				icon = 'NTree3.dmi'
				icon_state = ""
				B1
					icon_state = "1,0"
					pixel_x=-32
					layer=TURF_LAYER+2
				B2
					icon_state = "2,0"
					density=1
					layer=TURF_LAYER+2
					New()
						..()
						src.overlays+=/turf/Ground/Trees/MTree3/B1
						src.overlays+=/turf/Ground/Trees/MTree3/B3
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left2/B03
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B11
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B12
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B13
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B14
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Left/B15
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B21
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B22
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B23
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B24
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B25
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Middle/B26
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Right/B32
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Right/B33
						src.overlays+=/turf/Ground/Trees/MTree3/Overlays/Right/B34
				B3
					icon_state = "3,0"
					layer=TURF_LAYER+2
					pixel_x=32
				Overlays
					layer=MOB_LAYER+6
					Left2
						B03
							icon_state = "0,3"
							pixel_x=-64
							pixel_y=96
					Left
						B11
							icon_state = "1,1"
							pixel_x=-32
							pixel_y=32
						B12
							icon_state = "1,2"
							pixel_x=-32
							pixel_y=64
						B13
							icon_state = "1,3"
							pixel_x=-32
							pixel_y=96
						B14
							icon_state = "1,4"
							pixel_x=-32
							pixel_y=128
						B15
							icon_state = "1,5"
							pixel_x=-32
							pixel_y=160
					Middle
						B21
							icon_state = "2,1"
							pixel_y=32
						B22
							icon_state = "2,2"
							pixel_y=64
						B23
							icon_state = "2,3"
							pixel_y=96
						B24
							icon_state = "2,4"
							pixel_y=128
						B25
							icon_state = "2,5"
							pixel_y=160
						B26
							icon_state = "2,6"
							pixel_y=192
					Right
						B32
							icon_state = "3,2"
							pixel_x=32
							pixel_y=64
						B33
							icon_state = "3,3"
							pixel_x=32
							pixel_y=96
						B34
							icon_state = "3,4"
							pixel_x=32
							pixel_y=128
			NPTree
				icon = 'NPTree.dmi'
				icon_state = ""
				B1
					icon_state = "1,0"
					layer=TURF_LAYER+2
					pixel_x=-32
				B2
					icon_state = "2,0"
					layer=TURF_LAYER+2
					density=1
					New()
						..()
						src.overlays+=/turf/Ground/Trees/NPTree/B1
						src.overlays+=/turf/Ground/Trees/NPTree/B3
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left2/B02
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left2/B03
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left2/B04
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left/B11
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left/B12
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left/B13
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left/B14
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left/B15
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Left/B16
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Middle/B21
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Middle/B22
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Middle/B23
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Middle/B24
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Middle/B25
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Middle/B26
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right/B31
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right/B32
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right/B33
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right/B34
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right/B35
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right2/B42
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right2/B43
						src.overlays+=/turf/Ground/Trees/NPTree/Overlays/Right2/B44
				B3
					icon_state = "3,0"
					layer=TURF_LAYER+2
					pixel_x=32
				Overlays
					layer=MOB_LAYER+6
					Left2
						B02
							icon_state = "0,2"
							pixel_x=-64
							pixel_y=64
						B03
							icon_state = "0,3"
							pixel_x=-64
							pixel_y=96
						B04
							icon_state = "0,4"
							pixel_x=-64
							pixel_y=128
					Left
						B11
							icon_state = "1,1"
							pixel_x=-32
							pixel_y=32
						B12
							icon_state = "1,2"
							pixel_x=-32
							pixel_y=64
						B13
							icon_state = "1,3"
							pixel_x=-32
							pixel_y=96
						B14
							icon_state = "1,4"
							pixel_x=-32
							pixel_y=128
						B15
							icon_state = "1,5"
							pixel_x=-32
							pixel_y=160
						B16
							icon_state = "1,6"
							pixel_x=-32
							pixel_y=192
					Middle
						B21
							icon_state = "2,1"
							pixel_y=32
						B22
							icon_state = "2,2"
							pixel_y=64
						B23
							icon_state = "2,3"
							pixel_y=96
						B24
							icon_state = "2,4"
							pixel_y=128
						B25
							icon_state = "2,5"
							pixel_y=160
						B26
							icon_state = "2,6"
							pixel_y=192
					Right
						B31
							icon_state = "3,1"
							pixel_x=32
							pixel_y=32
						B32
							icon_state = "3,2"
							pixel_x=32
							pixel_y=64
						B33
							icon_state = "3,3"
							pixel_x=32
							pixel_y=96
						B34
							icon_state = "3,4"
							pixel_x=32
							pixel_y=128
						B35
							icon_state = "3,5"
							pixel_x=32
							pixel_y=160
					Right2
						B42
							icon_state = "4,2"
							pixel_x=64
							pixel_y=64
						B43
							icon_state = "4,3"
							pixel_x=64
							pixel_y=96
						B44
							icon_state = "4,4"
							pixel_x=64
							pixel_y=128*/






















