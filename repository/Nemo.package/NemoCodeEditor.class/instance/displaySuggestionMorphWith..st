code suggestion
displaySuggestionMorphWith: entries

	| suggestionMorph |
	suggestionMorph := NemoAnnotatedSuggestionMorph new
		updateEntries: entries;
		position: self absolutePositionForPopUp;
		openInWorld;
		focusTextFIeld.
	"suggestionMorph bounds: (suggestionMorph bounds translatedToBeWithin: ActiveWorld bounds)."
	^ suggestionMorph