initialization
initializeChainSuggestionListMorph

	self chainSuggestionListMorph: (BPSuggestionListMorph new
			width: 300).
	self addMorphBack: self chainSuggestionListMorph.
	self chainSuggestionListMorph
		updateMaxItems: 10;
		on: #navigateRight do: [ self expandUsages ];
		on: #escapeKeyPressed do: [ self delete.
			self emit: #suggestionCanceled.
			false ];
		on: #confirmSelection do: [ :selectedEntry | self delete. ];
		color: Color transparent;
		borderWidth: 0;
		borderColor: self defaultBorderColor.
	self chainSuggestionListMorph listMorph color: self defaultBackgroundColor.
	self chainSuggestionListMorph informationLabelMorph backgroundColor: self defaultBackgroundColor.
	self chainSuggestionListMorph filterMorph textMorph color: Color transparent.