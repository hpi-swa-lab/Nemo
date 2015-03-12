arithmetic primitives
primitiveMakePoint
	^(self generalizedMatchOrFail: {{SmallInteger. Number}. {Float. Number}}) ifNotNil:
		[self createResult addReturn: 
				(Point createInitializedType: {receiver}, arguments)]
