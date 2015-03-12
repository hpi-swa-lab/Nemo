building
setClass: aClass initializedWith: typesArray
	self debugSender.
	self setClass: aClass.
	1 to: instVarTypes size 
		do: [:i | instVarTypes at: i put: (typesArray at: i)]
