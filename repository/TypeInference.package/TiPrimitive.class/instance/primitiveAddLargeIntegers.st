large integer
primitiveAddLargeIntegers
	 (self generalizedMatchOrFail:  {{LargePositiveInteger  . Number }}) ifNotNil: [ ^self createResult addReturn: LargePositiveInteger  createType].
	 (self generalizedMatchOrFail:  {{LargeNegativeInteger  . Number  }}) ifNotNil: [ ^self createResult addReturn: LargeNegativeInteger  createType].
	^nil.