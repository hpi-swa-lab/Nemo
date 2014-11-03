actions
createLiteralsOutput: aClassName
	| literals literalsResult class |
	literals := Bag new.
	class := self cleanInput: aClassName.
	class ifNil: [^ ''].
	class withAllSubclassesDo: [ :eaClass |
		eaClass methodDict valuesDo: [ :compiledMethod |
			compiledMethod literalsDo: [ :literal |
				literal isSymbol ifTrue: [
					literals add: literal
				]
			]
		]
	].

	^ self formatOutput: literals sortedCounts