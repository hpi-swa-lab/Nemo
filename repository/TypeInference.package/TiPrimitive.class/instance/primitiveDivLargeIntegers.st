large integer
primitiveDivLargeIntegers
	(self matchOrFail: {{LargePositiveInteger . LargePositiveInteger}}) ifNotNil: [^ self createResult addReturn: LargePositiveInteger createType; canFail ].
	(self matchOrFail: {{LargePositiveInteger . LargeNegativeInteger }}) ifNotNil: [^ self createResult addReturn: LargeNegativeInteger createType; canFail  ].
	(self matchOrFail: {{LargeNegativeInteger . LargePositiveInteger}}) ifNotNil: [^ self createResult addReturn: LargeNegativeInteger createType; canFail ].
	(self matchOrFail: {{LargeNegativeInteger . LargeNegativeInteger}}) ifNotNil: [^ self createResult addReturn: LargePositiveInteger createType; canFail ].
	^nil.