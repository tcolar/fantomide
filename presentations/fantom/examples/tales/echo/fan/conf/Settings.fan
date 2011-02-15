using sql
using tales

class Settings{
	Str:Obj settings := Str:Obj[
		"db-host-string" : "",
		"db-username": "",
		"db-password" : "",
	
		"mail-host" : "",
		"mail-username":"",
		"mail-password":"",
		
		"jquery-location" :  "/talesRes/jquery-1.3.2.min.js",
		"doc-type": """<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">""",
		
		"assume-js-globals": Str["\$", "alert", "confirm", "prompt", "window", 
					"document", "parseInt", "encodeURI", "encodeURIComponent",
					 "decodeURI", "decodeURIComponent", 
					"parseFloat", "isNaN", "isFinite", "eval", "callServer", "Math"],
		"assume-js-objects": Str[,]
		
	]
}