type inferencing
typeByScanningMessageCalls: aVariableString on: aSourceCodeString

	| type |
	aVariableString ifNil: [ ^ nil ].
	type := (NemoTypeGuessingNodeVisitor forVariable: aVariableString)
			guessTypeOn: ([RBParser parseFaultyMethod: aSourceCodeString] ifError: [ ^ nil ]).
	type ifNil: [ ^ nil ].
	^ BPGuessedType
		type: type
		guessedFrom: #messageCallScanning