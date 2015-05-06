as yet unclassified
testMessageCallImplementedInSuperClass

	| guessedType |
	guessedType := (BPTypeGuessingNodeVisitor forVariable: 'a')
		guessTypeOn: (RBParser parseExpression: 'a borderInset').
	self assert: BorderedMorph identical: guessedType.