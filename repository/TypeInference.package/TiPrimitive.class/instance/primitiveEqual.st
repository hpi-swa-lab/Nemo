arithmetic primitives
primitiveEqual
	^ (self generalizedMatchOrFail: {{SmallInteger. Number}})
		ifNotNil: [self booleanResult]
