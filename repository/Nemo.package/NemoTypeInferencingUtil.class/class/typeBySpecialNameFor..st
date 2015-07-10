type inferencing
typeBySpecialNameFor: anExpressionString

	anExpressionString ifNil: [ ^ nil ].
	(anExpressionString endsWith: 'Name')
		ifTrue: [ ^ NemoGuessedType type: String guessedFrom: #variableName  ].
	^nil