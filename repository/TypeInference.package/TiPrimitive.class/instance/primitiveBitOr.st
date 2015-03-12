arithmetic primitives
primitiveBitOr
	^ (self matchOrFail: {{SmallInteger. SmallInteger}})
		ifNotNil: [self createResult addReturn: SmallInteger createType].
	