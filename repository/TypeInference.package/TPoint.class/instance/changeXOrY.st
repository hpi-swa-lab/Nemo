blocks
changeXOrY
	"
	TPoint new changeXOrY  
	" 
	self class randomBoolean 
		ifTrue: [self changeX]
		ifFalse: [y := $a]	
