comparing
= aType
	self class == aType class ifFalse: [^ false].
	blockNode == aType blockNode ifTrue: [^ true].
	" podria mejorarse haciendo que los bloques vacios sean iguales"
	^ false
