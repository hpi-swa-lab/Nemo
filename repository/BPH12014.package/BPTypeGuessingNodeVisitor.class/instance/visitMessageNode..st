as yet unclassified
visitMessageNode: aMessageNode

	(aMessageNode receiver isVariable and: [aMessageNode receiver name = self variableName])
		ifTrue: [ self guessTypeForSelector: aMessageNode selector].
	^ super visitMessageNode: aMessageNode