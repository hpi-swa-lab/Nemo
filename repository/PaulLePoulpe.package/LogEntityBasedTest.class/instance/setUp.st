set up
setUp
	info := LogEntity for:['something'] in: thisContext sender with:#info.
	debug := LogEntity for:['something'] in: thisContext sender with:#debug.
	error := LogEntity for:['something'] in: thisContext sender with:#error.
	warn := LogEntity for:['something'] in: thisContext sender with:#warn.