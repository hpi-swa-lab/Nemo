type inferencing
typeByGlobal: aString or: aProgramNode

	| global |
	global := aString.
	aProgramNode ifNotNil: [ aProgramNode isVariable ifTrue: [ global := aProgramNode token value ] ].
	 ^ NemoGuessedType
		type: (Smalltalk at: global asSymbol ifAbsent: [ ^ nil ]) class
		guessedFrom: #globalVariable