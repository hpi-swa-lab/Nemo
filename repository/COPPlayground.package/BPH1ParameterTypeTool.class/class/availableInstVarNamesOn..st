as yet unclassified
availableInstVarNamesOn: aClass

	| vars |
	vars := aClass allInstVarNames clone.
	^vars