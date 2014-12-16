as yet unclassified
generateSuggestions: aString

	(aString beginsWith: '#')
		ifTrue: [^self findMessagesAndFormatResult: aString]
		ifFalse: [
			^self availableInputsIn: self model methodName
					on: self model clazz
					with: (RBParser parseMethod: self model contents asString)
					at: self variableNoteAtCaret token value
		].