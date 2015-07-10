initialization
initializeChainSuggestionListMorph

	self chainSuggestionListMorph: (NemoSuggestionListMorph new
			width: 350).
	self addMorphBack: self chainSuggestionListMorph.
	self chainSuggestionListMorph
		updateMaxItems: 10;
		on: #navigateRight do: [ self expandUsages ];
		on: #navigateUp do: [ self updateUsages ];
		on: #navigateDown do: [ self updateUsages ];
		on: #escapeKeyPressed do: [ self delete.
			self emit: #suggestionCanceled.
			false ];
		on: #confirmSelection do: [ :selectedEntry | self delete. ];
		color: Color transparent;
		borderWidth: 0;
		borderColor: self defaultBorderColor.
	self chainSuggestionListMorph listMorph color: NemoUXConstants defaultBackgroundColor.
	self chainSuggestionListMorph listMorph borderStyle: (CustomBorder colorsAndWidths: {
		Color gray: 0.7. 1.
		nil. 0.
		nil. 0.
		nil. 0}).
	self chainSuggestionListMorph dataSourceMorph color: NemoUXConstants defaultBackgroundColor.
	self chainSuggestionListMorph filterMorph textMorph color: Color transparent.
	self chainSuggestionListMorph dataSourceMorph borderStyle: (CustomBorder colorsAndWidths: {
		nil. 0.
		nil. 0.
		Color gray: 0.7. 1.
		nil. 0})
	
