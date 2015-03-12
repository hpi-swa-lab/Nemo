initialization
initializeUsageSuggestionListMorph

	self usageSuggestionListMorph: (BPSuggestionListMorph new
			width: 200).
	self usageSuggestionListMorph
		updateMaxItems: 10;
		onSelect: [ :selectedEntry | self forMethodReference: selectedEntry data from: 0 to: 10. ];
		onEscape: [ self delete. ];
		onConfirmSelection: [ :selectedEntry | self delete. ].