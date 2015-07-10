type inferencing
typeFromLiteral: aProgramNode

	aProgramNode ifNil: [ ^ nil ].
	aProgramNode isLiteral
		ifTrue: [ ^ NemoGuessedType
					type: aProgramNode value class
					guessedFrom: #literal ]
		ifFalse: [ ^ nil ]