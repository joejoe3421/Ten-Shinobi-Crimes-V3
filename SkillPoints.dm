mob
	verb
		Statup()
			set name="Use Points"
			set category= "Commands"
			start
				if(src.statp<=0)
					src.statp=0
					return
				switch(input(src,"Distribute Points","[src.statp] Points left",text) in list ("Strength","Ninjutsu","Control","Save for later"))
					if("Strength")
						if(src.statp<=0)
							src.statp=0
							return
						else
							var/N = input("How many Points(Strength)","Points?") as num|null
							if(N)
								if(N>src.statp)
									N=src.statp
								if(N>src.level*3)
									N=src.level*3
								src.Mhealth+=(2*N)
								src.Mchakra+=round(0.8*N)
								src.Mnin+=N*0.25
								src.Mgen+=N*0.25
								src.gen+=N*0.25
								src.nin+=N*0.25
								src.Mtai+=N
								src.tai+=N
								src.statp-=N

					if("Ninjutsu")
						if(src.statp<=0)
							src.statp=0
							return
						else
							var/N = input("How many Points(Power)","Points?") as num|null
							if(N)
								if(N>src.statp)
									N=src.statp
								if(N>src.level*3)
									N=src.level*3
								src.Mchakra+=(2*N)
								src.Mhealth+=round(0.8*N)
								src.Mtai+=N*0.25
								src.Mgen+=N*0.25
								src.gen+=N*0.25
								src.tai+=N*0.25
								src.Mnin+=N
								src.nin+=N
								src.statp-=N
					if("Control")
						if(src.statp<=0)
							src.statp=0
							return
						else
							var/N = input("How many Points(Control)","Points?") as num|null
							if(N)
								if(N>src.statp)
									N=src.statp
								if(N>src.level*3)
									N=src.level*3
								src.Mchakra+=(1*N)
								src.Mhealth+=round(0.6*N)
								src.Mtai+=N*0.25
								src.Mnin+=N*0.25
								src.nin+=N*0.25
								src.tai+=N*0.25
								src.Mgen+=N
								src.gen+=N
								src.statp-=N
					if("Save for later")
						return 0
				goto start