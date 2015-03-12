type propagation
makeConnections
	invocations := Dictionary new.
	(primitive notNil and: [primitive neverFail])
		ifTrue: [^ self].
	definition makeConnections.