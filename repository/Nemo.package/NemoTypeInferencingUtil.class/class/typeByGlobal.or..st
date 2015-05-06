type inferencing
typeByGlobal: aString or: aProgramNode

	| global |
	global := aString.
	aProgramNode ifNotNil: [ aProgramNode isVariable ifTrue: [ global := aProgramNode token value ] ].
	 ^ BPGuessedType
		type: (Smalltalk at: global asSymbol ifAbsent: [ ^ nil ]) class
		guessedFrom: #globalVariable