obj
	var
		value = 5
		fillamm=0
	food
		icon='Food.dmi'
		banana
			icon_state="26"
			value=150
			fillamm=10

		grapes
			icon_state="25"
			value=180
			fillamm=16

		burger
			icon_state="4"
			value=200
			fillamm=18

		soup
			icon_state="soup"
			value=250
			fillamm=28

		carrot
			icon_state="carrot"
			value=150
			fillamm=12

		cookie
			icon_state="CocoChips"
			value=175
			fillamm=14
		///------------ramen types----------
		ramen
			icon_state="11"
			value=100
			fillamm=26
		noodles
			icon_state="10"
			value=80
			fillamm=18
		shioramen
			icon_state="11"
			value=158
			fillamm=34
		tonkotsuramen
			icon_state="11"
			value=150
			fillamm=32
		kurumeramen
			icon_state="11"
			value=180
			fillamm=36
		wakayamaramen
			icon_state="11"
			value=600
			fillamm=40
		/////--------------------------------
		porridge
			icon_state="soup"
			value=200
			fillamm=16
		ribs
			icon_state="16"
			value=350
			fillamm=38
		spareribs
			icon_state="16"
			value=375
			fillamm=33
		ricebowl
			icon_state="rice"
			value=100
			fillamm=12
		sushi
			icon_state="rice2"
			value=75
			fillamm=9
		riceball
			icon_state="18"
			value=175
			fillamm=15
		friedrice
			icon_state="19"
			value=200
			fillamm=28
		kayu//rice porridge
			icon_state="20"
			value=250
			fillamm=32
		udon//noodles
			icon_state="10"
			value=200
			fillamm=10
		somen//thin noodles
			icon_state="10"
			value=210
			fillamm=11
		yakisoba//grilled or fried chinese style noodles
			icon_state="11"
			value=250
			fillamm=24
		oden//a colaborationg of fishcakes, daikon, boiled eggs etc
			icon_state="15"
			value=600
			fillamm=28
		sukiyaki
			icon_state="14"
			value=375
			fillamm=14
		chankonabe//very large meal ususally for sumo wrestlers
			icon_state="17"
			value=500
			fillamm=25
		//------------meats--------
		yakitori//grilled chiken pieces
			icon_state="15"
			value=250
			fillamm=13
		tonkatsu
			icon_state="12"
			value=300
			fillamm=15
		takiniku//grilled meat
			icon_state="12"
			value=180
			fillamm=16
		nikujaga
			icon_state="leg"
			value=230
			fillamm=19
		teppanyaki//a meat used in many recipies
			icon_state="steak"
			value=150
			fillamm=9
		//--------------soybean dishes--------------
		hiyayakko
			icon_state="10"
			value=220
			fillamm=15
		yudofu//tofu pieces boiled in a clear mild soup
			icon_state="rice2"
			value=300
			fillamm=11
		misosoup//misopast dissolved into fish stock
			icon_state="soup"
			value=160
			fillamm=20
		//-----------Others--------------
		bento//boxed meals
			icon_state="boxfood"
			value=400
			fillamm=23
		korokke//chicken nuggets
			icon_state="15"
			value=120
			fillamm=12

		//-----------drinks-----------
		sake//alchohal
			icon_state="beer"
			value=375
			fillamm=8
		mugicha// brown tea
			icon_state="sake"
			value=120
			fillamm=14
		sobachatea//wheat type tea
			icon_state="sake"
			value=165
			fillamm=13
		aojiru//green vege drink
			icon_state="sake"
			value=180
			fillamm=22
		sakuratea//clear withflower inside
			icon_state="water"
			value=180
			fillamm=9
		kombuchatea//light brown
			icon_state="sake"
			value=165
			fillamm=18
		Click()
			if(src in usr.contents)
				if(usr.stomachamm>=usr.stomachMamm)
					usr<<"Your not hungry right now."
					return
				else
					usr.stomachamm+=src.fillamm
					view()<<"[usr] consumes [src]."
					del src




obj/materials
	chakrapaper
		icon='wskillcards.dmi'
		icon_state="ChakraPaper"
		verb
			Look()
				var/Desc="This is a Chakra Paper. By placing your chakra into it, you can understand what your element is and begin element training."
				usr<<"[Desc]"
			Convert()
				usr<<"You place a little bit of your Chakra into the Chakra Paper. Wait for a litte bit."
				sleep(100)
				if(usr.ninknowledge<10)
					usr<<"Nothing happened. (You need more Ninjutsu Knowledge(10) before you can gain an element.)"
					return
				if(usr.element=="None")
					usr.element=pick("Doton","Katon","Fuuton","Suiton","Raiton")
					usr.SaveK()
					sleep(5)
				if(usr.element=="Katon")
					usr<<"The paper begins to burn."
					sleep(10)
					usr<<"You have Katon Chakra Nature!"
					del(src)
				if(usr.element=="Suiton")
					usr<<"The paper becomes wet."
					sleep(10)
					usr<<"You have Suiton Chakra Nature!"
					del(src)
				if(usr.element=="Fuuton")
					usr<<"The paper rips in two."
					sleep(10)
					usr<<"You have Fuuton Chakra Nature!"
					del(src)
				if(usr.element=="Doton")
					usr<<"The paper fell apart."
					sleep(10)
					usr<<"You have Doton Chakra Nature!"
					del(src)
				if(usr.element=="Raiton")
					usr<<"The paper crumbled up."
					sleep(10)
					usr<<"You have Raiton Chakra Nature!"
					del(src)








obj
	var
		hason=0
		colorable=1
		bought=0
	clothes
		shirt
			icon='Shirt.dmi'
			value=250
		pants
			icon='pants.dmi'
			value=250
		baggypants
			icon='BaggyPants.dmi'
			value=300
		shoes
			icon='Cloths.dmi'
			value=80
		shorts
			icon='Shorts.dmi'
			value=180
		sleeveless_shirt
			icon='Sleeveless Shirt.dmi'
			value=180
		longsleeve_shirt
			icon='SasukeShirt.dmi'
			value=300
		scarf
			icon='Scarf.dmi'
			value=150
		jacket
			icon='JacketClosed.dmi'
			value=300
		cloak
			icon='Cloak.dmi'
			value=1000
		gloves
			icon='gloves.dmi'
			value=160
		large_gloves
			icon='glovesL.dmi'
			value=180
		mask
			icon='kakashi mask.dmi'
			value=200
		ninjahat
			icon='NinjaHat.dmi'
			value=500
		Click()
			if(src.hason == 1)
				src:hason = 0
				usr.overlays -= src.icon
				usr << "You remove the [src]."
				//usr.wearingtayuyaflute = 0
				src.suffix = ""
			else
				if(src in usr.contents)
					src:hason = 1
					usr << "You wear the [src]."
					src.suffix = "Equipped"
					//usr.wearingtayuyaflute = 1
					usr.overlays -= src.icon
					usr.overlays += src.icon//temp icon
		verb
			Colorize(c as color)
				if(src:hason)
					usr<<"Take it off first."
					return
				else
					if(src:colorable)
						src.icon+=c
					else
						usr<<"[src] is not colorable."






obj
	hairstyles
		afro
			icon='AfroH.dmi'
			value=50
		parted
			icon='PartedH.dmi'
			value=51
		lee
			icon='leeH.dmi'
			value=53
		kakashi
			icon='KakashiH.dmi'
			value=70
		izuna
			icon='JrockH.dmi'
			value=65
		deidara
			icon='DeidaraH.dmi'
			value=65
		kimmimaru
			icon='KimimaroH.dmi'
			value=70
		madara
			icon='MadaraH.dmi'
			value=90
		kira
			icon='KiraH.dmi'
			value=50
		ino
			icon='InoH.dmi'
			value=50
		itachi
			icon='itachiH.dmi'
			value=50
		orochimaru
			icon='OrochimaruH.dmi'
			value=75
		temari
			icon='TemariH.dmi'
			value=50
		mei
			icon='MizukageH.dmi'
			value=50
		wild
			icon='WildH.dmi'
			value=50
		wind
			icon='WindH.dmi'
			value=50
		wolverine
			icon='WolverineH.dmi'
			value=60
		tousen
			icon='TousenH.dmi'
			value=50
		sasuke
			icon='SasukeH.dmi'
			value=50
		sasukeTS
			icon='SasukeTS.dmi'
			value=50
		messy1
			icon='RandomKarnHair.dmi'
			value=50
		messy2
			icon='MessyH.dmi'
			value=50
		mohawk
			icon='Mohawk.dmi'
			value=50
		long
			icon='PainbodyH.dmi'
			value=50
		spikey
			icon='narutoH.dmi'
			value=50
		spikey2
			icon='MinatoH.dmi'
			value=50
		spikey3
			icon='SpikeyH.dmi'
			value=50
		temari
			icon='TemariH.dmi'
			value=50












obj/materials
	icon='Items.dmi'
	var
		ammount=1
	paper
		icon_state="Paper"
		//OriginalName="Paper"
		value=15
		var
			Message=""
		Click()
			if(src.Message!="")
				usr<<"[src.Message]"
				return
			var/HaveInk=0
			for(var/obj/materials/ink/A in usr.contents)
				HaveInk=1
			if(!HaveInk)
				usr<<"You need to have Ink to write something on the paper."
			else
				usr<<"What do you want to write?"
				src.Message=input("Write down the message on the Paper.","Paper",src.Message)
		verb
			Get()
				set src in oview(1)
				if(src.ammount==1)
					usr<<"You picked up a [src]"
				else
					usr<<"You picked up some [src]."
				var/counter=0
				for(var/obj/materials/paper/O in usr.contents)
					counter+=1
				if(counter<=0)
					Move(usr)
				else
					for(var/obj/materials/paper/O in usr.contents)
						O.ammount+=src.ammount
						O.suffix="([O.ammount+src.ammount])"
						//O.ReCheckAmount()
						del(src)

	ink
		icon_state="Ink"
		//OriginalName="Ink"
		value=20
		verb
			Get()
				set src in oview(1)
				if(src.ammount==1)
					usr<<"You picked up a [src]"
				else
					usr<<"You picked up some [src]."
				var/counter=0
				for(var/obj/materials/ink/O in usr.contents)
					counter+=1
				if(counter<=0)
					Move(usr)
				else
					for(var/obj/materials/ink/O in usr.contents)
						O.ammount+=src.ammount
						O.suffix="([O.ammount+src.ammount])"
						//O.ReCheckAmount()
						del(src)
	clay
		icon_state="Clay"
		//OriginalName="Clay"
		value=20
		verb
			Get()
				set src in oview(1)
				if(src.ammount==1)
					usr<<"You picked up a [src]"
				else
					usr<<"You picked up some [src]."
				var/counter=0
				for(var/obj/materials/clay/O in usr.contents)
					counter+=1
				if(counter<=0)
					Move(usr)
				else
					for(var/obj/materials/clay/O in usr.contents)
						O.ammount+=src.ammount
						O.suffix="([O.ammount+src.ammount])"
						//O.ReCheckAmount()
						del(src)





obj
	weapons
		kunai
			icon='kunai.dmi'
			icon_state="TheWeapon"
			value=4500
		katana
			icon='KatanaO.dmi'
			icon_state="TheWeapon"
			value=8000
		bostaff//rock only sellers
			icon='BoStaff.dmi'
			icon_state=""
			value=13000
		Click()
			if(usr.weapon!="")
				usr.weapon=""
				usr.overlays-=usr.weaponoverlays
				usr.overlays-=usr.weaponoverlays
				usr.overlays-=usr.weaponoverlays
				usr<<"You remove your [usr.weapon]."
				usr.weaponoverlays=null
			else
				usr.overlays+=src.icon
				usr.weaponoverlays+=src.icon
				usr.weapon="[src]"
				usr<<"You equipt [src]."