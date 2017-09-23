obj
	skill
		gencreate
			var
				newname="Custom Genjutsu"
				effected=""//one or AOE
				effect="None"//stun, damage, none
				range=1//1-6
				created=0


			verb
				gencreate()
					set name = "Custom Genjutsu"
					set category = "Skills"
					var/M=list()
					var/targets=0
					if(src.effected=="One")
						if(usr.target)
							M+=usr.target
							targets+=1
					else
						for(var/mob/T in oview(usr))
							if(T!=usr)
								M+=T
								targets+=1
					if(targets<=0)
						usr<<"<font color=red>Error: No target/s found."
						return
				nameskill()
					set name = "Name skill"
					set category = "Testing"
					var/char_name = input(usr, "Name your skill", "Skill Name",) as null|text
					if(char_name == null||char_name == "")
						char_name = "Skill [rand(1,99)]"
					src.name = char_name
					//set name == "[char_name]"
