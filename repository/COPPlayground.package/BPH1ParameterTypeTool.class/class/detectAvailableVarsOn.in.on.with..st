as yet unclassified
detectAvailableVarsOn: aString in: aMethodSymbol on: aClass with: aMethodNode 
	^ (self availableVarsIn: aMethodSymbol	on: aClass with: aMethodNode)
		detect: [:varEntry | (varEntry at: #name)	= aString]
		ifNone: []