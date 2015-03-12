float primitives
primitiveAsFloat
	^ (self generalizedMatchOrFail: {{Number}}) ifNotNil: [
		self createResult addReturn: Float createType
	].

	