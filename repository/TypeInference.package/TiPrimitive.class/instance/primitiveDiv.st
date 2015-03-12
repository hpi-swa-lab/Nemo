arithmetic primitives
primitiveDiv
	
| result |
	^ (self generalizedMatchOrFail: {{SmallInteger. Number}})
		ifNotNil: 
			[result := self createResult.
			self addIntegerReturnTo: result.
		]

