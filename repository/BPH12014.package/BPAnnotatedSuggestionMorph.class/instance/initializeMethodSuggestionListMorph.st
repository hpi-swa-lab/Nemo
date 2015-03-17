initialization
initializeMethodSuggestionListMorph

	self methodSuggestionListMorph: (BPSuggestionListMorph new
			width: 200).
	self addMorphBack: self methodSuggestionListMorph.
	self methodSuggestionListMorph
		updateMaxItems: 10;
		on: #select do: [ :selectedEntry | self forMethodReference: selectedEntry data from: 0 to: 10. ];
		on: #navigateRight do: [ self expandUsageSuggestions. ];
		on: #escapeKeyPressed do: [ self delete. ];
		on: #confirmSelection do: [ :selectedEntry | self delete. ].