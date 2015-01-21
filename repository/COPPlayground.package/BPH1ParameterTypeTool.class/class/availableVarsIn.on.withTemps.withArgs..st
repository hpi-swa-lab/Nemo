as yet unclassified
availableVarsIn: aMethodSymbol on: aClass withTemps: aTempVarNameList withArgs: aArgsVarNameList

	^(self availableVarNamesOn: aClass withTemps: aTempVarNameList withArgs: aArgsVarNameList) collect: [ :varName |
		Dictionary new
			at: #name put: varName;
			at: #types put: (self typesFor: varName in: aMethodSymbol on: aClass);
			yourself.
	]