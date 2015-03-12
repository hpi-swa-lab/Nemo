building
setClass: aClass initializedWith: typesArray
	self debugSender.
	self setClass: aClass.
	typesArray do: [:each | indexedVarTypes add: each]

