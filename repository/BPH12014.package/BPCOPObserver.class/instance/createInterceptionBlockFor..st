as yet unclassified
createInterceptionBlockFor: aMethodReference

	^ [ :arguments |
		self halt.
		arguments do: [ :argument |
			BPBookshelf variableTypeBook typeOfVariable: 'test' inClass: aMethodReference inMethod: aMethodReference methodSymbol put: argument class.
		].
	]