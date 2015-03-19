as yet unclassified
visitMessageNode: aMessageNode

	(aMessageNode receiver isVariable and: [aMessageNode receiver name = self variableName])
		ifTrue: [ self selectors add: aMessageNode selector ].
	^ super visitMessageNode: aMessageNode