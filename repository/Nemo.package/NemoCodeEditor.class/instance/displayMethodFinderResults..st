code suggestion
displayMethodFinderResults: aCollection

	| entries suggestionMorph |
	entries := aCollection
		collect: [ :expression |
			NemoSuggestionEntry new id: expression; data: expression; displayValue: expression ].
	suggestionMorph := self displaySuggestionMorphWith: entries.
	suggestionMorph informationText: 'Method Finder'.
	suggestionMorph
		on: #confirmSelection do: [ :aSuggestionEntry |
			| lineIndices |
			lineIndices := [self lines detect: [ :l | self startIndex - 1 <= l last ]] ifError: [ ^ {} ].
			self paste: aSuggestionEntry data at: (lineIndices first to: lineIndices last) ];
		on: #textChanged do: [ :text | self textChanged: text on: suggestionMorph ];
		on: #focusChanged do: [ :hasFocus | hasFocus ifFalse: [ suggestionMorph delete. ] ];
		on: #suggestionCanceled do: [ self suggestionCanceledOn: suggestionMorph ].
	^ suggestionMorph