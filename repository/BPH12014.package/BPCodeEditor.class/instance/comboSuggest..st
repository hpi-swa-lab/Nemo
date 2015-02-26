as yet unclassified
comboSuggest: aKeyboardEvent

	| expressionAtCaret guessedType suggestionMorph |
	expressionAtCaret := self receiverAtCaret ifNotNilDo: [ :receivingNode |
		guessedType := self guessTypeFor: receivingNode formattedCode..
		guessedType ifNil: [ ^ true ].
		suggestionMorph := BPSuggestionListMorph new
			updateEntries: 	(guessedType asOrderedCollection first methodDict keys
				collect: [ :aMethodSymbol |
					BPSuggestionEntry new
						id: aMethodSymbol;
						value: aMethodSymbol;
						displayValue: aMethodSymbol, (aMethodSymbol value ifNil: [''] ifNotNilDo: [ :aClass | ':',aClass asString]).
				]);
			position: self absolutePositionForPopUp;
			width: 300;
			openInWorld;
			focusTextFIeld
		"suggestionMorph := BPSuggestionListMorph new
			updateEntries: 	((BPClassUtil variablesWithTypesForClass: self model selectedClassOrMetaClass inMethod: self model selectedMessageName)
				collect: [ :aVariableTypeAssociation |
					BPSuggestionEntry new
						id: aVariableTypeAssociation key;
						value: aVariableTypeAssociation key;
						displayValue: aVariableTypeAssociation key, (aVariableTypeAssociation value ifNil: [''] ifNotNilDo: [ :aClass | ':',aClass asString]).
				]);
			position: self absolutePositionForPopUp;
			width: 300;
			openInWorld;
			focusTextFIeld."
	].
	^ true