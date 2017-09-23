


/////make the npc sell whats in his inventory and each item just has a value
//do it so u choose what u want to buy then it tells you price and if you want to buy it etc
//using the list thingy with the adding of the contents
//make sellign possible but only to what that npc will take
//food npc only take food
//weapon npc only take weapons
//etc

mob
	var
		merchant=0

//////////---------------------------------------

//make a wondering sells man, he spawns with nothing but will buy your items for better prices than they are worth >>>>sometimes<<<<(use prob and pick)
//sells items for outragious prices though
//pawn shop kind of guy
//always moving but not very fast


/////////----------------------------------------

mob
	proc
		stockstore()
			var/mob/M = src
			if(M.merchant)
				if(istype(M,/mob/sellers/FoodMerchant))
					var/foods=0
					for(var/obj/food/A in M.contents)
						foods+=1
					var/payed=0
					if(foods<=3)
						if(M.village=="Leaf")
							if(LeafVillagePool>=751)
								LeafVillagePool-=750
								payed=1
						if(M.village=="Rock")
							if(RockVillagePool>=751)
								RockVillagePool-=750
								payed=1
						if(M.village=="Rain")
							if(RainVillagePool>=751)
								RainVillagePool-=750
								payed=1
						if(M.village=="Sound")
							if(SoundVillagePool>=751)
								SoundVillagePool-=750
								payed=1
						if(M.village=="Waterfall")
							if(WaterfallVillagePool>=751)
								WaterfallVillagePool-=750
								payed=1
						if(M.village=="Cloud")
							if(CloudVillagePool>=751)
								CloudVillagePool-=750
								payed=1
						if(M.village=="Sand")
							if(SandVillagePool>=751)
								SandVillagePool-=750
								payed=1
						if(payed>=1)
							spawn(rand(1,100))
								var/stocking=rand(4,7)
								while(stocking)
									var/obj/food/banana/S = new(M)
									S.loc=M
									var/obj/food/grapes/F = new(M)
									F.loc=M
									var/obj/food/burger/B = new(M)
									B.loc=M
									stocking-=1
									sleep(1)
				if(istype(M,/mob/sellers/Ichiraku_Ramen))
					var/foods=0
					for(var/obj/food/A in M.contents)
						foods+=1
					var/payed=0
					if(foods<=3)
						if(M.village=="Leaf")
							if(LeafVillagePool>=751)
								LeafVillagePool-=750
								payed=1
						if(M.village=="Rock")
							if(RockVillagePool>=751)
								RockVillagePool-=750
								payed=1
						if(M.village=="Rain")
							if(RainVillagePool>=751)
								RainVillagePool-=750
								payed=1
						if(M.village=="Sound")
							if(SoundVillagePool>=751)
								SoundVillagePool-=750
								payed=1
						if(M.village=="Waterfall")
							if(WaterfallVillagePool>=751)
								WaterfallVillagePool-=750
								payed=1
						if(M.village=="Cloud")
							if(CloudVillagePool>=751)
								CloudVillagePool-=750
								payed=1
						if(M.village=="Sand")
							if(SandVillagePool>=751)
								SandVillagePool-=750
								payed=1
						if(payed>=1)
							spawn(rand(1,100))
								var/stocking=rand(4,7)
								while(stocking)
									var/obj/food/ramen/S = new(src)
									S.loc=src
									var/obj/food/noodles/F = new(src)
									F.loc=src
									var/obj/food/tonkotsuramen/B = new(src)
									B.loc=src
									if(prob(18))
										var/obj/food/shioramen/R = new(src)
										R.loc=src
									if(prob(8))
										var/obj/food/kurumeramen/R = new(src)
										R.loc=src
									if(prob(5))
										var/obj/food/wakayamaramen/R = new(src)
										R.loc=src
									stocking-=1
									sleep(1)
				if(istype(M,/mob/sellers/ClothesMerchant))
					var/clothes=0
					for(var/obj/clothes/A in M.contents)
						clothes+=1
					var/payed=0
					if(clothes<=7)
						if(M.village=="Leaf")
							if(LeafVillagePool>=751)
								LeafVillagePool-=750
								payed=1
						if(M.village=="Rock")
							if(RockVillagePool>=751)
								RockVillagePool-=750
								payed=1
						if(M.village=="Rain")
							if(RainVillagePool>=751)
								RainVillagePool-=750
								payed=1
						if(M.village=="Sound")
							if(SoundVillagePool>=751)
								SoundVillagePool-=750
								payed=1
						if(M.village=="Waterfall")
							if(WaterfallVillagePool>=751)
								WaterfallVillagePool-=750
								payed=1
						if(M.village=="Cloud")
							if(CloudVillagePool>=751)
								CloudVillagePool-=750
								payed=1
						if(M.village=="Sand")
							if(SandVillagePool>=751)
								SandVillagePool-=750
								payed=1
						if(payed>=1)
							spawn(rand(1,100))
								var/stocking=rand(4,7)
								while(stocking)
									var/obj/food/ramen/S = new(src)
									S.loc=src
									var/obj/food/noodles/F = new(src)
									F.loc=src
									var/obj/food/tonkotsuramen/B = new(src)
									B.loc=src
									if(prob(18))
										var/obj/food/shioramen/R = new(src)
										R.loc=src
									if(prob(8))
										var/obj/food/kurumeramen/R = new(src)
										R.loc=src
									if(prob(5))
										var/obj/food/wakayamaramen/R = new(src)
										R.loc=src
									stocking-=1
									sleep(1)









mob
	sellers
		merchant=1
		health=1000000
		Frozen=1
		FoodMerchant/////////////------------------------------------------------
			icon='Guy.dmi'
			village="None"
			New()
				..()
				spawn(1)
					src.name=pick("Sam","Jack","Fui","John","Jake")
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='AoH.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(50,50,50)
					src.icon=Base
					src.overlays-='Boxers.dmi'
					src.overlays+='Boxers.dmi'
					src.overlays-='MaleEyes.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays-='Eyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays-='LeafJounin.dmi'
					src.overlays+='LeafJounin.dmi'
					src.overlays-='Cloths.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays-='gloves.dmi'
					src.overlays+='gloves.dmi'
					src.overlays-=Hair
					src.overlays+=Hair
				spawn(rand(1,100))
					var/stocking=rand(4,7)
					while(stocking)
						var/obj/food/banana/S = new(src)
						S.loc=src
						var/obj/food/grapes/F = new(src)
						F.loc=src
						var/obj/food/burger/B = new(src)
						B.loc=src
						stocking-=1
						sleep(1)
			verb
				Speak()
					set src in oview(1)
					set category = "NPC"
					set name="Speak"
					var/taxon=0
					if(src.ko)
						usr<<"[src](Merchant) cant sell right now, hes not up for it....Literally."
						return
					if(src.village=="Leaf")
						taxon=LeafOtherTax/100
					if(src.village=="Rain")
						taxon=RainOtherTax/100
					if(src.village=="Sound")
						taxon=SoundOtherTax/100
					if(src.village=="Rock")
						taxon=RockOtherTax/100
					if(src.village=="Waterfall")
						taxon=WaterfallOtherTax/100
					if(src.village=="Sand")
						taxon=SandOtherTax/100
					if(src.village=="Cloud")
						taxon=CloudOtherTax/100
					switch(input(usr,"What would you like to do?")in list ("Buy","Sell","Nothing"))
						if("Buy")
							var/foods=0
							for(var/obj/food/F in src.contents)
								foods+=1
							if(foods<=0)
								usr<<"[src]: I dont have anything to sell you right now, sorry."
								src.stockstore()
								return
							var/foodin = list()
							for(var/obj/food/C in src.contents)
								foodin += C
							var/obj/M = input("What to buy?","[src]") in list("Nothing") + foodin// + list("Cancel")
							if(M=="Nothing")
								return
							switch(input(usr,"What would you like to buy [M] for [round(M.value+(M.value*taxon))]?")in list ("Yes","No"))
								if("Yes")
									if(usr.yen>=round(M.value+(M.value*taxon)))
										M.loc=usr
										usr.yen-=round(M.value+(M.value*taxon))
										usr<<"You buy [M] for [round(M.value+(M.value*taxon))]."
										if(src.village=="Leaf")
											LeafVillagePool+=(M.value*taxon)
										if(src.village=="Rain")
											RainVillagePool+=(M.value*taxon)
										if(src.village=="Sound")
											SoundVillagePool+=(M.value*taxon)
										if(src.village=="Rock")
											RockVillagePool+=(M.value*taxon)
										if(src.village=="Waterfall")
											WaterfallVillagePool+=(M.value*taxon)
										if(src.village=="Sand")
											SandVillagePool+=(M.value*taxon)
										if(src.village=="Cloud")
											CloudVillagePool+=(M.value*taxon)
										SaveVillageStuff()
									else
										usr<<"You dont have enough for this sorry."
										return
								else
									view(src)<<"[src]: Come again soon."
									return
						if("Sell")
							var/foods=0
							for(var/obj/food/F in usr.contents)
								foods+=1
							if(foods<=0)
								usr<<"[src]: You don't have anything I want right now, sorry."
								return
							var/foodin = list()
							for(var/obj/food/C in usr.contents)
								foodin += C
							var/obj/KL = input("What to sell?","Sell") in list("Nothing") + foodin// + list("Cancel")
							if(KL=="Nothing")
								return
							switch(input(usr,"What would you like to buy [KL] for [round(KL.value/2)]?")in list ("Yes","No"))
								if("Yes")
									KL.loc=src
									usr<<"You sell [KL] for [round(KL.value/2)]."
									usr.yen+=round(KL.value/2)
								else
									view(src)<<"[src]: Come again soon."
		Ichiraku_Ramen////////////////////------------------------------------------------------
			icon='Chef.dmi'
			village="Leaf"
			New()
				..()
				spawn(1)
					src.name="Ichiraku"
				spawn(rand(1,100))
					var/stocking=rand(4,7)
					while(stocking)
						var/obj/food/ramen/S = new(src)
						S.loc=src
						var/obj/food/noodles/F = new(src)
						F.loc=src
						var/obj/food/tonkotsuramen/B = new(src)
						B.loc=src
						if(prob(18))
							var/obj/food/shioramen/R = new(src)
							R.loc=src
						if(prob(8))
							var/obj/food/kurumeramen/R = new(src)
							R.loc=src
						if(prob(5))
							var/obj/food/wakayamaramen/R = new(src)
							R.loc=src
						stocking-=1
						sleep(1)
			verb
				Speak()
					set src in oview(1)
					set category = "NPC"
					set name="Speak"
					var/taxon=0
					if(src.ko)
						usr<<"[src] cant sell right now, hes not up for it....Literally."
						return
					if(src.village=="Leaf")
						taxon=LeafOtherTax/100
					if(src.village=="Rain")
						taxon=RainOtherTax/100
					if(src.village=="Sound")
						taxon=SoundOtherTax/100
					if(src.village=="Rock")
						taxon=RockOtherTax/100
					if(src.village=="Waterfall")
						taxon=WaterfallOtherTax/100
					if(src.village=="Sand")
						taxon=SandOtherTax/100
					if(src.village=="Cloud")
						taxon=CloudOtherTax/100
					switch(input(usr,"What would you like to do?")in list ("Buy","Nothing"))
						if("Buy")
							var/foods=0
							for(var/obj/food/F in src.contents)
								foods+=1
								break
							if(foods<=0)
								usr<<"[src]: I dont have anything to sell you right now, sorry."
								src.stockstore()
								return
							var/foodin = list()
							for(var/obj/food/C in src.contents)
								foodin += C
							var/obj/M = input("What to buy?","[src]") in list("Nothing") + foodin// + list("Cancel")
							if(M=="Nothing")
								return
							switch(input(usr,"What would you like to buy [M] for [round(M.value+(M.value*taxon))]?")in list ("Yes","No"))
								if("Yes")
									if(usr.yen>=round(M.value+(M.value*taxon)))
										M.loc=usr
										usr.yen-=round(M.value+(M.value*taxon))
										usr<<"You buy [M] for [round(M.value+(M.value*taxon))]."
										if(src.village=="Leaf")
											LeafVillagePool+=(M.value*taxon)
										if(src.village=="Rain")
											RainVillagePool+=(M.value*taxon)
										if(src.village=="Sound")
											SoundVillagePool+=(M.value*taxon)
										if(src.village=="Rock")
											RockVillagePool+=(M.value*taxon)
										if(src.village=="Waterfall")
											WaterfallVillagePool+=(M.value*taxon)
										if(src.village=="Sand")
											SandVillagePool+=(M.value*taxon)
										if(src.village=="Cloud")
											CloudVillagePool+=(M.value*taxon)
										SaveVillageStuff()
									else
										usr<<"You dont have enough for this sorry."
										return
								else
									view(src)<<"[src]: Come again soon."
									return
		ClothesMerchant/////////////------------------------------------------------
			icon='Guy.dmi'
			village="None"
			New()
				..()
				spawn(1)
					src.name="Clothes Seller"
					src.icon=null
					var/Base='Base.dmi'
					var/Hair='MinatoH.dmi'
					Base+=rgb(235,145,52)
					Hair+=rgb(50,50,50)
					src.icon=Base
					src.overlays-='Boxers.dmi'
					src.overlays+='Boxers.dmi'
					src.overlays-='MaleEyes.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays-='Eyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays-='LeafJounin.dmi'
					src.overlays+='LeafJounin.dmi'
					src.overlays-='Cloths.dmi'
					src.overlays+='Cloths.dmi'
					src.overlays-='gloves.dmi'
					src.overlays+='gloves.dmi'
					src.overlays-=Hair
					src.overlays+=Hair
				spawn(rand(2,100))
					var/obj/clothes/shirt/S = new(src)
					S.loc=src
					var/obj/clothes/pants/F = new(src)
					F.loc=src
					var/obj/clothes/shoes/B = new(src)
					B.loc=src
					var/obj/clothes/shorts/O = new(src)
					O.loc=src
					var/obj/clothes/sleeveless_shirt/U = new(src)
					U.loc=src
					var/obj/clothes/scarf/BB = new(src)
					BB.loc=src
					var/obj/clothes/jacket/L = new(src)
					L.loc=src
					var/obj/clothes/gloves/T = new(src)
					T.loc=src
					var/obj/clothes/large_gloves/H = new(src)
					H.loc=src
					var/obj/clothes/mask/BT = new(src)
					BT.loc=src
					var/obj/clothes/sleeveless_shirt/BT2 = new(src)
					BT2.loc=src
					var/obj/clothes/ninjahat/oT = new(src)
					oT.loc=src
			verb
				Speak()
					set src in oview(1)
					set category = "NPC"
					set name="Speak"
					var/taxon=0
					if(src.ko)
						usr<<"[src](Merchant) cant sell right now, hes not up for it....Literally."
						return
					if(src.village=="Leaf")
						taxon=LeafOtherTax/100
					if(src.village=="Rain")
						taxon=RainOtherTax/100
					if(src.village=="Sound")
						taxon=SoundOtherTax/100
					if(src.village=="Rock")
						taxon=RockOtherTax/100
					if(src.village=="Waterfall")
						taxon=WaterfallOtherTax/100
					if(src.village=="Sand")
						taxon=SandOtherTax/100
					if(src.village=="Cloud")
						taxon=CloudOtherTax/100
					switch(input(usr,"What would you like to do?")in list ("Buy","Sell","Nothing"))
						if("Buy")
							var/foods=0
							for(var/obj/clothes/F in src.contents)
								foods+=1
								break
							if(foods<=0)
								usr<<"[src]: I dont have anything to sell you right now, sorry."
								src.stockstore()
								return
							var/foodin = list()
							for(var/obj/clothes/C in src.contents)
								foodin += C
							var/obj/M = input("What to buy?","[src]") in list("Nothing") + foodin// + list("Cancel")
							if(M=="Nothing")
								return
							switch(input(usr,"What would you like to buy [M] for [round(M.value+(M.value*taxon))]?")in list ("Yes","No"))
								if("Yes")
									if(usr.yen>=round(M.value+(M.value*taxon)))
										if(M.bought==1)
											M.loc=usr
										else
											usr.buyitem(M.type)
										usr.yen-=round(M.value+(M.value*taxon))
										usr<<"You buy [M] for [round(M.value+(M.value*taxon))]."
										if(src.village=="Leaf")
											LeafVillagePool+=(M.value*taxon)
										if(src.village=="Rain")
											RainVillagePool+=(M.value*taxon)
										if(src.village=="Sound")
											SoundVillagePool+=(M.value*taxon)
										if(src.village=="Rock")
											RockVillagePool+=(M.value*taxon)
										if(src.village=="Waterfall")
											WaterfallVillagePool+=(M.value*taxon)
										if(src.village=="Sand")
											SandVillagePool+=(M.value*taxon)
										if(src.village=="Cloud")
											CloudVillagePool+=(M.value*taxon)
										SaveVillageStuff()
									else
										usr<<"You dont have enough for this sorry."
										return
								else
									view(src)<<"[src]: Come again soon."
									return
						if("Sell")
							var/foods=0
							for(var/obj/clothes/F in usr.contents)
								foods+=1
							if(foods<=0)
								usr<<"[src]: You don't have anything I want right now, sorry."
								return
							var/foodin = list()
							for(var/obj/clothes/C in usr.contents)
								if(C.hason==0)
									foodin += C
							var/obj/KL = input("What to sell?","Sell") in list("Nothing") + foodin// + list("Cancel")
							if(KL=="Nothing")
								return
							switch(input(usr,"What would you like to buy [KL] for [round(KL.value/2)]?")in list ("Yes","No"))
								if("Yes")
									KL.loc=src
									KL.bought=1
									usr<<"You sell [KL] for [round(KL.value/2)]."
									usr.yen+=round(KL.value/2)
								else
									view(src)<<"[src]: Come again soon."
		HairMerchant/////////////------------------------------------------------
			icon='Guy.dmi'
			village="None"
			New()
				..()
				spawn(1)
					src.name="Barber"
					src.icon='Haircuter.dmi'
				spawn(rand(5,100))
					var/obj/hairstyles/afro/S = new(src)
					S.loc=src
					var/obj/hairstyles/spikey/BP1 = new(src)
					BP1.loc=src
					var/obj/hairstyles/spikey2/BP12 = new(src)
					BP12.loc=src
					var/obj/hairstyles/spikey3/BP13 = new(src)
					BP13.loc=src
					var/obj/hairstyles/wild/fv = new(src)
					fv.loc=src
					var/obj/hairstyles/wind/fv1 = new(src)
					fv1.loc=src
					var/obj/hairstyles/wolverine/fv2 = new(src)
					fv2.loc=src
					var/obj/hairstyles/tousen/fv11 = new(src)
					fv11.loc=src
					var/obj/hairstyles/sasuke/fv12 = new(src)
					fv12.loc=src
					var/obj/hairstyles/sasukeTS/fv123 = new(src)
					fv123.loc=src
					var/obj/hairstyles/messy1/fv15 = new(src)
					fv15.loc=src
					var/obj/hairstyles/messy2/fv154 = new(src)
					fv154.loc=src
					var/obj/hairstyles/mohawk/fv25 = new(src)
					fv25.loc=src
					var/obj/hairstyles/long/fv16 = new(src)
					fv16.loc=src
					var/obj/hairstyles/temari/fv199 = new(src)
					fv199.loc=src
					var/obj/hairstyles/madara/F = new(src)
					F.loc=src
					var/obj/hairstyles/kira/B = new(src)
					B.loc=src
					var/obj/hairstyles/ino/C = new(src)
					C.loc=src
					var/obj/hairstyles/itachi/D = new(src)
					D.loc=src
					var/obj/hairstyles/orochimaru/U = new(src)
					U.loc=src
					var/obj/hairstyles/temari/I = new(src)
					I.loc=src
					var/obj/hairstyles/mei/BP = new(src)
					BP.loc=src
					var/obj/hairstyles/kimmimaru/ttt = new(src)
					ttt.loc=src
					var/obj/hairstyles/lee/tttt = new(src)
					tttt.loc=src
					var/obj/hairstyles/kakashi/tt = new(src)
					tt.loc=src
					var/obj/hairstyles/izuna/t = new(src)
					t.loc=src
					var/obj/hairstyles/deidara/a = new(src)
					a.loc=src
					var/obj/hairstyles/parted/b = new(src)
					b.loc=src
			verb
				Speak()
					set src in oview(1)
					set category = "NPC"
					set name="Speak"
					var/taxon=0
					if(src.ko)
						usr<<"[src](Merchant) cant sell right now, hes not up for it....Literally."
						return
					if(src.village=="Leaf")
						taxon=LeafOtherTax/100
					if(src.village=="Rain")
						taxon=RainOtherTax/100
					if(src.village=="Sound")
						taxon=SoundOtherTax/100
					if(src.village=="Rock")
						taxon=RockOtherTax/100
					if(src.village=="Waterfall")
						taxon=WaterfallOtherTax/100
					if(src.village=="Sand")
						taxon=SandOtherTax/100
					if(src.village=="Cloud")
						taxon=CloudOtherTax/100
					switch(input(usr,"What would you like a new hair style?")in list ("Yes","No"))
						if("Yes")
							var/hairs = list()
							for(var/obj/hairstyles/C in src.contents)
								hairs += C
							var/obj/M = input("What style?","[src]") in list("Nevermind") + hairs// + list("Cancel")
							if(M=="Nevermind")
								return
							switch(input(usr,"What would you like to buy [M] for [round(M.value+(M.value*taxon))]?")in list ("Yes","No"))
								if("Yes")
									if(usr.yen>=round(M.value+(M.value*taxon)))
										usr.hairremoval()
										var/hairred = input("How much red do you want to put into your Hair?") as num
										var/hairgreen = input("How much green do you want to put into your Hair?") as num
										var/hairblue = input("How much blue do you want to put into your Hair?") as num
										usr.overlays-=usr.hair
										usr.overlays-=usr.hair
										var/colorss=M.icon
										usr.overlays-=usr.hair
										usr.overlays-=usr.hair
										colorss += rgb(hairred,hairgreen,hairblue)
										usr.overlays-=usr.hair
										usr.overlays-=usr.hair
										usr.overlays-=usr.hair
										usr.hair=colorss
										usr.overlays-=usr.hair
										usr.overlays+=usr.hair
										//usr.hair+=colorss
										usr.yen-=round(M.value+(M.value*taxon))
										usr<<"You buy a new hair style for [round(M.value+(M.value*taxon))]."
										if(src.village=="Leaf")
											LeafVillagePool+=(M.value*taxon)
										if(src.village=="Rain")
											RainVillagePool+=(M.value*taxon)
										if(src.village=="Sound")
											SoundVillagePool+=(M.value*taxon)
										if(src.village=="Rock")
											RockVillagePool+=(M.value*taxon)
										if(src.village=="Waterfall")
											WaterfallVillagePool+=(M.value*taxon)
										if(src.village=="Sand")
											SandVillagePool+=(M.value*taxon)
										if(src.village=="Cloud")
											CloudVillagePool+=(M.value*taxon)
										SaveVillageStuff()
									else
										usr<<"You dont have enough for this sorry."
										return
								else
									view(src)<<"[src]: Come again soon."
									return
		MaterialMerchant/////////////------------------------------------------------
			icon='Guy.dmi'
			village="None"
			New()
				..()
				spawn(1)
					src.name="Material Seller"
					src.icon=null
					//src.icon='blank.dmi'
					var/Base='Base.dmi'
					Base+=rgb(235,145,52)
					src.icon=Base
					src.overlays+='Boxers.dmi'
					src.overlays+='MaleEyes.dmi'
					src.overlays+='Eyes.dmi'
					src.overlays+='Shirt.dmi'
					src.overlays+='BaggyPants.dmi'
				spawn(rand(1,100))
					var/stocking=2
					while(stocking)
						var/obj/materials/ink/S = new(src)
						S.loc=src
						var/obj/materials/clay/F = new(src)
						F.loc=src
						var/obj/materials/paper/B = new(src)
						B.loc=src
						var/obj/materials/chakrapaper/H = new(src)
						H.loc=src
						stocking-=1
						sleep(1)
			verb
				Speak()
					set src in oview(1)
					set category = "NPC"
					set name="Speak"
					var/taxon=0
					if(src.ko)
						usr<<"[src](Merchant) cant sell right now, hes not up for it....Literally."
						return
					if(src.village=="Leaf")
						taxon=LeafOtherTax/100
					if(src.village=="Rain")
						taxon=RainOtherTax/100
					if(src.village=="Sound")
						taxon=SoundOtherTax/100
					if(src.village=="Rock")
						taxon=RockOtherTax/100
					if(src.village=="Waterfall")
						taxon=WaterfallOtherTax/100
					if(src.village=="Sand")
						taxon=SandOtherTax/100
					if(src.village=="Cloud")
						taxon=CloudOtherTax/100
					switch(input(usr,"What would you like to do?")in list ("Buy","Nothing"))
						if("Buy")
							var/foods=0
							for(var/obj/F in src.contents)
								foods+=1
							var/foodin = list()
							for(var/obj/C in src.contents)
								foodin += C
							var/obj/M = input("What to buy?","[src]") in list("Nothing") + foodin// + list("Cancel")
							if(M=="Nothing")
								return
							var/give = input(usr,"How much [M] do you wish to buy?")as num
							if(give<=1)
								give = 1
							give=round(give)
							switch(input(usr,"What would you like to buy [give] [M] for [round((M.value+(M.value*taxon))*give)]?")in list ("Yes","No"))
								if("Yes")
									if(usr.yen>=round((M.value+(M.value*taxon))*give))
										//M.loc=usr
										//M:ammount=give
										var/obj/materials/A = new M.type
										if(A)
											A.loc=usr
											A.ammount=give
										usr.yen-=round((M.value+(M.value*taxon))*give)
										usr<<"You buy [M] for [round((M.value+(M.value*taxon))*give)]."
										if(src.village=="Leaf")
											LeafVillagePool+=(M.value*taxon)*give
										if(src.village=="Rain")
											RainVillagePool+=(M.value*taxon)*give
										if(src.village=="Sound")
											SoundVillagePool+=(M.value*taxon)*give
										if(src.village=="Rock")
											RockVillagePool+=(M.value*taxon)*give
										if(src.village=="Waterfall")
											WaterfallVillagePool+=(M.value*taxon)*give
										if(src.village=="Sand")
											SandVillagePool+=(M.value*taxon)*give
										if(src.village=="Cloud")
											CloudVillagePool+=(M.value*taxon)*give
										SaveVillageStuff()
									else
										usr<<"You dont have enough for this sorry."
										return
								else
									view(src)<<"[src]: Come again soon."
									return

/*
mob/proc/SharinganCopy(Type,Uses)
	if(src.client)
		var/A = new Type
		if(A)
			if(!(locate(Type) in src.LearnedJutsus))
				src.LearnedJutsus+=A
				A:NonKeepable=1;A:Uses=Uses
				src<<"You have copied [src]!"
				src.CopyMode=0
*/

mob/proc/buyitem(Type)
	if(src.client)
		var/obj/A = new Type
		if(A)
			A.loc=src




mob
	var
		hair=list()
	proc
		hairremoval()
			src.overlays-=src.hair
			src.overlays-=src.hair
			src.overlays-=src.hair
			src.overlays-=src.hair
			src.overlays-=src.hair
			src.overlays-=src.hair