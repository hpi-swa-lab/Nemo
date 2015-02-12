as yet unclassified
comboSuggest: aKeyboardEvent

	| suggestionMorph |
	suggestionMorph := BPSuggestionListMorph new
		updateEntries: 	((BPClassUtil variablesWithTypesForClass: self model clazz inMethod: self model methodName asSymbol)
			collect: [ :aVariableTypeAssociation |
				BPSuggestionEntry new
					id: aVariableTypeAssociation key;
					value: aVariableTypeAssociation key;
					displayValue: aVariableTypeAssociation key, (aVariableTypeAssociation value ifNil: [''] ifNotNilDo: [ :aClass | ':',aClass asString]).
			]);
		position: self absolutePositionForPopUp;
		width: 300;
		openInWorld;
		focusTextFIeld.
	^ true