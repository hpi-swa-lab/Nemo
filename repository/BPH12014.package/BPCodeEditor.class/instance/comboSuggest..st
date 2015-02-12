as yet unclassified
comboSuggest: aKeyboardEvent

	| suggestionMorph |
	suggestionMorph := BPSuggestionListMorph new
		updateEntries: 	((BPClassUtil variablesForClass: self model clazz inMethod: self model methodName asSymbol)
			keysAndValuesDo: [ :key :value |
				BPSuggestionEntry new id: key; value: value.
			]);
		position: self absolutePositionForPopUp;
		openInWorld;
		focusTextFIeld.
	^ true