mob
	var
		poison=0
		poisontype=list()//any tpye of poison you have will go in this list




obj
	PotionCrafter
		icon = 'Food.dmi'
		icon_state="VendingMachine"
		density=1
		Click()
			if(usr in view(1,src))
				switch(alert(usr,"Would you like to craft a potion?","Potion Craft","Yes","No"))
					if("Yes")
						var/divider=0
						var/results=0
						var/inpotion=list()
						var/PupList = list()
						for(var/obj/food/C in usr.contents)
							PupList += C
						var/numberin=0
						goon
						var/T=input("Which 3 things do you want this potion to have?(if you add foods that you don't want and decide to cancel the creation everything added is forever lost)","Potion Craft") in list("Done") + PupList + list("Random","Cancel")
						if(T=="Cancel")
							return
						if(numberin>=3)
							T="Done"
						else if(T=="Random")
							for(var/obj/food/S in usr.contents)
								if(numberin<=3&&S)
									if(prob(60))
										usr<<"[S] Added."
										results+=S.fillamm
										inpotion+=S
										numberin+=1
										del S
								sleep(1)
							goto goon
						else if(T=="Done")
							//var/results=0
							//var/divider=0
							//for(var/obj/food/H in inpotion)
								//results+=H.fillamm
								//inpotion-=H
								//divider+=1
							if(divider<=0)
								divider=1
							results=round(results/divider)
							if(results>=20&&usr.special!="Potions")
								results=20
							if(results<=-20&&usr.special!="Potions")
								results=-20
							if(results>=50)
								results=50
							if(results<=-50)
								results=-50
							var/obj/potion/B = new(usr)
							B.loc=usr
							B.fillamm=results
							B.value=results*10
							B.name="Potion [rand(1,99)](Type:[B.fillamm])"
							usr<<"<font color=green><b>You have created [B]</b>."
							oview(1,usr)<<"[usr] has created a potion."
							if(B.fillamm<=0)
								B.icon_state="beer"
							else
								B.icon_state="sake"
						else
							if(T)
								var/obj/Y = T
								usr<<"[Y] Added."
								inpotion+=Y
								results+=Y.fillamm
								divider+=1
								del Y
								goto goon

obj
	potion
		icon='Food.dmi'
		icon_state="26"
		value=10
		fillamm=0
		Click()
			if(src in usr.contents)
				usr.health+=src.fillamm*50
				oview(usr)<<"[usr] drinks a potion."
				usr<<"You drink [src]."
				del src


obj
	skill
		poisonmake
			verb
				poisonmake()//for specilists they can create small poisons on the go
					set category = "Commands"
					set name = "Craft Poison"



