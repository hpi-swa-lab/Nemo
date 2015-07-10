type inferencing
typeByScanningMessageCalls: aVariableString on: aSourceCodeString

	| type |
	aVariableString ifNil: [ ^ nil ].
	type := (NemoTypeGuessingNodeVisitor forVariable: aVariableString)
			guessTypeOn: (NemoParserUtil parseASTFromString: aSourceCodeString).
	type ifNil: [ ^ nil ].
	^ NemoGuessedType
		type: type
		guessedFrom: #messageCallScanning