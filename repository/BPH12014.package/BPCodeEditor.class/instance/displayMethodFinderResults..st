as yet unclassified
displayMethodFinderResults: aCollection

	| entries suggestionMorph |
	entries := aCollection
		collect: [ :expression |
			BPSuggestionEntry new id: expression; data: expression; displayValue: expression ].

	suggestionMorph := self displaySuggestionMorphWith: entries.
	suggestionMorph
		on: #confirmSelection do: [ :aSuggestionEntry | | selectedDataString |
			selectedDataString := aSuggestionEntry data.
			self pasteAtCaret: selectedDataString ].
	^ suggestionMorph