actions
findMethodFor: aContext changing: selector
	| contextClass methods |
	methods := Set new.
	contextClass := aContext class.
	contextClass withAllSuperclassesDo: [ :eaClass |
		eaClass methodDict valuesDo: [ :compiledMethod |
			compiledMethod literalsDo: [ :literal |
				literal isSymbol ifTrue: [
					literal = selector ifTrue: [
						methods add: compiledMethod selector
					]
				]
			]
		]
	].
	^ self formatOutput: methods