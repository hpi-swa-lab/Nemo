initialization
initializeChainSuggestionListMorph

	self chainSuggestionListMorph: (BPSuggestionListMorph new
			width: 200).
	self addMorphBack: self chainSuggestionListMorph.
	self chainSuggestionListMorph
		updateMaxItems: 10;
		onNavigateRIght: [ self expandUsages ];
		onEscape: [ self delete. ];
		onConfirmSelection: [ :selectedEntry | self delete. ].