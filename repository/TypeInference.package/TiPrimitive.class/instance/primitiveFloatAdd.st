float primitives
primitiveFloatAdd
	^ (self generalizedMatchOrFail: {{Float. Number}})
		ifNotNil: [self createResult addReturn: Float createType]