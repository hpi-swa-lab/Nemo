initialization
initializeFilterMorph

	self filterMorph: (BPSuggestionFilterMorph new
		on: #textChanged do: [ :aString | self filterListFor: aString. ];
		on: #escapeKeyPressed do: [ self handleEscape. ];
		on: #enterKeyPressed do: [ self confirmSelection. ];
		on: #arrowKeyPressed do: [ :aCharacter | self navigateArrow: aCharacter ]).
	self addMorphBack: self filterMorph.