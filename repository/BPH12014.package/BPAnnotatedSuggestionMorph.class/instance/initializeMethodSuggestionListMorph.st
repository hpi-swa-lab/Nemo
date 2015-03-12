initialization
initializeMethodSuggestionListMorph

	self methodSuggestionListMorph: (BPSuggestionListMorph new
			width: 200).
	self addMorphBack: self methodSuggestionListMorph.
	self methodSuggestionListMorph
		updateMaxItems: 10;
		onSelect: [ :selectedEntry | self forMethodReference: selectedEntry data from: 0 to: 10. ];
		onNavigateRight: [ self expandUsageSuggestions. ];
		onEscape: [ self delete. ];
		onConfirmSelection: [ :selectedEntry | self delete. ].