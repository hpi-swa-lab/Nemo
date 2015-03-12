logging
debugSender
	self class processor process: (LogEntity for:['debug sender'] in: thisContext sender with:#debug).