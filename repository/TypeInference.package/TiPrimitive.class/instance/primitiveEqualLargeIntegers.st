large integer
primitiveEqualLargeIntegers
	 (self generalizedMatchOrFail: {{LargePositiveInteger . Number }}) ifNotNil: [^ self booleanResult].
	^nil.
