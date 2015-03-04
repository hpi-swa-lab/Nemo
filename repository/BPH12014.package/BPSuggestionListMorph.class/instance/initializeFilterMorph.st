initialization
initializeFilterMorph

	self filterMorph: (BPSuggestionFilterMorph new
		onChange: [ :aString | self filterListFor: aString. ];
		onEscape: [ self handleEscape. ];
		onEnter: [ self confirmSelection. ];
		onArrow: [ :aCharacter | self navigateArrow: aCharacter ]).
	self addMorphFront: self filterMorph.