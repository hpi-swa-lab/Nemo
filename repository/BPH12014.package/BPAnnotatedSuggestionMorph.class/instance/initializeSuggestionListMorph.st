as yet unclassified
initializeSuggestionListMorph

	self suggestionListMorph: BPSuggestionListMorph new.
	self addMorphBack: self suggestionListMorph.
	self suggestionListMorph
		updateMaxItems: 10;
		onSelect: [ :selectedEntry | self forMethodReference: selectedEntry value. ];
		onEscape: [ self delete. ];
		onConfirmSelection: [ :selectedEntry | self delete. ].