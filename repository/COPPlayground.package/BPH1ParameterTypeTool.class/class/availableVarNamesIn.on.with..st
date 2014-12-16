as yet unclassified
availableVarNamesIn: aMethodSymbol on: aClass with: aMethodNode

	| vars |
	vars := OrderedCollection new.
	vars addAll: (self availableInstVarNamesOn: aClass).
	vars addAll: (self availableTempVarNamesIn: aMethodSymbol on: aClass with: aMethodNode).
	^vars