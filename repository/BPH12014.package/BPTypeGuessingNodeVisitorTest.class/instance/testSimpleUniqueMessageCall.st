as yet unclassified
testSimpleUniqueMessageCall

	| guessedType |
	guessedType := (BPTypeGuessingNodeVisitor forVariable: 'a')
		guessTypeOn: (RBParser parseExpression: 'a veryUniqueMessageName').
	self assert: BPTestClass identical: guessedType.