large integer
primitiveDivideLargeIntegers
	|result|
	result := nil.
	
	(self matchOrFail: {{LargePositiveInteger . LargePositiveInteger}}) ifNotNil: [
			result := self createResult.
			result addReturn: (Fraction createInitializedType: {LargePositiveInteger. LargePositiveInteger}).
			self addIntegerReturnTo: result. 
			result canFail
	].
	(self matchOrFail: {{LargePositiveInteger . LargeNegativeInteger }}) ifNotNil: [
			result := self createResult.
			result addReturn: (Fraction createInitializedType: {LargePositiveInteger. LargeNegativeInteger}).
			self addIntegerReturnTo: result. 
			result canFail
	].
	(self matchOrFail: {{LargeNegativeInteger . LargePositiveInteger}}) ifNotNil: [
			result := self createResult.
			result addReturn: (Fraction createInitializedType: {LargeNegativeInteger. LargePositiveInteger}).
			self addIntegerReturnTo: result. 
			result canFail
	].
	(self matchOrFail: {{LargeNegativeInteger . LargeNegativeInteger}}) ifNotNil: [
			result := self createResult.
			result addReturn: (Fraction createInitializedType: {LargeNegativeInteger. LargeNegativeInteger}).
			self addIntegerReturnTo: result. 
			result canFail
	].
	^result.