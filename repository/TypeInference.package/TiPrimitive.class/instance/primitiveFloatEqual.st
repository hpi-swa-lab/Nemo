float primitives
primitiveFloatEqual
	^ (self generalizedMatchOrFail: {{Float. Number}})	ifNotNil: [
			self booleanResult
	   ].

