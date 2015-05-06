quick-testing
quickCheck: aMethodReference

	aMethodReference compiledMethod ifNotNil: [ :method |
		method isQuick ifTrue: [ ^ false ].
		method primitive isZero ifFalse: [ ^ true ].
		^ self areInstructionsSideEffecting: method ].
	^ nil