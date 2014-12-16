as yet unclassified
availableTempVarNamesIn: aMethodSymbol on: aClass with: aMethodNode

	| vars |
	vars := OrderedCollection new.
	vars addAll: (aMethodNode arguments collect: [ :varNode |
		varNode token value.
	]).
	vars addAll: (aMethodNode body temporaries collect: [ :varNode |
		varNode token value.
	]).
	^vars