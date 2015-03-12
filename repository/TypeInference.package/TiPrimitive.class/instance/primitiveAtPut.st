object access primitives
primitiveAtPut
	| result |
	 (self generalizedMatchOrFail: {{ Object . SmallInteger . Object }}) ifNotNil: [
		(receiver isOfClass: Integer) ifTrue:  [
			^self primitiveFail.	
		].
		(receiver isKindOf: TiIndexedType ) ifTrue:[
			receiver addType: (arguments at:2).
		].
		^ self createResult addReturn: (arguments at:2).
	].

	^nil.