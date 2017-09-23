world
	hub = "Joejoe13.PathOfTheShinobi"
	hub_password = "remote25"
//	mob = /mob/Guest
	name = "Path Of the Shinobi V1"
	status = "Path Of The Shinobi <font size=1><font face=verdana><font color=red>Version 0.005"





var
	fan=list()


mob
	var
		gotfanreward=0








proc
	Show_Fans()//(hub as text)
		var/hub = "Joejoe13.PathOfTheShinobi"
		var/list/fans = getFans(hub)
		//src << "These are the fans of [hub]."
		var/gamefans=list()
		for(var/x in fans)
			//src << "[x]" + ((fans[x]=="MEMBER")? " (MEMBER)" : "")
			gamefans += x
		fan=gamefans
		//src << "There are [fans.len] fans."




proc
	RetrievePage(page,type)
		switch(type)
			if("hub fans","fans") page = "http://byond.com/hub/[page]&command=view_fans"
			if("hub id","id", null) page = "http://byond.com/hub/[page]"
			if("member title","mtitle") page = "http://www.byond.com/members/?command=pager_popup_ajax&key=[page]"
			if("byond","byond games","byond players") page = "http://www.byond.com/hub/Joejoe13.PathOfTheShinobi"
			if("text")  page = "http://byond.com/hub/[page]?format=text"
		var/list/http[]=world.Export(page)
		if(!http)
			CRASH("FAIL RETRIEVING [type] @ PAGE [page]")
		return file2text(http["CONTENT"])

	getHubID(hub)
		var
			p = RetrievePage(hub,"hub id")
			begin= findtext(p,"hub_attachment_")
		if(!begin)
			return
		var
			end = findtext(p,"{",begin)
			pid = copytext(p,begin+15,end-1)
		return pid

	getFans(hub)
		var/p = RetrievePage(hub,"hub fans")
		. = list()
		if(!findtext(p,"guild_member_list"))
			return
		var/pfans = copytext(p,findtext(p,"guild_member_list")+30, findtext(p,"bottom_space"))
		while(findtext(pfans,"\">"))
			var
				a = findtext(pfans, "\">")
				keyg
				m
			if(findtext(copytext(pfans, a, a+6), "<img"))
				pfans = copytext(pfans, a+9)
				a = findtext(pfans, "\">")
				m = 1
			var/b = findtext(pfans, "</a>", a)
			keyg = copytext(pfans, a+2, b)
			pfans = copytext(pfans, b+3)
			.[keyg] = (m? "MEMBER" : )


















mob/verb/Hub_Information()
	set category = "Commands"

	var/path = "Joejoe13.PathOfTheShinobi"

	// If the hub page is invalid, don't do anything.
	var/hub_page/page = new(path)
	if(!page)
		src << "Could not access hub path: [path]."
		return

	// View some basic information about the game.
	/*src << "[page.title], created by [page.author] (version [page.version])."
	src << "Description: [page.short_desc]"
	src << "Detected [page.servers.len] server\s for this game."*/
	src << "Path Of the Shinobi, created by [global.owner] (version [global.version])."
	src << "Description: [global.desc]"
	src << "Detected [(page.servers.len)+1] server\s for this game."

	// If there are any servers hosted, display their status and a join link.
	if(page.servers.len)

		for(var/hub_server/server in page.servers)
			src << "<a href=[server.url]>[server.status]</a>"

			// If there are any players in the server, list who is playing.
			if(server.users)
				src << "Players:"

				for(var/player in server.users)
					src << "\t[player]"

	// Spacer
	src << ""

	return


var
	owner="Joejoe13"
	version=0.007
	desc=""






















/*mob/verb/ViewHub()

	var/path = input(src, "Choose the path for the hub page you want to view. \
		Paths are entered in the format of Author.Title, such as Abra.Castle or \
		IccusionEntertainment.Seika.", "Path") as text

	// If the hub page is invalid, don't do anything.
	var/hub_page/page = new(path)
	if(!page)
		src << "Could not access hub path: [path]."
		return

	// View some basic information about the game.
	src << "[page.title], created by [page.author] (version [page.version])."
	src << "Description: [page.short_desc]"
	src << "Detected [page.servers.len] server\s for this game."

	// If there are any servers hosted, display their status and a join link.
	if(page.servers.len)

		for(var/hub_server/server in page.servers)
			src << "<a href=[server.url]>[server.status]</a>"

			// If there are any players in the server, list who is playing.
			if(server.users)
				src << "Players:"

				for(var/player in server.users)
					src << "\t[player]"

	// Spacer
	src << ""

	return*/







hub_page
	var
		title
		author
		path
		short_desc
		long_desc
		version
		banner
		icon
		small_icon

		list/servers = list()

		// For internal use:
		hub_address = "http://www.byond.com/games/Katkiller91.TenShinobiCrimes"


// Hub server datums contain information about the url (join link), status
// and all the users who are playing on this specific server.
hub_server
	var
		url
		status
		list/users = list()


// You can specify the path to the hub page in the datum's new proc.
// If it fails to update the datum because the page could not be read
// properly, it will self-delete.
hub_page/New(hub_path)
	if(!src.Update(hub_path))
		del(src)


// Updates the datum with information extracted from the hub page.
// If no path argument is specified, it will attempt to use the datum's
// existing hub path, so that updates to an existing datum do not need
// to include the path address again.
hub_page/proc/Update(hub_path)
	var/savefile/hubpage = src.Import(hub_path)
	if(!hubpage)
		return 0

	// Load the information about the hub entry.
	hubpage.cd = "/general"
	src.title = hubpage["title"]
	src.author = hubpage["author"]
	src.path = hubpage["path"]
	src.short_desc = hubpage["short_desc"]
	src.long_desc = hubpage["long_desc"]
	src.version = hubpage["version"]
	src.banner = hubpage["banner"]
	src.icon = hubpage["icon"]
	src.small_icon = hubpage["small_icon"]

	// Load the server datums.
	src.servers = src.Servers(hubpage)
	return 1


// This builds the hub address from the path value. If at some time you
// want to change this library to access something other than BYOND games,
// you may want to alter the return value for this proc.
hub_page/proc/BuildAddress(hub_path)
	return "[src.hub_address][hub_path]?format=text"


// This converts the content of the web page into a savefile and returns
// the newly created savefile containing the hub page's information.
hub_page/proc/Import(hub_path)
	ASSERT(hub_path)

	// Get the hub page for the game.
	var/address = world.Export(src.BuildAddress(hub_path))

	// Web address not found.
	if(!address)
		return

	// No such hub entry on BYOND servers.
	var/content_length = address["CONTENT-LENGTH"]
	if(content_length == "305" || !content_length)
		return

	// Acquire the content of the hub page in text format, and then
	// import the contents of the address into a savefile.
	var/text = file2text(address["CONTENT"])
	var/savefile/savefile = new()
	savefile.ImportText("/", text)
	return savefile


// This function will scan the hub file and find any available servers,
// then create a series of server datums for each server, fill in the
// appropriate information for them, and return the list of servers.
hub_page/proc/Servers(savefile/hubpage)
	ASSERT(hubpage)

	// Create a list of servers.
	var/list/servers = list()
	hubpage.cd = "/"

	// Open up the "world" directory in the hubpage.
	for(var/directory in hubpage.dir)
		hubpage.cd = "/[directory]"

		// Loop through the server subdirectories in the hubpage.
		for(var/subdirectory in hubpage.dir)

			// If this subdirectory is not a number, then its not a server.
			if(!text2num(subdirectory))
				continue

			hubpage.cd = "/[directory]/[subdirectory]"

			// Create a new server datum for this server listing.
			var/hub_server/server = new()
			server.url = hubpage["url"]
			server.status = hubpage["status"]
			server.users = hubpage["users"]

			// Add this completed server datum to the list.
			servers += server

	// Send a list of server datums back to the user.
	return servers
