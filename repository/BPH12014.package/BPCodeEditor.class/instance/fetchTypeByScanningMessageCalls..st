as yet unclassified
fetchTypeByScanningMessageCalls: aVariableString

	| type |
	aVariableString ifNil: [ ^ nil ].
	type := (BPTypeGuessingNodeVisitor forVariable: aVariableString)
			guessTypeOn: ([RBParser parseFaultyMethod: paragraph text asString] ifError: [ ^ nil ]).
	type ifNil: [ ^ nil ].
	^ BPGuessedType
		type: type
		guessedFrom: #messageCallScanning