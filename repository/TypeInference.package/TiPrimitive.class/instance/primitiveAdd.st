arithmetic primitives
primitiveAdd
	| result |
	 (self matchOrFail: {{SmallInteger. SmallInteger}}) ifNotNil: 	[
			result := self createResult.
			self addIntegerReturnTo: result.
			^result
	].

	 (self generalizedMatchOrFail: {{SmallInteger. Number}}) ifNotNil: 	[
			^self createResult addReturn: (arguments at:1).
	].

	^nil.