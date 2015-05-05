as yet unclassified
fetchTypeByNode: aProgramNode

	^ (self fetchTypeByNodeRecursive: aProgramNode) ifNotNil: [ :returnValue |
		BPGuessedType
			type: returnValue class
			guessedFrom: #methodReturnType ]