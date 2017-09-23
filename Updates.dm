mob/proc/updates()
	src<<"Loading..."
	sleep(30)
	var/helptext2 = {"
		<html>
		<STYLE>BODY {font-family: Verdana}</STYLE>
		<head>
		<title>Updates</title>
		</head>
		<body bgcolor=black text=white>
		<center><h2>Updates</h2></center><hr>
		<br>

			-----------------------------------------<br>
			<br>
			Announcements: <br>
			<br>
			Tell me what clans you guys would like me to work on.<br>
			<br>
			------------------------------------<br>
			<br>
			Comming Soon:<br>
			<br>
			---Jashin Techniques(On Hold)<br>
			<br>
			<br>
			Current:<br>
			<br>
			<br>
			---------->(2/18/17)<------------<br>
			Redid Sage mode. You no longer have to fully charge sage mode to use it, half way works fine.<br>
			<br>
			Sage mode types now indicate how much power it gives and how much natural energy it turns into chakra when using jutsu.<br>
			<br>
			Sage mode Power now varies depening on if you meditate fully for it or if you enter perfect sage mode or not.<br>
			<br>
			Fixed Load prompt from asking twice.<br>
			<br>
			Izanagi and clam genjutsu clone now fade away properly.<br>
			<br>
			<br>
			---------->(2/17/17)<------------<br>
			NPC will now attempt to kill you rather than just knock you out.<br>
			<br>
			NPC are now faster.<br>
			<br>
			Tweeked Sage mode to take some of the chakra of a jutsu's chakra cost and substitute it with natural energy.<br>
			<br>
			Cooldown system redone to eliminate possible lag.<br>
			<br>
			EXP relquirements nerfed heavily.<br>
			<br>
			Leveling made easier early on.<br>
			<br>
			Training on bags now levels you up properly.<br>
			<br>
			NPCs sped up.<br>
			<br>
			Poison crafting fixed.<br>
			<br>
			Lowered Gate Required taijutsu knowledge.<br>
			<br>

			<br>
			---------->(2/15/17)<------------<br>
			A few unlisted updates.<br>
			<br>
			Wiped to give update full effect.<br>
			<br>
			Buffed starting chakra amount times 5.<br>
			<br>
			Added a charging system to certain jutsu.(Shinra Tensei)<br>
			<br>
			Missle icon changed.<br>
			<br>
			Medical DNA extraction tweeked.<br>
			<br>
			<br>
			---------->(11/5/15)<------------<br>
			Taijutsu is easier to gain.<br>
			<br>
			Genin NPC give more EXP upon kill.<br>
			<br>
			Genin is now automatically gotten at level 20 instead of 50.<br>
			<br>
			---------->(5/2/15)<------------<br>
			Wiped to test new code.<br>
			<br>
			Completely redid the opening scene to be a bit easier and explain more.<br>
			<br>
			There is no longer a kill barrier for those under 15, but as long as your within the opening scene you won't die.(If you do report it)<br>
			<br>
			---------->(4/24/15)<-----------<br>
			<br>
			Added something to delete player made mobs when they log out.(In testing)<br>
			<br>
			Tweeked party gains a bit.<br>
			<br>
			---------->(4/16/15)<-----------<br>
			<br>
			Juggernaut is now larger than everyone else in size.<br>
			<br>
			---------->(4/7/15)<------------<br>
			<br>
			Warp surrondings tweeked now lasts for 5 seconds and is now more instant.<br>
			<br>
			Warp surroundings now shares a cooldown with Warp and Warp teleport.<br>
			<br>
			Warp teleport should now work properly.<br>
			<br>
			Kamui destruction now has a chance to warp the person you use it on if it hits a certain area.<br>
			<br>
			---------->(4/3/15)<------------<br>
			<br>
			Fixed a few bugs.<br>
			<br>
			Bounty hunters no longer chase you if you don't have a bounty on your head.<br>
			<br>
			Amaterasu can now spawn more flames.(but they may be weaker)<br>
			<br>
			A few more improvement to the hunter AI.<br>
			<br>
			Bounty hunter NPC now when they die depending on who killed them may show you who hired them.<br>
			<br>
			Updated bounty hunter AI a bit made it a little more hunter-like gave it a slight brain.<br>
			<br>
			NPC now may spawn with yen that can be taken from them upon their defeat.<br>
			<br>
			Being in a party now shares your earnings.<br>
			<br>
			---------->(4/1/15)<------------<br>
			<br>
			Added bounty hunting for kages to hire to help gain money for the village but it'll take money to hire them.<br>
			<br>
			Bounty hunters are fast but are killed easier.<br>
			<br>
			Susano'o no longer forces you to walk unless you are in stage 2 or higher.<br>
			<br>
			A Bug fix or two.<br>
			<br>
			---------->(12/1/14)<-----------<br>
			<br>
			Nerfed juggernaut damage.<br>
			<br>
			Made clam genjutsu have a slight cooldown on illusions.<br>
			<br>
			A few bug fixes.<br>
			<br>
			Fixed clay not doing damage.<br>
			<br>
			Saving is now set back to what it was, but saving every three minutes.<br>
			<br>
			You are now saved upon log out instead of minutely.<br>
			<br>
			Boosted chakra gained from Holding Z.<br>
			<br>
			Buffed Fire ball jutsu.<br>
			<br>
			Added Clay senbon, clay kunai and clay flower to clay's c1 list.<br>
			<br>
			Did a little re-maping in the sand village<br>
			<br>
			A lot of bug fixes, added chairs to rest in.<br>
			<br>
			Added a squad system, and a system to share exp amonst it's nearby members.<br>
			<br>
			---------->(11/30/14)<----------<br>
			<br>
			Hyuuga palms take chakra by chance now depending on speed.<br>
			<br>
			Made a new AI for Clones, they now only attack the owers target.<br>
			<br>
			Fixed Teacher not teaching Rasengan and gave Giant rasengan a chakra requirement.<br>
			<br>
			As a event starts you are now automatically healed at the begining of it.<br>
			<br>
			You no longer die after losing in an event.<br>
			<br>
			Raiton Tornado is now a little faster and leaves a trail.<br>
			<br>
			Edo Tensei No longer feel the effects of Gates.<br>
			<br>
			Bug Fixes.(Neomega)<br>
			<br>
			Fixed Rock throw's name changing to Rock wall, Rock throw gets better with doton knowledge.<br>
			<br>
			Fixed people with clans able to get gates.<br>
			<br>
			Itachi now releases you a bit faster.<br>
			<br>
			Uzumaki teacer teaches Uzumaki shadow clone at 5 times lower the requirements than other clans.<br>
			Fixed Uzumaki teacher not teaching shadow clone.<br>
			<br>
			Non clan can only attain one special ability, such as Gates, A Medical Branch etc<br>
			Those who Specialize in Scalpes will do extra damage with the.<br>
			<br>
			Added two new moves for Doton.<br>
			<br>
			Fixed a few buggs.<br>
			<br>
			Added Shadow Clone jutsu.<br>
			<br>
			Added Raiton Clone jutsu.<br>
			<br>
			Added Water Clone jutsu.<br>
			<br>
			Clans can learn Guy's taijutsu stle if they meet the taijutsu requirements.(except a few moves)<br>
			<br>
			---------->(11/29/14)<----------<br>
			<br>
			Fixed runtime error with Edo Tensei.<br>
			<br>
			Fixed Wind Raging Cutter.<br>
			<br>
			Fixed Might Guy teaching.<br>
			<br>
			Attempted to fix chakra regen.<br>
			<br>
			Might Guy now teaches His own fighting style and 4 new taijutsu techniques.<br>
			<br>
			Buffed sage mode mastery speed a bit.<br>
			<br>
			Chakra Control effects the chakra from your resivoir, how much is taken and how much you get.(Neomega)<br>
			<br>
			Fully Fixed the Other in help button.<br>
			<br>
			Buffed Clay explosive mastery again.<br>
			<br>
			You can now see Chakra control and handseal speed in stats tab.<br>
			<br>
			Can no longer use Jutsu While in Raiton Tornado.<br>
			<br>
			Running While in Beast Mode will slightly increase it's mastery.(Neomega)<br>
			<br>
			Inuzuka clan jutsu requirements nerfed a bit.<br>
			<br>
			Fixed logging out while in Demon mode bugging people.<br>
			<br>
			Nerfed Taijutsu damage to certain ninja(NPCs)<br>
			<br>
			Nerfed Madara and Kabuto as event characters.<br>
			<br>
			Fixed a Merchant issue, Made event characters run instead of walking.<br>
			<br>
			Sped up event characters a bit and fixed a small save issue.<br>
			<br>
			Slowed event characters down a bit.<br>
			<br>
			Event characters now talk and are able to struggle.<br>
			<br>
			Added two new Raiton jutsu along with two Katon jutsu.<br>
			<br>
			Buffed Katon jutsu requirements.<br>
			<br>
			Katon burns a little slower while doing a bit more damage.<br>
			<br>
			---------->(11/28/14)<----------<br>
			<br>
			Elemental knowledge now caps at 10,000<br>
			<br>
			Fixed chakra paper bug.<br>
			<br>
			Senju Clan jutsu Fixed.<br>
			<br>
			Made Senju get wood style a little faster.<br>
			<br>
			Meterial sellers now sell chakra paper which is used to find your element if you don't know it.<br>
			<br>
			Increased clay explosive mastery speed again.<br>
			<br>
			Buffed Hyuuga Taijutsu<br>
			<br>
			Fixed clam Genjutsu.<br>
			<br>
			Testers now get a few less levels.<br>
			<br>
			Hoshigaki are now healed all water jutsu and water does less damage aginst them.<br>
			<br>
			Fixed not being able to learn certain rasengan.<br>
			<br>
			Clay Explosive mastery now increases a bit faster.<br>
			<br>
			You no longer stop gettying unlimited chakra at level 50 but at level 3.<br>
			<br>
			Added a Who verb in commands tab.<br>
			<br>
			Fixed Chakra Scalpes.<br>
			<br>
			Shousen can now assist people by restoring their willpower and helping them if they are struggling for their life<br>
			<br>
			Kawarimi can now be mastered.<br>
			<br>
			Removed crow clone from testing, it's test is complete.<br>
			<br>
			Clay Jutsu now use clay, you can also see how much clay you have
			in stats tab now.<br>
			<br>
			Put a character cap on Say and ooc.<br>
			<br>
			Fixed a bug for Hyuuga.<br>
			<br>
			Added 3 new wind jutsu.<br>
			<br>
			Uzumaki Clan can learn Rasengan at half the ninjutsu knowledge cost.<br>
			<br>
			Attempted Fix of Raiton Current and Chidori Nagashi.<br>
			<br>
			Absorbing a Rasengan or chidori will no longer have the after effects on you.<br>
			<br>
			Rasengan Extensive damage and chidori/raikiri damage buffed.<br>
			<br>
			Preta Path absorb nerfed, you now only gain 25% the chckra from the jutsu you absorb.<br>
			<br>
			Added A bunch of passives for different clan abilities and things.<br>
			<br>
			Added clan teachers to certain clans<br>
			<br>
			Added's the clan clan's Famed Clay dragon technique.<br>
			<br>
			Hyuuga Palms can now be focused by having a target before doing it.<br>
			<br>
			Certain jutsu while mastering will tell you as they are mastered.<br>
			<br>
			---------->(11/27/14)<----------<br>
			<br>
			Your automatically released from a genjutsu when you KO.<br>
			<br>
			Punching Bags are now effected by the world exp multiplier.<br>
			<br>
			Buffed the EXP gained from Training bags.<br>
			<br>
			Fixed a few Runtime Errors.<br>
			<br>
			Shousen no longer has handseals and has a 2 second longer cooldown.<br>
			<br>
			Fixed, getting up after death<br>
			<br>
			Nerfed the space you move from a substitution.<br>
			<br>
			Buffed Gaining nin and genjutsu knowledge.<br>
			<br>
			Buffed chakrapool maximum.<br>
			<br>
			Fixed Double struggling and Obito kamui.<br>
			<br>
			Nerfed Will power a bit.<br>
			<br>
			You no longer heal blindness while using sharingan or mangekyou sharingan.<br>
			<br>
			Added, Raiton Current and Chidori Nagashi.<br>
			<br>
			Ajusted the system to gain elemental knowledge a bit.<br>
			<br>
			Added 7 raiton jutsu that can be taught, added one raiton jutsu in game.<br>
			<br>
			---------->(11/26/14)<----------<br>
			<br>
			Elemental NPC now wear clothes.<br>
			<br>
			Added RaitonBall technique while chidori and Raikiri now have a teacher.<br>
			<br>
			Added, rasengan, chidori and raiton teacher.<br>
			<br>
			Increased EXP rate now effects taijutsu, ninjutsu and genjutsu knowledge gain.<br>
			<br>
			Now certain clans automatically have certain elements.<br>
			<br>
			Nerfed, Wind Wave a bit.<br>
			<br>
			Added Gates attainable to the public by making a teacher who teaches them to players who have no clan only.<br>
			<br>
			Fixed clay mines that c2 dragon drops.<br>
			<br>
			Added fuuton and doton teachers.<br>
			<br>
			Fixed 5 prong Seal and 5 prong seal release.<br>
			<br>
			Added in Fuuton and Doton Techniques.<br>
			<br>
			Added Stats tab for things like passives.<br>
			<br>
			Made hoshigaki and hozuki weaker to katon.<br>
			<br>
			Katon now does double damage to hozuki using hydro mode.<br>
			<br>
			---------->(11/25/14)<----------<br>
			<br>
			Added a File report system for Suggestions and bug reportds etc.<br>
			<br>
			Turns out Obito's mangekyou wasn't even attainable, now it is.<br>
			<br>
			Added a New Event Stage, Added a few more NPC to the map.<br>
			<br>
			---------->(11/24/14)<----------<br>
			<br>
			Added Chakra scalpes and training dummys for those who don't wish to fight NPC or players, but they are much slower.<br>
			<br>
			Dodging works now and trains the more you dodge things.<br>
			<br>
			Jashin Clan is now pickable.<br>
			<br>
			Spider Clan is now pickable.<br>
			<br>
			Senju clan are better with natural energy so now their DNA is worth something.<br>
			<br>
			Kaguya clan is now pickable, which it should have been long ago.<br>
			<br>
			Fixed a couple of Admin commands while adding more clan descriptions for those clans whom needed them.<br>
			<br>
			Nerfed medical ninjutsu's Shousen. Changed the way it works and lowered it's cooldown.<br>
			<br>
			Added A help button that holds the guides and the ability to fix overlays and what not.<br>
			<br>
			Added several Guides to help out players in need.<br>
			<br>
			Added a simple clashing system for Rasengan and Chidori.<br>
			<br>
			Added character creation messages for those who create new characters.<br>
			<br>
			Bug Fixes.<br>
			<br>
			Fixed the Drain on Bijuu.<br>
			<br>
			Made it not alert you as much about your bijuu being mastered over time.<br>
			<br>
			Mangekyou preperation can now be undone.<br>
			<br>
			Buffed Gates, they were doing less damage then normal damage, not anymore.<br>
			<br>
			---------->(11/22/14)<----------<br>
			<br>
			Added a little buff for sage modes, sage mode now has a few hidden perks.<br>
			<br>
			---------->(11/21/14)<----------<br>
			<br>
			Tweaked the Ai's combat system a bit give them shirts and pants so they look more like players instead of a naked cult, lol<br>
			<br>
			Made npc a little smarter and will block when actually beign attacked insteal fo randomly.<br>
			<br>
			You now see when you gain exp.<br>
			<br>
			Added in Sage Mode.<br>
			<br>
			Changed the way Sand, golden and Bone armor work.<br>
			<br>
			Buffed Sage Mode so you gain more mastery. More mastery now slows the drain.<br>
			<br>
			Added Kotoamatsukami but its still a work in progress.<br>
			<br>
			---------->(11/18/14)<----------<br>
			<br>
			Added Say, OOC and Whisper buttons.<br>
			<br>
			Help Say is still in Commands tab, its used for when you need help not when you want to talk.<br>
			<br>
			---------->(11/16/14)<----------<br>
			<br>
			Buffed a secret forbidden jutsu so it now blocks 2 and a half damage from physical jutsu<br>
			<br>
			Buffed willpower.<br>
			<br>
			Added in the second mizukage's Steam Imp for the Hozuki clan and the water gun technique.<br>
			<br>
			Changed the way Say and OOC look a little.<br>
			<br>
			Added a Help say for people in need of asistance and a toggle so you can turn it on and off as you please.<br>
			<br>
			Added in bone bullets.<br>
			<br>
			Gave joki boi a special AI that only it has.<br>
			<br>
			Npc can now use rasengan, chidori , Tsuuga, and Human bolder correctly.<br>
			<br>
			Added Mask ninja and Boss ninja npc that will sometimes spawn. (They give a lot of exp if you beat them)<br>
			<br>
			Added in NPC Raikiri.<br>
			<br>
			---------->(11/14/14)<----------<br>
			<br>
			Tweaked Inuzuka clan a bit.<br>
			<br>
			Added Akimichi Clan along with 2 human bolders.<br>
			<br>
			Made Kaguya clan usable.<br>
			<br>
			Bug fixes<br>
			<br>
			Gave All food in game icons/icon states.<br>
			<br>
			Recoded clothes sellers, they will no longer run out of certain clothes to sell.<br>
			<br>
			Added more hair styles along with clothing.<br>
			<br>
			Akimichi techniques now use calories which are the same as hungry.<br>
			<br>
			Akimichi techniques do more damage if your full or bloated.<br>
			<br>
			---------->(11/13/14)<----------<br>
			<br>
			Added in Gates 1-6<br>
			<br>
			Changed the way Senju Forest Emergance worked.<br>
			<br>
			Beds now heal chakra and chakra resivoir.<br>
			<br>
			Beds heal willpower a bit faster now.<br>
			<br>
			People in gates can hit forever.<br>
			<br>
			People in Gates have high speed but lower will willpower each gate they use<br>
			<br>
			Nerfed the Cooldown of Yin Healing wound destruction.<br>
			<br>
			Added 17 new Sealing jutsu, nerfed 100 healings jutsu along twice.<br>
			<br>
			Updates button in pull down menu now works.<br>
			<br>
			Gave gate a critical hit thing, made them take mroe damage while in them and do more damage aswell.<br>
			<br>
			Made Inuzuka Tsuuga have better looking icons and gave it effects and a temparery speed up.<br>
			<br>
			Tweeked the AI for normal npc gave them a cople more moves.<br>
			<br>
			Some NPC will now use gates.<br>
			<br>
			Nerfed gates normaly mutiplied attack damage, is now more reasonable.<br>
			<br>
			Gates now take percentage based health from it's users<br>
			<br>
			Hozuki Hydro Mode should be fixed and Hozuki clan memebers get it upon creating intot he clan now.<br>
			<br>
			---------->(11/12/14)<----------<br>
			<br>
			Added Shark skin for Hoshigaki.<br>
			<br>
			Added Senju clan with a full moveset of 7 moves, will be adding more.<br>
			<br>
			Added Inuzuka clan with a moveset of three moves, will add more. (Dog not included).<br>
			<br>
			Added Hoshigaki with their normal abilities,shark skin(samehade is not of their clan).<br>
			<br>
			---------->(11/11/14)<----------<br>
			<br>
			Added 64 palms for Hyuuga.<br>
			<br>
			Fixed Kamui destruction, it also now no longer needs hand seals.<br>
			<br>
			Increased the speed of Kamui a bit and fixed the after effects.<br>
			<br>
			Decreased blindness recovery rate again.<br>
			<br>
			Added Kamui Diminsion.<br>
			<br>
			Added a few NPC to the Map<br>
			<br>
			Using the real game map now.<br>
			<br>
			Added in spawns for each village.<br>
			<br>
			Jak154 removed from admin.<br>
			<br>
			Guest keys can now be toggled to be allowed or not.<br>
			<br>
			Admins are now able to make other players admin.<br>
			<br>
			Added one more Forbidden Jutsu.<br>
			<br>
			Rasengan and chidori now de-activate on ko.<br>
			<br>
			---------->(11/10/14)<----------<br>
			<br>
			Added healing when gaining chakra from chakra pool for Senju clan and anyone with their DNA implanted.<br>
			<br>
			Redid Rinnegan gain, added rinnegan potential for everyone who creates a character.(Secret requirements)<br>
			<br>
			Having a soul did nothing before, now it plays a huge part in struggling for your life, without it your pretty much dead.<br>
			<br>
			Redid how Naraka Path jutsu work some of them anyway, will redo all evenually.<br>
			<br>
			Added Rasengan, Giant rasengan, Fuuton rasengan, chidori and raikiri.<br>
			<br>
			Nerfed Tsukuyomi again.<br>
			<br>
			Sped up Rasengan and Chidori Charge rates. Rasengan uses less chakra yet chidori charges faster and does more damage in a instant.<br>
			<br>
			Fixed Update verb in pull down menu<br>
			<br>
			Sand coffin should no long bug people.<br>
			<br>
			Sand Clan pickable again.<br>
			<br>
			Sand wave changed to sand summon.<br>
			<br>
			Slowed blindness healing.<br>
			<br>
			Added in Kabuto's Yin healing wound destruction jutsu.<br>
			<br>
			Cut Tsukyomi's active time in half, buffed the damage.<br>
			<br>
			Added Yasaka Magatama<br>
			<br>
			Attmpted to lower voice loudness.<br>
			<br>
			Lowered voices.<br>
			<br>
			Added Gentle fist for Hyuuga.<br>
			<br>
			---------->(11/9/14)<-----------<br>
			<br>
			Added in another Fire style jutsu along with two water style jutsu, all can be attained.<br>
			<br>
			Added in a Katon and Suiton Teacher to get techniques from.<br>
			<br>
			Added Elemental knowledge in stats tab if you have any above 0, gained by using the element.<br>
			<br>
			Increased fire and water style jutsu damage for players.<br>
			<br>
			Nerfed the size of NPC fire.<br>
			<br>
			---------->(11/8/14)<-----------<br>
			<br>
			Those born with Izuna MS are given a boost in how much they can use their mangekyou before going blind.<br>
			<br>
			Bug Fixes.<br>
			<br>
			Added strongest amaterasu for Izuna MS.<br>
			<br>
			Added in Amaterasu for Sasuke and Izuna MS.<br>
			<br>
			Added in willpower that everyone gets moreso at random as they start the game.<br>
			<br>
			Higher ranks give a slight bonus of struggle will power.<br>
			<br>
			Fixed Susano'o<br>
			<br>
			Everyone has a different blindness limit now.<br>
			<br>
			Blindness is slowly healed over time and has a cap.<br>
			<br>
			Nerfed Susano'o Blindness and Magekyou use blindness.(so you can now use them longer.)<br>
			<br>
			---------->(10/19/14)<----------<br>
			<br>
			Gave players more control over their characters and the story they go through.<br>
			<br>
			Did some bug fixes. puppets slightly broken when coming to saving so taken out for now.<br>
			<br>
			Redid the way missles spawn<br>
			<br>
			Added sand coffin layering<br>
			<br>
			Took out tall grass overlaying.<br>
			<br>
			Added water skipping for mastered fuuton users.<br>
			<br>
			---------->(10/16/14)<----------<br>
			<br>
			Added Hozuki Hydro Mode<br>
			<br>
			Added Hidden Mist jutsu for Suiton<br>
			<br>
			NPC now might struggle up a little.<br>
			<br>
			---------->(10/14/14)<----------<br>
			<br>
			Fixed NPC not dying.<br>
			<br>
			You now can regain chakra from your resivoir by holdong Down Z.<br>
			<br>
			You can no longer double ko a person.<br>
			<br>
			Changed how death works, now dying is completely up to the player.<br>
			<br>
			Added a type of willpower.<br>
			<br>
			---------->(10/6/14)<-----------<br>
			<br>
			Added Yamanaka clan and Mind transfer jutsu. Range increases the more you use it.<br>
			<br>
			Added in susanoo ribs for Sasuke, Madara, Itachi and Shisui.<br>
			<br>
			---------->(9/30/14)<-----------<br>
			<br>
			Added in Susanoo for, Sasuke, Itachi, Madara and Shisui.<br>
			<br>
			Each Susanoo has its strong points, soem weaker than others naturally.<br>
			Susanoo's defence depends on your ninjutsu, genjutsu and sharingan mastery times your Susanoo Stage.<br>
			<br>
			---------->(9/15/14)<-----------<br>
			<br>
			Added invite player verb to commands tab so when you invite a player you can be rewarded when they join for the first time."
			<br>
			---------->(9/10/14)<-----------<br>
			<br>
			Spider web(jutsu)<br>
			<br>
			Spider Golden kunai.<br>
			<br>
			Spider golden armor.<br>
			<br>
			Spider Clan open testing<br>
			<br>
			Made Izanagi and Izanami countpart jutsu.<br>
			<br>
			---------->(8/25/14)<-----------<br>
			<br>
			Added all bijuu to the game witht he exception of Juubi, because I lack the icons to do so.<br>
			<br>
			Added endurance you can get from armored clothing and chakra armor which you gain from certain Bijuu.<br>
			<br>

			---------->(8/21/14)<----------<br>
			<br>
			Added updates logs reachable from the start menu or in game by going to the help pull down menus.<br>
			<br>
			Added water walking system.<br>
			<br>
			Finished mapping for teparary map.<br>
			<br>
			Nerfed and recoded katon jutsu for the seventh time.<br>
			<br>
			Added Chibaku Tensai<br>
			<br>
			Shira tensai now pushes jutsu away aswell as people.<br>
			<br>
			Added in mastery system for jutsu, the more you use it the better you master and in soem cases the more damage it does.<br>
			<br>
			Added in medical jutsu(heal)<br>
			<br>
			Added a few Katon and Suiton jutsu.<br>
			<br>
			Clones and other things now give the owner the kill.<br>
			<br>
			Added Reanimation and dead soul jutsu.<br>
			<br>
			Added armor system<br>
			<br>
			Added in sand jutsu and and attacking.<br>
			<br>
			Added a updates log.<br>
			<br>

		<p>
		<br>
		</body>
		</html>
		"}
	usr << browse("[helptext2]","size=808x544,window=updatewindow")
mob
	verb
		helpme()
			set name = "Help"
			set category = "Commands"
			var/L = list("Starting Guide","Regular Guide","Admin Guide","Overlays","Other")
			var/M = input("How can we assist you?","[src]") in list("Cancel") + L
			if(M=="Cancel")
				return
			if(M=="Starting Guide")
				usr.startguide()
			if(M=="Regular Guide")
				usr.guide()
			if(M=="Admin Guide")
				usr.adminguide()
			if(M=="Overlays")
				usr.overlays-=usr.overlays
				usr.overlays-=usr.overlays
				usr.overlays-=usr.overlays
				usr.overlays=list()
				usr.Gender2()
			if(M=="Other")
				var/howto=input("Whats the issue?(If Nothing, leave it blank)") as text
				if(howto==""||howto==null)
					return
				for(var/mob/T in world)
					if(T.client&&T.admin)
						T << "<font color = red><font size= 3>(((Admin Help Say)))<font size= 2> - [usr](Key:[usr.key]): <font color = silver>[howto]"
					sleep(1)
mob/proc/guide()
	src<<"Loading..."
	sleep(10)
	var/helptext3 = {"
		<html>
		<STYLE>BODY {font-family: Verdana}</STYLE>
		<head>
		<title>Guide</title>
		</head>
		<body bgcolor=black text=white>
		<center><h2>Guide</h2></center><hr>
		<br>

			-----------------------------------------<br>
			<br>
			Table of Content: <br>
			<br>
			1.How to fight.<br>
			2.How to gain Jutsu.<br>
			3.Skill Points.<br>
			4.Jutsu Leveling.<br>
			5.Struggling.<br>
			6.Knockout.<br>
			7.Gain Levels<br>
			8.Money<br>
			9.Clothes<br>
			10.Hair<br>
			11.Food<br>
			<br>
			------------------------------------<br>
			<br>
			Tip: Right Click To talk to NPC.<br>
			<br>
			1.How To Fight.<br>
			<br>
			Well you have the Button A which is used to attack, hold it or tap it, same result. You also have D which is used to block(Hold it).<br>
			P.S. To gain your chakra back you have a resivoir which lets you pull chakra from it by Holding Z when you need Chakra. be careful it does run out.<br>
			But no worries you can refill it by resting in a bed.<br>
			<br>
			<br>
			2.How to gain jutsu.<br>
			<br>
			Well to gain clan jutsu you talk to your clan representative, they will give you a list of jutsu you may learn at the moment.<br>
			<br>
			For elemental jutsu you talk to a teacher of that element, they will show you all that you can learn for the moment.<br>
			If you only see one or two things there that means you need gain more elemental knowledge by using jutsu of that element.<br>
			<br>
			<br>
			3.Skill Points.<br>
			<br>
			You gain skills points after every level which you can use to gain higher Strength(taijutsu damage),
			Power(ninjutsu damage) and Control(Genjutsu Damage). Each has it's benefits.(figure otu what they are on your own).<br>
			In order to use your skill points (which are located in your stats tab if you have any) go to the commands tab then
			click Use Points, if you have points to spend it'll ask what you want to spend them on.<br>
			Q:"Where should I put my points?" A:Try them all see what works for you over time.<br>
			<br>
			Q:"Why won't my stats move?" A: Use your skill points, stats are just a percentage of how you distributed them.<br>
			<br>
			<br>
			4.Jutsu Leveling.<br>
			<br>
			Jutsu leveling is very simple, some jutsu get extra things like a increase in size or number the more you use them.<br>
			Some jutsu give other jutsu as you master them.<br>
			<br>
			<br>
			5.Struggling.<br>
			<br>
			Meaning you were knocked out and now you are struggling for your life. You need to tap space bar rapidly in order to get back up and not die.<br>
			When you are struggling there is a bar that appears next to your chakra bar that shows your progress, its also shown at the very top
			of your stats tab.<br>
			Your goal is to struggling up to or past 100% to live, each time you are knocked out it will become harder till you rest again.<br>
			<br>
			<br>
			6..Knocked out.<br>
			Besides making struggling for you harder the next time you are struggled being knocked out isn't that bad.<br>
			<br>
			7.Gain Levels<br>
			<br>
			To gain levels you must fill up your EXP which is located in your stats tab, once it's full you'll gain a level.<br>
			Simple, for the moment fight players and NPC so that you can take their EXP when you kill them.<br>
			Another way to gain EXP is events, usually the more players who join the higher the reward is.<br>
			<br>
			8.Money.<br>
			<br>
			Money can be gained through events, doing missions and killing players. The choice is yours.<br>
			<br>
			9.Clothes.<br>
			<br>
			You can buy clothing from a clothing seller or a pawn shop where you just might find rare items.<br>
			<br>
			10.Hair.<br>
			<br>
			A barber will change your hairstyle for using around 50 yen plus village tax.<br>
			<br>
			<br>
			11.Food.<br>
			<br>
			Every now and then you'll get hungry and when you begin starving your health will begin to drop till a certain ammount.<br>
			If you want to not starve simply go buy something from a food seller and eat it, its as simple as that.<br>
			<br>
			<br>





		<p>
		<br>
		</body>
		</html>
		"}
	usr << browse("[helptext3]","size=808x544,window=updatewindow")


mob/proc/startguide()
	src<<"Loading..."
	sleep(5)
	var/helptext4 = {"
		<html>
		<STYLE>BODY {font-family: Verdana}</STYLE>
		<head>
		<title>Starting Guide</title>
		</head>
		<body bgcolor=black text=white>
		<center><h2>Starting Guide</h2></center><hr>
		<br>

			-----------------------------------------<br>
			<br>
			Table of Content: <br>
			<br>
			1.Part One.<br>
			2.Part Two.<br>
			3.Part Three.<br>
			4.Part Four.<br>
			<br>
			------------------------------------<br>
			<br>
			<br>
			1.Part One:<br>
			<br>
			Well you started in a house of some sort and there are people around you.<br>
			There should have been a prompt telling you to type something to get past it,
			if there weren't fear not this wille xplain what to do.<br>
			The Prompt told you to talk to all the NPC(Non Playing Characters) around the
			place, so lets go ahead and do that.<br>
			You talk to either Mom or Dad you don't need to talk to both, you attain your
			first objective right there, make sure to keep an eye on your chat.<br>
			<br>
			<br>
			2.Part Two:<br>
			<br>
			Now you've spoken to either Mom or Dad and they have told you you need to speak
			to your older bother about something, Depending on what you said depends on what
			will happen. If you refused and got kicked out the house no worries you simply
			don't have to read the rest of this step.<br>
			For the rest of you who didn't get kicked out go find the Big Brother NPC in the
			house. Once you find him speak to him like you did the other NPC and he'll give
			you your next task.<br>
			<br>
			<br>
			3.Part Three:<br>
			<br>
			At this point you should have left the house. If you don't know what to do try looking
			around for another NPC to speak to, they'll be sure to help.<br>
			This step is quite important so you must anwser yes to the questions you are asked,
			well most anyway or you won't be going anywhere.<br>
			<br>
			<br>
			4.Part Four:<br>
			<br>
			This part is where players seem to have the most confusion<br>
			All you have to do is fight itachi and survive his attacks, you do not have to win.<br>
			In fact theres no way you could win against him.<br>
			So while you fight him he will teach you things and when it's over you'll gain a decent
			ammount of experience as you are on your way. The Experience gained should get you a few
			levels. In which you should be told something about skill points.<br>
			<br>
			The guide to skill points is in the regular guide if you wish to read it.<br>
			Anyway, Skill points can be found in your stats tab if you have any at all.
			You gain a few every time you level up and they can be used to increase your
			Strength, Power and Control.<br>
			For more on this look for skill points in the regular game guide.<br>
			<br>
			<br>
			Final:<br>
			<br>
			You did it, theres nothing else this guide need to teach you except one thing.<br>
			If you still don't quite understand and your stuck on something, use the Help Say
			button in commmands tab and someone should be able to assist you.<br>
			<br>




		<p>
		<br>
		</body>
		</html>
		"}
	usr << browse("[helptext4]","size=808x544,window=updatewindow")



mob/proc/adminguide()
	src<<"Loading..."
	sleep(10)
	var/helptext5 = {"
		<html>
		<STYLE>BODY {font-family: Verdana}</STYLE>
		<head>
		<title>Admin Guide</title>
		</head>
		<body bgcolor=black text=white>
		<center><h2>Admin Guide</h2></center><hr>
		<br>

			-----------------------------------------<br>
			<br>
			Table of Content: <br>
			<br>
			1.Admin Do Nots<br>
			2.Job description<br>
			<br>
			------------------------------------<br>
			<br>
			1.Admin Do Nots:<br>
			<br>
			As a admin that doesn't mean using your powers to make the game easier
			for yourself or thouse around you using verbs that give things.<br>
			As a Admin, DO NOT SUMMON or bring a player out of the starter scene,
			simply doing the starting screen gives them things that they can't gain elseware.<br>
			<br>
			<br>
			2.Job Description:<br>
			<br>
			As Admin you are entitled to help the players with matters they can't solve on their own.<br>
			This includes awnsering questions the players may have about things.(That aren't secret)<br>
			<br>





		<p>
		<br>
		</body>
		</html>
		"}
	usr << browse("[helptext5]","size=808x544,window=updatewindow")