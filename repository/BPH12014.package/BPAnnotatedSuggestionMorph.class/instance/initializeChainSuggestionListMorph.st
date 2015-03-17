initialization
initializeChainSuggestionListMorph

	self chainSuggestionListMorph: (BPSuggestionListMorph new
			width: 200).
	self addMorphBack: self chainSuggestionListMorph.
	self chainSuggestionListMorph
		updateMaxItems: 10;
		on: #navigateRight do: [ self expandUsages ];
		on: #escapeKeyPressed do: [ self delete. false ];
		on: #confirmSelection do: [ :selectedEntry | self delete. ].