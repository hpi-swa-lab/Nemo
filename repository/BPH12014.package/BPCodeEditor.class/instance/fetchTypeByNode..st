as yet unclassified
fetchTypeByNode: aProgramNode

	^ (self fetchTypeByNodeRecursive: aProgramNode) ifNotNil: [ :type |
		BPGuessedType
			type: type
			guessedFrom: #methodReturnType ]