float primitives
primitiveLogN
	^ (self matchOrFail: {{Float} . {SmallInteger}}) 
		ifNotNil: 
			[self createResult addReturn: Float createType]

	