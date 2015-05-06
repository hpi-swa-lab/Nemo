testing
testSimpleUniqueMessageCall

	| guessedType |
	guessedType := (NemoTypeGuessingNodeVisitor forVariable: 'a')
		guessTypeOn: (RBParser parseExpression: 'a veryUniqueMessageName').
	self assert: NemoSampleClass identical: guessedType.