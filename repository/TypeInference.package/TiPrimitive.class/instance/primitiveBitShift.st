arithmetic primitives
primitiveBitShift
	^ (self matchOrFail: {{SmallInteger. SmallInteger}})
		ifNotNil: [self createResult addReturn: SmallInteger createType ]