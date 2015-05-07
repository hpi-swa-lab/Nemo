type inferencing
typeByScanningMessageCalls: aVariableString on: aSourceCodeString

	| type |
	aVariableString ifNil: [ ^ nil ].
	type := (NemoTypeGuessingNodeVisitor forVariable: aVariableString)
			guessTypeOn: (NemoParserUtil parseASTFor: aSourceCodeString).
	type ifNil: [ ^ nil ].
	^ BPGuessedType
		type: type
		guessedFrom: #messageCallScanning