as yet unclassified
fetchTypeFromLiteral: aProgramNode

	aProgramNode ifNil: [ ^ nil ].
	aProgramNode isLiteral
		ifTrue: [ ^ BPGuessedType
					type: aProgramNode value class
					guessedFrom: #literal ]
		ifFalse: [ ^ nil ]