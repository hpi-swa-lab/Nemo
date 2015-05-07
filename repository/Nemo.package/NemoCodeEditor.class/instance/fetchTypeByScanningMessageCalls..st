as yet unclassified
fetchTypeByScanningMessageCalls: aVariableString

	| type |
	aVariableString ifNil: [ ^ nil ].
	type := (NemoTypeGuessingNodeVisitor forVariable: aVariableString)
			guessTypeOn: (RBParser parseMethod: self string onError: [ ^ nil ]).
	type ifNil: [ ^ nil ].
	^ BPGuessedType
		type: type
		guessedFrom: #messageCallScanning