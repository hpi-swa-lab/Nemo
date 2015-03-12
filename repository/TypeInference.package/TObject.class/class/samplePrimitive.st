examples
samplePrimitive
	^ (self matchReceiver: SmallInteger arguments: {SmallInteger})
		ifTrue: [TiPrimitiveResult new
					setReceiver: self receiverTypeSet
					arguments: self argumentTypeSets;
					addReturn: True createType;
					addReturn: False createType]
		ifFalse: [TiPrimitiveResult failed]
