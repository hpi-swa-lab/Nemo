testing
testMessageCallImplementedInSuperClass

	| guessedType |
	guessedType := (NemoTypeGuessingNodeVisitor forVariable: 'a')
		guessTypeOn: (RBParser parseExpression: 'a borderInset').
	self assert: BorderedMorph identical: guessedType.