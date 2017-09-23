obj
	skill
		leafviolentwind
			verb
				lvw()
					set category = "Skills"
					set name = "Leaf Violent Wind"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+150
					if(usr.handseal(10,0))
						spawn(1)
							usr.taiincrease(1.5)
							usr.alldamage(7,usr)
						usr.reppu()
		leafwhirlwind
			verb
				lww()
					set category = "Skills"
					set name = "Leaf Whirlwind"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+200
					if(usr.handseal(10,0))
						spawn(1)
							usr.taiincrease(1.5)
							usr.alldamage(20,usr)
						usr.senpuu()
		leafrisingwind
			verb
				lww()
					set category = "Skills"
					set name = "Leaf Rising Wind"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+350
					if(usr.handseal(10,0))
						spawn(1)
							usr.taiincrease(2.5)
							usr.alldamage(50,usr)
						usr.konohashofuu()
		leafstrongwhirlwind
			verb
				lsw()
					set category = "Skills"
					set name = "Leaf Strong Whirlwind"
					if(src.cooldown-world.time>=0)
						usr<<"You must wait [round((src.cooldown-world.time)/10)] seconds before you can use this again."
						return
					src.cooldown=world.time+450
					if(usr.handseal(10,0))
						spawn(1)
							usr.taiincrease(3)
							usr.alldamage(200,usr)
						usr.konohadaisenkou()