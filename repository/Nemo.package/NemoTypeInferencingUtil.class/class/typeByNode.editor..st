type inferencing
typeByNode: aProgramNode editor: anEditor

	^ (self typeByNodeRecursive: aProgramNode model: anEditor model) ifNotNil: [ :returnValue |
		NemoGuessedType
			type: returnValue class
			guessedFrom: #methodReturnType ]