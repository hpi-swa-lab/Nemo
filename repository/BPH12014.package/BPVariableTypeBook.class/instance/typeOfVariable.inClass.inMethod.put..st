as yet unclassified
typeOfVariable: aVariableSymbol inClass: aClass inMethod: aMethodSymbol put: aTypeClass

	^ self dictionary at: (self buildKey: aVariableSymbol class: aClass method: aMethodSymbol) put: aTypeClass.