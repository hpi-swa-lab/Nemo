arithmetic primitives
primitiveDivide
	| result |
	^ (self generalizedMatchOrFail:  {{SmallInteger. Number}})
		ifNotNil: 
			[result := self createResult.
			result addReturn: (Fraction createInitializedType: {SmallInteger. (arguments at:1)}).
			self addIntegerReturnTo: result. 
			result]



