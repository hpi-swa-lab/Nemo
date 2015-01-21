as yet unclassified
detectAvailableVarsOn: aString in: aMethodSymbol on: aClass withTemps: aTempVarNameList withArgs: aArgsVarNameList
	^ (self availableVarsIn: aMethodSymbol	on: aClass withTemps: aTempVarNameList withArgs: aArgsVarNameList)
		detect: [:varEntry | (varEntry at: #name)	= aString]
		ifNone: []