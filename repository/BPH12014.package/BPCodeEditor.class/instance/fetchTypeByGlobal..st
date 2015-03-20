as yet unclassified
fetchTypeByGlobal: aString

	 ^ BPGuessedType
		type: (Smalltalk at: aString asSymbol ifAbsent: [ ^ nil ]) class
		guessedFrom: #globalVariable