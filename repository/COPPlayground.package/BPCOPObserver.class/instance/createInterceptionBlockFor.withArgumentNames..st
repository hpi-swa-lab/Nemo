as yet unclassified
createInterceptionBlockFor: aMethodReference withArgumentNames: anOrderedCollection

	^ [ :arguments |
		arguments doWithIndex: [ :argument :index |
			BPBookshelf variableTypeBook typeOfVariable: (anOrderedCollection at: index)
											inClass: aMethodReference actualClass
											inMethod: aMethodReference methodSymbol
											put: argument class.
		].
	]