arithmetic primitives
primitiveBitAnd
	^ (self matchOrFail: {{SmallInteger. SmallInteger}})
		ifNotNil: [self createResult addReturn: SmallInteger createType].
	