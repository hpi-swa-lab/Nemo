logging
debug: aLog 
	self class processor process: (LogEntity for:aLog in: thisContext sender with:#debug).