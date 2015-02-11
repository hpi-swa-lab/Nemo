as yet unclassified
generateSuggestions: aString
	
	(aString beginsWith: '#')
		ifTrue: [^self findMessagesAndFormatResult: aString]
		ifFalse: [
			| tempsAndArgs |
			tempsAndArgs := self parseMethodTempsAndArgs.
			^self availableInputsIn: self model methodName
					on: self model clazz
					withTemps: tempsAndArgs first
					withArgs: tempsAndArgs second
					at: (self variableNodeAtCaret ifNil: [''] ifNotNilDo: [ :node | node token value ])
		].