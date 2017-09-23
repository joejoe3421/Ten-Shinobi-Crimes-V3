mob
	var
		tmp/NeedsFace
		tmp/Pedestrian=0
		tmp/list/talkedtopeople
		tmp/AOS=0 //Attack On Sight
		tmp/AWA=0 //Attack When Attacked
		tmp/AF=0 //Attack Foreigners
		tmp/walks=0 //Walks
		tmp/viewsight=3   //how far a monter can look for a player
		tmp/attacked=0
		tmp/tempmix
		tmp/tempmix2
		tmp/tempmix3
		tmp/def
		tmp/attacker
		tmp/FirstCommand=0
		tmp/UnderOrders=0
		tmp/list/reportedattacks
		tmp/part1p=0
		tmp/part2p=0
	proc
		needface2()
			set background = 1
			..()
			if(!src.client)
				if(src.name=="Masked Ninja")
					src.icon=null;var/Base='Icons/New Base/Base.dmi';Base+=rgb(111,55,10);src.icon=Base
					src.overlays-='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays-='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi';src.tempmix2='Icons/New Base/Clothing/pants.dmi'
					var/ored2=rand(1,150);var/oblue2=rand(1,150);var/ogreen2=rand(1,150);src.tempmix2+=rgb(ored2,ogreen2,oblue2);src.overlays+=src.tempmix2;src.part1p=1
				else if(src.name=="Boss Ninja")
					src.icon=null;var/Base='Icons/New Base/Base.dmi';Base+=rgb(180,106,12);src.icon=Base
					src.overlays-='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays-='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi';src.tempmix2='Icons/New Base/Clothing/pants.dmi'
					var/ored2=rand(1,150);var/oblue2=rand(1,150);var/ogreen2=rand(1,150);src.tempmix2+=rgb(ored2,ogreen2,oblue2);src.overlays+=src.tempmix2;src.part1p=1
				else if(src.Pedestrian)
					var/randombase=rand(1,15);src.icon=null;var/Base='Icons/New Base/Base.dmi'
					if(randombase==1) Base+=rgb(156,156,156)
					if(randombase==2) Base+=rgb(255,165,72)
					if(randombase==3) Base+=rgb(245,155,62)
					if(randombase==4) Base+=rgb(235,145,52)
					if(randombase==5) Base+=rgb(225,135,42)
					if(randombase==6) Base+=rgb(225,135,42)
					if(randombase==7) Base+=rgb(200,126,32)
					if(randombase==8) Base+=rgb(190,116,22)
					if(randombase==9) Base+=rgb(180,106,12)
					if(randombase==10) Base+=rgb(170,96,02)
					if(randombase==11) Base+=rgb(111,55,0)
					if(randombase==12) Base+=rgb(101,45,0)
					if(randombase==13) Base+=rgb(91,35,0)
					if(randombase==14) Base+=rgb(81,25,0)
					if(randombase==15) Base+=rgb(95,95,95)
					src.icon=Base;src.overlays-='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays-='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi';src.tempmix='Icons/New Base/Clothing/shirt.dmi'
					var/ored=rand(1,150);var/oblue=rand(1,150);var/ogreen=rand(1,150);src.tempmix+=rgb(ored,ogreen,oblue);src.tempmix2='Icons/New Base/Clothing/pants.dmi'
					var/ored2=rand(1,150);var/oblue2=rand(1,150);var/ogreen2=rand(1,150);src.tempmix2+=rgb(ored2,ogreen2,oblue2);src.overlays+=src.tempmix;src.overlays+=src.tempmix2;src.part1p=1
				/*if(src.NeedsFace&&src.part1p&&!src.tempmix3)
					if(src.rank=="IDK")
						src.Mchakra=rand(1000,4000);src.chakra=src.Mchakra;src.maxstamina=rand(1000.4000);src.stamina=src.maxstamina
						if((src.Mtai+src.Mnin+src.Mgen+src.Age)!=2000)
							src.Mtai=rand(30,75);src.tai=src.Mtai;src.Mnin=rand(30,75);src.nin=src.Mnin;src.Mgen=rand(30,75);src.gen=src.Mgen;Age=rand(13,30)
						if((src.Mtai+src.Mnin+src.Mgen+src.Age)<=105) src.rank="Wanna Be"
						if((src.Mtai+src.Mnin+src.Mgen+src.Age)>105) src.rank="Genin";src.TaijutsuMastery=rand(1,3)
						if((src.Mtai+src.Mnin+src.Mgen+src.Age)>180)
							src.rank="Chuunin";src.TaijutsuMastery=rand(4,6);src.HandsealsMastery=3;src.HandsealSpeed=20
							src.Inferno=1;src.HousenkaExpert=1;src.RaikyuuExpert=2;src.Static=2;src.Electromagnetivity=1;src.ReppushouExpert=1;src.WindVelocity=3
							var/list/C = list("Goukakyuu","Housenka","Hikibou","Ryuuka","Mizurappa","Raikyuu","Reppushou","KazeDangan","Jibashi","Doryuudan","DoryoDango")
							var/b=rand(3,4)
							while(b>0)
								var/P=pick(C);C-=P;var/T = text2path("/obj/SkillCards/[P]")
								var/obj/SkillCards/A = new T
								A.Uses=rand(100,400);src.LearnedJutsus+=A
								b--
							if(prob(5)){var/obj/WEAPONS/Katana/K=new();src.WeaponInRightHand=K;src.RightHandSheath=1}
						if((src.Mtai+src.Mnin+src.Mgen+src.Age)>225)
							src.Inferno=3;src.HousenkaExpert=2;src.RaikyuuExpert=3;src.Static=3;src.Electromagnetivity=3;src.ChidoriSenbonExpert=2;src.NagashiExpert=2;src.ReppushouExpert=2;src.WindVelocity=3;src.VacuumSphereExpert=2;src.DragonsRage=2;src.DragonTamer=3;
							src.rank="Jounin";src.TaijutsuMastery=rand(7,10);src.HandsealsMastery=3;src.HandsealSpeed=60;var/list/C = list("Goukakyuu","Housenka","Hikibou","Ryuuka","Mizurappa","KaryuuEndan","KatonHouka","Gouryuuka","Doryuudan","DoryoDango","YomiNuma","Doryuuheki","Reppushou","KazeDangan","KazeKiri","KazeGai","MizuameNabara","Teppoudama","Raikyuu","Hinoko","Jibashi","Gian","IkazuchiKiba","ChidoriNagashi","ChidoriSenbon");var/b=rand(8,12)
							while(b>0)
								var/P=pick(C);C-=P;var/T = text2path("/obj/SkillCards/[P]");var/obj/SkillCards/A = new T
								A.Uses=rand(500,1000);src.LearnedJutsus+=A;b--
						if(prob(30)){var/obj/WEAPONS/Katana/K=new();src.WeaponInLeftHand=K;src.LeftHandSheath=1}
						if(src.Village=="Leaf")
							if(prob(25)){src.Clan="Hyuuga";src.TaijutsuStyle="Jyuken";src.ChakraPercision=5;src.TenketsuAccuracy=20;src.SensoryRange=5;src.Rejection=5;src.bya=1}
						if(src.Village=="Sound")
							if(prob(25))
								if(prob(30)){var/obj/WEAPONS/Katana/K=new();src.WeaponInLeftHand=K;src.LeftHandSheath=1}
								src.Clan="Uchiha";src.SharinganMastery=rand(40,1000);src.reflexNew=rand(1,4);spawn()
									src.Sharingan()*/
						//src.name="[src.name]([src.rank])"
						//if(src.Clan=="Hyuuga"||src.Clan=="Uchiha")
							//src.name="[src.Clan] [src.name]"

					if(src.rank=="Jounin")
						if(src.village=="Leaf")
							src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
						if(src.village=="Rock")
							src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi'
						if(src.village=="Sound")
							src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
						if(src.village=="Rain")
							src.overlays+='Icons/New Base/Clothing/Official Clothing/RainJounin.dmi'
					if(src.rank=="SGuard")
						src.overlays+='Icons/New Base/Clothing/Official Clothing/soundoutfit.dmi'
					if(src.clan=="Uchiha")
						if(prob(50))
							src.overlays+='Icons/New Base/Clothing/Cloak.dmi'
						else
							src.overlays+='Icons/New Base/Clothing/SasukeShirt.dmi'
						src.overlays+='Icons/New Base/Clothing/Uchiha Crest.dmi'
					src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					var/random = pick('Icons/New Base/Hair/SasukeH.dmi','Icons/New Base/Hair/narutoH.dmi','Icons/New Base/Hair/JrockH.dmi','Icons/New Base/Hair/ExclusiveH.dmi','Icons/New Base/Hair/MadaraH.dmi','Icons/New Base/Hair/leeH.dmi','Icons/New Base/Hair/itachiH.dmi','Icons/New Base/Hair/inoH.dmi','Icons/New Base/Hair/WindH.dmi','Icons/New Base/Hair/hinaH.dmi','Icons/New Base/Hair/PainbodyH.dmi','Icons/New Base/Hair/SpikeyH.dmi','Icons/New Base/Hair/KiraH.dmi','Icons/New Base/Hair/KakashiH.dmi','Icons/New Base/Hair/BuzH.dmi','Icons/New Base/Hair/JiraiyaH2.dmi','Icons/New Base/Hair/RyuzakiH.dmi','Icons/New Base/Hair/OrochimaruH.dmi','Icons/New Base/Hair/SasukeTS.dmi','Icons/New Base/Hair/ShikamaruH.dmi','Icons/New Base/Hair/SleekH.dmi','Icons/New Base/Hair/SpikedPonytailH.dmi','Icons/New Base/Hair/SpikeyH.dmi','Icons/New Base/Hair/YannisH.dmi')
					src.tempmix3=random;var/ored6=rand(1,180);var/oblue6=rand(1,180);var/ogreen6=rand(1,180);src.tempmix3+=rgb(ored6,ogreen6,oblue6);src.overlays+=src.tempmix3;src.NeedsFace=0
					var/A=rand(1,5)
					if(A>=3)
						src.overlays+='Icons/New Base/Clothing/gloves.dmi'
					if(src.rank!="")
						var/B=rand(1,5)
						if(B==5)
							var/mask='Icons/New Base/Clothing/kakashi mask.dmi';var/ored5=rand(1,200);var/oblue5=rand(1,200);var/ogreen5=rand(1,200);mask+=rgb(ored5,ogreen5,oblue5);src.overlays+=mask
					var/C=rand(1,10)
					if(C==1)
						src.overlays+='Icons/New Base/Clothing/facewrap.dmi'
					if(C==2)
						src.overlays+='Icons/New Base/Clothing/Turban.dmi'
					if(C==3)
						src.overlays+='Icons/New Base/Clothing/LEyePatch.dmi'
					if(C==4)
						src.overlays+='Icons/New Base/Clothing/REyePatch.dmi'
				if(src.name=="Masked Ninja")
					src.overlays+='Icons/New Base/Clothing/bandagesL.dmi';src.overlays+='Icons/New Base/Clothing/bandagesR.dmi'
					if(prob(50))
						src.overlays+='Icons/New Base/Clothing/facewrap.dmi'
					if(prob(25))
						src.overlays+='Icons/New Base/Clothing/LEyePatch.dmi'
					if(prob(25))
						src.overlays+='Icons/New Base/Clothing/REyePatch.dmi'
					src.overlays+='Icons/New Base/Clothing/Turban.dmi'
				if(src.name=="Boss Ninja")
					src.overlays+='Icons/New Base/Clothing/cloak3.dmi';src.overlays+='Icons/New Base/Clothing/Headbands/headband.dmi'
				if(src.rank=="Genin"||src.rank=="Chuunin"||src.rank=="Jounin")
					var/randomxzz=pick('Icons/New Base/Clothing/Headbands/headband.dmi','Icons/New Base/Clothing/Headbands/leetype.dmi','Icons/New Base/Clothing/Headbands/NejiHB.dmi','Icons/New Base/Clothing/Headbands/Bheadband.dmi','Icons/New Base/Clothing/Headbands/KakashiHeadband.dmi','Icons/New Base/Clothing/Headbands/ZabuzaHeadband.dmi','Icons/New Base/Clothing/Headbands/HeadbandLeg.dmi','Icons/New Base/Clothing/Headbands/YamatoHeadband.dmi','Icons/New Base/Clothing/Headbands/KisameHeadband.dmi','Icons/New Base/Clothing/Headbands/HeadbandNeck.dmi','Icons/New Base/Clothing/Headbands/BandagedHeadband.dmi')
					src.overlays+=randomxzz
				if(src.rank=="ANBU")
					src.overlays+='Icons/New Base/Clothing/cloak3.dmi'
					var/randomxzz=pick('Icons/New Base/Clothing/Official Clothing/Ranbu.dmi','Icons/New Base/Clothing/Official Clothing/Banbu.dmi','Icons/New Base/Clothing/Official Clothing/Ganbu.dmi','Icons/New Base/Clothing/Official Clothing/ANBUMask.dmi','Icons/New Base/Clothing/Official Clothing/ANBUMask2.dmi')
					src.overlays+=randomxzz
				if(src.rank=="Chuunin"&&src.clan!="Uchiha"||src.rank=="Jounin"&&src.clan!="Uchiha")
					var/icon/AXAX='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
					if(src.village=="Leaf")
						AXAX='Icons/New Base/Clothing/Official Clothing/LeafChuuninSuit.dmi'
					if(src.village=="Rock")
						AXAX+=rgb(101,071,37)
					if(src.village=="Sound")
						AXAX+=rgb(25,25,25)
					if(src.village=="Rain")
						AXAX+=rgb(55,41,122)
					src.overlays+=AXAX





mob
	proc
		needface()
			if(src)
				if(!src.client)
					var/randombase=rand(1,15);src.icon=null;var/Base='Icons/New Base/Base.dmi'
					if(randombase==1) Base+=rgb(156,156,156)
					if(randombase==2) Base+=rgb(255,165,72)
					if(randombase==3) Base+=rgb(245,155,62)
					if(randombase==4) Base+=rgb(235,145,52)
					if(randombase==5) Base+=rgb(225,135,42)
					if(randombase==6) Base+=rgb(225,135,42)
					if(randombase==7) Base+=rgb(200,126,32)
					if(randombase==8) Base+=rgb(190,116,22)
					if(randombase==9) Base+=rgb(180,106,12)
					if(randombase==10) Base+=rgb(170,96,02)
					if(randombase==11) Base+=rgb(111,55,0)
					if(randombase==12) Base+=rgb(101,45,0)
					if(randombase==13) Base+=rgb(91,35,0)
					if(randombase==14) Base+=rgb(81,25,0)
					if(randombase==15) Base+=rgb(95,95,95)
					if(src.village=="None")
						src.village=pick("Sound","Leaf","Sand","Waterfall","Cloud","Rock")
					src.icon=Base;src.overlays-='Icons/New Base/Clothing/Boxers.dmi';src.overlays+='Icons/New Base/Clothing/Boxers.dmi';src.overlays-='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/MaleEyes.dmi';src.overlays+='Icons/New Base/Eyes.dmi';src.tempmix='Icons/New Base/Clothing/shirt.dmi'
					var/ored=rand(1,150);var/oblue=rand(1,150);var/ogreen=rand(1,150);src.tempmix+=rgb(ored,ogreen,oblue);src.tempmix2='Icons/New Base/Clothing/pants.dmi'
					var/ored2=rand(1,150);var/oblue2=rand(1,150);var/ogreen2=rand(1,150);src.tempmix2+=rgb(ored2,ogreen2,oblue2);src.overlays+=src.tempmix;src.overlays+=src.tempmix2;src.part1p=1
					if(src.rank=="Jounin")
						if(src.village=="Leaf")
							src.overlays+='Icons/New Base/Clothing/Official Clothing/LeafJounin.dmi'
						if(src.village=="Rock")
							src.overlays+='Icons/New Base/Clothing/Official Clothing/RockJounin.dmi'
						if(src.village=="Sound")
							src.overlays+='Icons/New Base/Clothing/Official Clothing/SoundJounin.dmi'
						if(src.village=="Rain")
							src.overlays+='Icons/New Base/Clothing/Official Clothing/RainJounin.dmi'
					if(src.rank=="SGuard")
						src.overlays+='Icons/New Base/Clothing/Official Clothing/soundoutfit.dmi'
					if(src.clan=="Uchiha")
						if(prob(50))
							src.overlays+='Icons/New Base/Clothing/Cloak.dmi'
						else
							src.overlays+='Icons/New Base/Clothing/SasukeShirt.dmi'
						src.overlays+='Icons/New Base/Clothing/Uchiha Crest.dmi'
					src.overlays+='Icons/New Base/Clothing/Cloths.dmi'
					var/random = pick('Icons/New Base/Hair/SasukeH.dmi','Icons/New Base/Hair/narutoH.dmi','Icons/New Base/Hair/JrockH.dmi','Icons/New Base/Hair/ExclusiveH.dmi','Icons/New Base/Hair/MadaraH.dmi','Icons/New Base/Hair/leeH.dmi','Icons/New Base/Hair/itachiH.dmi','Icons/New Base/Hair/inoH.dmi','Icons/New Base/Hair/WindH.dmi','Icons/New Base/Hair/hinaH.dmi','Icons/New Base/Hair/PainbodyH.dmi','Icons/New Base/Hair/SpikeyH.dmi','Icons/New Base/Hair/KiraH.dmi','Icons/New Base/Hair/KakashiH.dmi','Icons/New Base/Hair/BuzH.dmi','Icons/New Base/Hair/JiraiyaH2.dmi','Icons/New Base/Hair/RyuzakiH.dmi','Icons/New Base/Hair/OrochimaruH.dmi','Icons/New Base/Hair/SasukeTS.dmi','Icons/New Base/Hair/ShikamaruH.dmi','Icons/New Base/Hair/SleekH.dmi','Icons/New Base/Hair/SpikedPonytailH.dmi','Icons/New Base/Hair/SpikeyH.dmi','Icons/New Base/Hair/YannisH.dmi')
					src.tempmix3=random;var/ored6=rand(1,180);var/oblue6=rand(1,180);var/ogreen6=rand(1,180);src.tempmix3+=rgb(ored6,ogreen6,oblue6);src.overlays+=src.tempmix3;src.NeedsFace=0
					var/A=rand(1,5)
					if(A>=3)
						src.overlays+='Icons/New Base/Clothing/gloves.dmi'
					if(src.rank!="")
						var/B=rand(1,5)
						if(B==5)
							var/mask='Icons/New Base/Clothing/kakashi mask.dmi';var/ored5=rand(1,200);var/oblue5=rand(1,200);var/ogreen5=rand(1,200);mask+=rgb(ored5,ogreen5,oblue5);src.overlays+=mask
					var/C=rand(1,10)
					if(src.assassin)
						C=rand(1,4)
					if(C==1)
						src.overlays+='Icons/New Base/Clothing/facewrap.dmi'
					if(C==2)
						src.overlays+='Icons/New Base/Clothing/Turban.dmi'
					if(C==3)
						src.overlays+='Icons/New Base/Clothing/LEyePatch.dmi'
					if(C==4)
						src.overlays+='Icons/New Base/Clothing/REyePatch.dmi'
				if(src.name=="Masked Ninja")
					src.overlays+='Icons/New Base/Clothing/bandagesL.dmi';src.overlays+='Icons/New Base/Clothing/bandagesR.dmi'
					if(prob(50))
						src.overlays+='Icons/New Base/Clothing/facewrap.dmi'
					if(prob(25))
						src.overlays+='Icons/New Base/Clothing/LEyePatch.dmi'
					if(prob(25))
						src.overlays+='Icons/New Base/Clothing/REyePatch.dmi'
					src.overlays+='Icons/New Base/Clothing/Turban.dmi'
				if(src.name=="Boss Ninja")
					src.overlays+='Icons/New Base/Clothing/cloak3.dmi';src.overlays+='Icons/New Base/Clothing/Headbands/headband.dmi'
				if(src.rank=="Genin"||src.rank=="Chuunin"||src.rank=="Jounin")
					var/randomxzz=pick('Icons/New Base/Clothing/Headbands/headband.dmi','Icons/New Base/Clothing/Headbands/leetype.dmi','Icons/New Base/Clothing/Headbands/NejiHB.dmi','Icons/New Base/Clothing/Headbands/Bheadband.dmi','Icons/New Base/Clothing/Headbands/KakashiHeadband.dmi','Icons/New Base/Clothing/Headbands/ZabuzaHeadband.dmi','Icons/New Base/Clothing/Headbands/HeadbandLeg.dmi','Icons/New Base/Clothing/Headbands/YamatoHeadband.dmi','Icons/New Base/Clothing/Headbands/KisameHeadband.dmi','Icons/New Base/Clothing/Headbands/HeadbandNeck.dmi','Icons/New Base/Clothing/Headbands/BandagedHeadband.dmi')
					src.overlays+=randomxzz
				if(src.rank=="ANBU")
					src.overlays+='Icons/New Base/Clothing/cloak3.dmi'
					var/randomxzz=pick('Icons/New Base/Clothing/Official Clothing/Ranbu.dmi','Icons/New Base/Clothing/Official Clothing/Banbu.dmi','Icons/New Base/Clothing/Official Clothing/Ganbu.dmi','Icons/New Base/Clothing/Official Clothing/ANBUMask.dmi','Icons/New Base/Clothing/Official Clothing/ANBUMask2.dmi')
					src.overlays+=randomxzz
				if(src.rank=="Chuunin"&&src.clan!="Uchiha"||src.rank=="Jounin"&&src.clan!="Uchiha")
					var/icon/AXAX='Icons/New Base/Clothing/Official Clothing/cvest.dmi'
					if(src.village=="Leaf")
						AXAX='Icons/New Base/Clothing/Official Clothing/LeafChuuninSuit.dmi'
					if(src.village=="Rock")
						AXAX+=rgb(101,071,37)
					if(src.village=="Sound")
						AXAX+=rgb(25,25,25)
					if(src.village=="Rain")
						AXAX+=rgb(55,41,122)
					src.overlays+=AXAX