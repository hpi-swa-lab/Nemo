as yet unclassified
initializeSuggestionListMorph

	self suggestionListMorph: (BPSuggestionListMorph new
			width: 200).
	self addMorphBack: self suggestionListMorph.
	self suggestionListMorph
		updateMaxItems: 10;
		onSelect: [ :selectedEntry | self forMethodReference: selectedEntry data from: 0 to: 10. ];
		onEscape: [ self delete. ];
		onConfirmSelection: [ :selectedEntry | self delete. ].