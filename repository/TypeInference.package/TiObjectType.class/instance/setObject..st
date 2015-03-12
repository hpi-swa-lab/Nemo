building
setObject: anObject
	exactClass := anObject class.
	self isBasicType
		ifTrue: [object := nil]
		ifFalse: [object := anObject]