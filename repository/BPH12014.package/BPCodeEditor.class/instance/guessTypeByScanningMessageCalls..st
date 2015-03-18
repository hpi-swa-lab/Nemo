as yet unclassified
guessTypeByScanningMessageCalls: aVariableString

	^ (BPTypeGuessingNodeVisitor forVariable: aVariableString)
		guessTypeOn: (RBParser parseFaultyMethod: paragraph text asString).