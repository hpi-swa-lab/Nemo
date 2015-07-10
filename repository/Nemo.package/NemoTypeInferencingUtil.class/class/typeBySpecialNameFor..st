type inferencing
typeBySpecialNameFor: anExpressionString

	anExpressionString ifNil: [ ^ nil ].
	(anExpressionString endsWith: 'Name')
		ifTrue: [ ^ BPGuessedType type: String guessedFrom: #variableName  ].
	^nil