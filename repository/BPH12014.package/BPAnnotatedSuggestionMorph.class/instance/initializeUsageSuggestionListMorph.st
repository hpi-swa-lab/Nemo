initialization
initializeUsageSuggestionListMorph

	self usageSuggestionListMorph: (BPSuggestionListMorph new
			width: 200).
	self usageSuggestionListMorph
		updateMaxItems: 10;
		on: #select do: [ :selectedEntry | self forMethodReference: selectedEntry data from: 0 to: 10. ];
		on: #escapeKeyPressed do: [ self delete. ];
		on: #confirmSelection do: [ :selectedEntry | self delete. ];
		on: #selected do: [ :selectedEntry | self forMethodReference: selectedEntry data from: 0 to: 10. ].