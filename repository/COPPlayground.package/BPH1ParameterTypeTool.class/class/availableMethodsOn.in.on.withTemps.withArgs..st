as yet unclassified
availableMethodsOn: aString in: aMethodSymbol on: aClass withTemps: aTempVarNameList withArgs: aArgsVarNameList
	aString = 'self'
		ifTrue: [ ^ aClass methodDict keys clone ].
	(self detectAvailableVarsOn: aString in: aMethodSymbol on: aClass withTemps: aTempVarNameList withArgs: aArgsVarNameList)
		ifNil: [ ^ OrderedCollection new ]
		ifNotNilDo: [ :varEntry |
			^ (varEntry at: #types) asOrderedCollection
				ifEmpty: [ ^ OrderedCollection new ]
				ifNotEmptyDo: [ :nonEmptyCollection | nonEmptyCollection first methodDict keys clone ]]