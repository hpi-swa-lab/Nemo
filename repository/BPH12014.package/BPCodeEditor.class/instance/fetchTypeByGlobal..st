as yet unclassified
fetchTypeByGlobal: aString

	 ^ (Smalltalk at: aString asSymbol ifAbsent: [ ^ nil ]) class