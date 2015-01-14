as yet unclassified
availableMethodsOn: aString in: aMethodSymbol on: aClass with: aMethodNode
	aString = 'self'
		ifTrue: [ ^ aClass methodDict keys clone ].
	(self detectAvailableVarsOn: aString in: aMethodSymbol on: aClass with: aMethodNode)
		ifNil: [ ^ OrderedCollection new ]
		ifNotNilDo: [ :varEntry |
			^ (varEntry at: #types) asOrderedCollection first methodDict keys clone ].