as yet unclassified
availableVarsIn: aMethodSymbol on: aClass with: aMethodNode ofType: aFilterClass

	^(self availableVarsIn: aMethodSymbol on: aClass with: aMethodNode) select: [ :varEntry |
		(varEntry at: #types) anySatisfy: [ :type |
			type = aFilterClass.
		].
	]