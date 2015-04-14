quick-testing
quickCheck: aMethodReference
	aMethodReference compiledMethod ifNotNil: [ :method |
		method isQuick ifTrue: [ ^ false ].
		(self isReturnSelf: method) ifTrue: [ ^ false ].
		(self isReturnConstant: method) ifTrue: [ ^ false ].
		(self isVariableModifying: method) ifTrue: [ ^ true ].
		method pragmas ifNotEmpty: [ ^ true ].
		method messages ifNotEmpty: [ ^ true ] ].
	^ nil