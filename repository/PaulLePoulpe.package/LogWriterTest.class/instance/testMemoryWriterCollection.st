tests
testMemoryWriterCollection
	| mem |
	mem := LogMemoryWriter instance.
	mem write: 'something'.
	self assert: (mem logs first = 'something') description: 'something has not been writen at memoryWriter'