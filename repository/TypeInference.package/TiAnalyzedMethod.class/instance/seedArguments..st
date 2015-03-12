type propagation
seedArguments: argTypesArray
	self debug:' seeding '.
	realReceiverType := argTypesArray at:1.
	currentInvocationArgTypesArray := argTypesArray copyFrom: 2 to: argTypesArray size.
	^ invocations at: argTypesArray
		ifAbsentPut: [self internalSeedArguments: argTypesArray]
