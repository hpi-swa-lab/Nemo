as yet unclassified
availableMethodsOn: aString in: aMethodSymbol on: aClass with: aMethodNode

	((self availableVarsIn: aMethodSymbol on: aClass with: aMethodNode)
		detect: [ :varEntry |
			(varEntry at: #name) = aString.
		] ifNone: []) ifNil: [
			^OrderedCollection new
		] ifNotNilDo: [ :varEntry |
			^(varEntry at: #types) asOrderedCollection first methodDict keys clone
		].