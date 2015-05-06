api
guessTypeOn: anRBProgramNode

	self visitNode: anRBProgramNode.
	^ self guessType