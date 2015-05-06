visiting
visitNode: aProgramNode

	self guessedType ifNotNil: [ ^ self ].
	^ super visitNode: aProgramNode