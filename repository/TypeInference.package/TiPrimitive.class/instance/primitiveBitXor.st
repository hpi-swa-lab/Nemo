arithmetic primitives
primitiveBitXor
	^ (self matchOrFail: {{SmallInteger. SmallInteger}})
		ifNotNil: [self createResult addReturn: SmallInteger createType].
	