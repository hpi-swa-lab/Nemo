float primitives
primitiveTruncated
	| result |
	^ (self matchOrFail: {{Float}})
		ifNotNil: 
			[result :=self createResult.
			self addIntegerReturnTo: result.
			result]