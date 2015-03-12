LargeIntegers
primDigitCompare
	(self generalizedMatchOrFail:  {{LargePositiveInteger . Number }}) ifNotNil: 	[
			^self createResult addReturn: (SmallInteger) createType.
	].