comparing
= otherType
	self == otherType ifTrue: [^ true].
	super = otherType ifFalse: [^ false].
	indexedVarTypes isNil 
		ifTrue: [^ otherType indexedVarTypes isNil]
		ifFalse: [otherType indexedVarTypes isNil 
					ifTrue: [^ false]
					ifFalse: [indexedVarTypes 
								do: [:each | (otherType indexedVarTypes includes: each)
												ifFalse: [^ false]]]].
	^ true
