comparing
= otherType
	self == otherType ifTrue: [^ true].
	((self class == otherType class 
	and: [self exactClass == otherType exactClass])
	and: [object == otherType object or: [object = otherType object]])
		ifFalse: [^ false].
	instVarTypes isNil 
		ifTrue: [^ otherType instVarTypes isNil]
		ifFalse: [otherType instVarTypes isNil 
					ifTrue: [^ false]
					ifFalse: [1 to: instVarTypes size 
								do: [:i | (instVarTypes at: i) = (otherType instVarTypes at: i)
											ifFalse: [^ false]]]].
	^ true

