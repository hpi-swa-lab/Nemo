as yet unclassified
comboSuggest: aKeyboardEvent

	| suggestionMorph |
	suggestionMorph := BPSuggestionListMorph new
		updateEntries: {
			BPSuggestionEntry new id: 1; value: 'abc'.
			BPSuggestionEntry new id: 2; value: 'def'.
			BPSuggestionEntry new id: 3; value: 'ghi'.};
		position: self absolutePositionForPopUp;
		openInWorld;
		focusTextFIeld.
	^ true