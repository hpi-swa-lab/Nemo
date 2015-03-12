object access primitives
primitiveObjectAt

	 (self matchOrFail: {{CompiledMethod. SmallInteger }}) ifNotNil: [
		(arguments at:1 ) object = 1 ifTrue:[
			^self createResult addReturn: Array createType.
		] ifFalse:[
			| result | 
			result := self createResult addReturn: Symbol createType.
			result addReturn: Array createType.
			^result.
		]
	].

	^nil.
	
