*TypeInference
concreteTypeClass
	^ (self isVariable & self isPointers)
		ifTrue: [TiIndexedType]
		ifFalse: [TiObjectType]