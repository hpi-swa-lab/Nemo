array and stream primitives
primitiveSize 
	| receiverClass |
	receiverClass := self receiver exactClass.
	^ receiverClass isVariable
		ifTrue: 
			[self createResult addReturn: SmallInteger createType]
		ifFalse:[self primitiveFail]