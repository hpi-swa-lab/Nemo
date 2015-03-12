float primitives
primitiveArctan
	^ (self generalizedMatchOrFail:  {{Number}})
		ifNotNil: [self createResult addReturn: Float createType]