arithmetic primitives
primitiveStringReplace
	^ (self matchOrFail: {{Array . SmallInteger . SmallInteger . Array . SmallInteger}})
		ifNotNil: [
			receiver addTypes: (arguments at: 3) indexedVarTypes.
			self createResult addReturn: receiver 
		]