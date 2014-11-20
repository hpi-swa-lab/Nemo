as yet unclassified
createBlockFor: aMethodSymbol on: aClass

	^[ :aCollectionOfArguments | | argumentList |
		argumentList := (self classes at: aClass)	at: aMethodSymbol.
		1 to: aCollectionOfArguments size do: [ :index |
			(argumentList at: index ifAbsentPut: [Set new.])
				add: (aCollectionOfArguments at: index) class.
		].
	].