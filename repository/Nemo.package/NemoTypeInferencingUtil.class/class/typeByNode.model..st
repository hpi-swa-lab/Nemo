type inferencing
typeByNode: aProgramNode model: aModel

	^ (self typeByNodeRecursive: aProgramNode model: aModel) ifNotNil: [ :returnValue |
		BPGuessedType
			type: returnValue class
			guessedFrom: #methodReturnType ]