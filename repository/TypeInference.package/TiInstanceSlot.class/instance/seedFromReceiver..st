type propagation
seedFromReceiver: aType
	self debug:['Seeding to ', variableSlot asString].
	typeSet add: aType ifPresent: [^ self].
	variableSlot seed: aType
