as yet unclassified
availableVarsIn: aMethodSymbol on: aClass withTemps: aTempVarNameList withArgs: aArgsVarNameList ofType: aFilterClass

	^(self availableVarsIn: aMethodSymbol on: aClass withTemps: aTempVarNameList withArgs: aArgsVarNameList) select: [ :varEntry |
		(varEntry at: #types) anySatisfy: [ :type |
			type = aFilterClass.
		].
	]