LargeIntegers
primAnyBitFromTo
	^ (self generalizedMatchOrFail: {{Integer . Integer . Integer}})
		ifNotNil: [self booleanResult].
