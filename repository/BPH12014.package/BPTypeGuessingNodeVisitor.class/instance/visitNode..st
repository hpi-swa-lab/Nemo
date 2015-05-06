as yet unclassified
visitNode: aProgramNode

	self guessedType ifNotNil: [ ^ self ].
	^ super visitNode: aProgramNode