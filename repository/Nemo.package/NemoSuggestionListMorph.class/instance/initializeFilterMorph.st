initialization
initializeFilterMorph

	self filterMorph: (NemoSuggestionFilterMorph new
		on: #textChanged do: [ :aString | self filterListFor: aString. ];
		on: #escapeKeyPressed do: [ self handleEscape. ];
		on: #enterKeyPressed do: [ self confirmSelection. ];
		on: #arrowKeyPressed do: [ :aCharacter | self navigateArrow: aCharacter ]);
		color: Color transparent.
	self addMorphBack: self filterMorph.