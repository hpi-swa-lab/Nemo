type propagation
primitiveSignal
	^ (self matchOrFail: {{Semaphore}}) ifNotNil: [self createResult addReturn: self receiverTypeSet]

