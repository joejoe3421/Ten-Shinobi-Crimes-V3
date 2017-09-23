#define ALIGN_RIGHT -1
#define ALIGN_CENTER 0
#define ALIGN_LEFT 1

var/const/_Numbers = 'DamageNums.dmi' //Allows one to change the icon
var/const/_IconWidth = 7 //Actual PixelWidth of a number + 1, allows for drawing custom number


proc
	DamageNumbers(var/number, var/turf/location, var/maxdigits=9,
		var/showmiss=1, var/align=ALIGN_CENTER, var/color="#000000")
		if(!location) CRASH("DNumbers: Missing location.")
		if(!maxdigits || !isnum(maxdigits) || maxdigits<=0) CRASH("DNumbers: maxdigits variable is invalid.")

		if((!number || number<=0))
			return
		number*=10
		number = num2text(number, 10)

		var/width = lentext(number)
		if(width>maxdigits)
			number = _ReturnMax(maxdigits)
			width = maxdigits

		var
			pixels = (_IconWidth * width)
			tiles = ceil(pixels / 32)
			startloc

		startloc = (round(tiles/2)*-32)-pixels+_IconWidth+1

		for(var/i=1, i<= width, i++)
			spawn() _DrawNumber(copytext(number, i, i+1), startloc, location, color)
			startloc += 5




	_DrawNumber(var/iconstate, var/offset, var/turf/location, var/color="#000000")
		var/image/I = image(_Numbers, location, iconstate, FLY_LAYER)
		I.icon+=rgb(0,150,20)
		I.icon += color
		I.pixel_x = offset
		I.pixel_y = 5
		world << I
		spawn(15) del(I)

proc
	_ReturnMax(var/count=5)
		if(!count) return 0
		var/Number = ""
		for(var/i=1, i<=count, ++i) Number+="9"
		return Number

	ceil(var/number)
		var/nn = round(number)
		return (nn!=number)?(++nn):(number)

mob
	proc
		DamageShow(var/damage)
			DamageNumbers(damage,src.loc)
