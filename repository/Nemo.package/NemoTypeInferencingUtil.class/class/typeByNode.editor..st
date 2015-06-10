type inferencing
typeByNode: aProgramNode editor: anEditor

	^ (self typeByNodeRecursive: aProgramNode model: anEditor model) ifNotNil: [ :returnValue |
		BPGuessedType
			type: returnValue class
			guessedFrom: #methodReturnType ]