returns
returnSymbolOrString
	^ self randomBoolean
		ifTrue: [self returnSymbol]
		ifFalse: [self returnString]