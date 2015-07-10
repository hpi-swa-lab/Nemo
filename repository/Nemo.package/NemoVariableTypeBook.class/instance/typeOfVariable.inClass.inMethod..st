as yet unclassified
typeOfVariable: aVariableSymbol inClass: aClass inMethod: aMethodSymbol

	^ self dictionary at: (self buildKey: aVariableSymbol class: aClass method: aMethodSymbol) ifAbsent: [].