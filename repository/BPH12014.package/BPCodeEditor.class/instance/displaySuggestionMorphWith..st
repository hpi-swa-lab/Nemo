as yet unclassified
displaySuggestionMorphWith: entries

	| suggestionMorph |
	suggestionMorph := BPAnnotatedSuggestionMorph new
		updateEntries: entries;
		position: self absolutePositionForPopUp;
		width: 300;
		openInWorld;
		focusTextFIeld.
	suggestionMorph bounds: (suggestionMorph bounds translatedToBeWithin: ActiveWorld bounds).
	^ suggestionMorph