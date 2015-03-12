arithmetic primitives
primitiveWait
	^ (self matchOrFail: {{Semaphore}})
		ifNotNil: [self createResult addReturn: Semaphore createType].
	