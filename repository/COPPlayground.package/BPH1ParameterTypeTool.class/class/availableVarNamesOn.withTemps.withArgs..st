as yet unclassified
availableVarNamesOn: aClass withTemps: aTempVarNameList withArgs: aArgsVarNameList

	| vars |
	vars := OrderedCollection new.
	vars addAll: (self availableInstVarNamesOn: aClass).
	vars addAll: aArgsVarNameList.
	vars addAll: aTempVarNameList.
	^vars