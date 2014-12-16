as yet unclassified
availableVarsIn: aMethodSymbol on: aClass with: aMethodNode

	^(self availableVarNamesIn: aMethodSymbol on: aClass with: aMethodNode) collect: [ :varName |
		Dictionary new
			at: #name put: varName;
			at: #types put: (self typesFor: varName in: aMethodSymbol on: aClass);
			yourself.
	]