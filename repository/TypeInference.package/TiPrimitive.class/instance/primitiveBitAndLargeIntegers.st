large integer
primitiveBitAndLargeIntegers
	(self matchOrFail: {{LargePositiveInteger . LargePositiveInteger}}) ifNotNil: [^ self createResult addReturn: LargePositiveInteger createType].
	(self matchOrFail: {{LargePositiveInteger . LargeNegativeInteger }}) ifNotNil: [^ self createResult addReturn: LargePositiveInteger createType].
	(self matchOrFail: {{LargeNegativeInteger . LargePositiveInteger}}) ifNotNil: [^ self createResult addReturn: LargeNegativeInteger createType].
	(self matchOrFail: {{LargeNegativeInteger . LargeNegativeInteger}}) ifNotNil: [^ self createResult addReturn: LargeNegativeInteger createType].
	^nil.