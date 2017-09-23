mob
	var
		tmp/charging=0
		tmp/currentcharge=0
		maxcharge=100
		whatcharges=""
		chargehold=1
	verb
		Chargeoption()
			set name = "Charge Toggle"
			set category = "Commands"
			if(src.chargehold)
				src<<"You no longer have to hold S to charge up chargeables instead just tap it a second time."
				src.chargehold=0
			else
				src<<"You will now charge chargeables by Holding down S to charge them."
				src.chargehold=1
		Charge()
			set hidden = 1
			if(src.ko)
				return
			if(src.whatcharges=="")
				return
			if(src.charging==0)
				src.charging=1
				src<<"You're now charging [src.whatcharges]."
			else
				src.charging=0
				return
			src.currentcharge=0
			while(src.charging&&src.currentcharge<src.maxcharge)
				var/drain=(10-(src.CC*0.05))
				src.chakra-=drain
				src.currentcharge+=((0.5*(src.CC*0.10))+0.01)
				src<<"Current Charge is [src.currentcharge]."
				sleep(2)//probably look into more so that this can be different for some depending on CC
			if(src.currentcharge>=src.maxcharge)
				src<<"[whatcharges] is fully charged."
		ChargeRelease()
			set hidden = 1
			if(src.chargehold)
				src.charging=0
			if(src.charging)
				src<<"Press S to stop the charging and release [src.whatcharges]."
				return
			var/what=src.whatcharges
			var/distance=0
			if(src.ko==0)
				if(what==""||what==null)
					return
				else if(what=="Shinra Tensei")
					distance=(2*(src.currentcharge*0.10))
					for(var/obj/jutsu/J in oview((distance/2),src))
						spawn(1)
							if(J.owner==src)

							else
								step_away(J,src,5,31)
								/*while(get_dist(src,J)<5)
									step_away(J,src,5,31)
									sleep(1)*/
					for(var/mob/M in oview(distance+1,src))
						spawn()
							if(M.ko==0)
								M.dir=get_dir(M,src)
								flick("hit",M)
								M.stepback(round(distance*0.25))
							var/dmg = ((1.5*(src.currentcharge*0.01))*(src.nin*0.70))
							src<<"Damage is [dmg]."
							M.nindamage(dmg,0,src)
					if(src.currentcharge>=src.maxcharge)
						view()<<"[src]: Shinra Tensei!!!"
					else
						view()<<"[src]: Shinra Tensei..."

				else
					return
			//src.currentcharge=0