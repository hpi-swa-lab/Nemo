LargeIntegers
primDigitBitShiftMagnitude
	 (self matchOrFail: {{LargeNegativeInteger  . Integer}}) ifNotNil: 	[
			^self createResult addReturn: (LargeNegativeInteger) createType.
	].
	 (self generalizedMatchOrFail: {{Integer . Integer}}) ifNotNil: 	[
			^self createResult addReturn: (LargePositiveInteger) createType.
	].
	^nil.
	