as yet unclassified
fetchTypeByScanningMessageCalls: aVariableString

	aVariableString ifNil: [ ^ nil ].
	^ (BPTypeGuessingNodeVisitor forVariable: aVariableString)
		guessTypeOn: (RBParser parseFaultyMethod: paragraph text asString).