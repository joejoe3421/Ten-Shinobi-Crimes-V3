mob/proc/ReportDate2(time)
	var/format = "<b>hh:mm:ss</b>" //MM/DD/YYYY
	return time2text(time, format)
mob
	verb
		File_report2()
			set name = "Suggest or Report"
			set category = "Commands"
			var/L=list("Suggestion","Bug / Glitch","Map / Icon Error","Buff","Nerf","Spelling / Grammar Mistakes","Admin Abuse","Player Abuse","Custom")
			var/T = input("Which of These best titles what your looking to report?","File Report") in L + list("Cancel")
			var/type=T
			if(T=="Cancel")
				return
			if(T=="Custom")
				type=input("What type of Report is this?") as text | null
				if(length(type) > 30)
					usr<<"The type can only be a max of 30 characters."
					return
				if(type==null||type=="")
					usr<<"You have to name the type it."
					return
			var/name=input("Name The Report") as text | null
			if(name==null||name=="")
				usr<<"You have to name it."
				return
			var/report=input("What is your report?") as text | null
			if(report==null||report=="")
				usr<<"You need to describe it somehow."
				return
			text2file("-------------------------------------------------------------------<br>","FileReports/Reports.html")// the .txt format works too opens in notepad
			//text2file("([ReportDate2(world.realtime)])","FileReports/Reports.html")
			text2file("<font size=4>Report Name: <font color=green>[html_encode(name)]<font color=black> <br>","FileReports/Reports.html")
			text2file("<font size=3>Report Type: <font color=green><b>[html_encode(type)]</b><font color=black> <br>","FileReports/Reports.html")
			text2file("<font size=3>Reported By: <font color=red>[usr](Key: [usr.key]){Client Address: [src.client.address] } <font color=black> <br>","FileReports/Reports.html")
			text2file("<font size=4>Report Description: <font color=blue>[html_encode(report)]<font color=black> <br>","FileReports/Reports.html")
			text2file("-------------------------------------------------------------------<br><br>","FileReports/Reports.html")
			world<<"<font color=red>A new Report has been created."
			usr<<"<font color=blue>Your Report has been sent, here is what you sent out."
			usr<<"<font color=red>Report Type: [html_encode(type)]"
			usr<<"<font color=red>Report Name: [html_encode(name)]"
			usr<<"<font color=red>Report Description: [html_encode(report)]"


mob/admin3/verb
	ViewBug()
		set category = "Admin"
		set name = "View Reports"
		//usr <<browse(file("FileReports/BugsOrGlitches.html"))
		usr << browse(file("FileReports/Reports.html"),"size=808x544,window=updatewindow")