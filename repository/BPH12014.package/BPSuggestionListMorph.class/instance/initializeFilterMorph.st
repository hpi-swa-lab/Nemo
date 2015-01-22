initialization
initializeFilterMorph

	self filterMorph: (BPSuggestionFilterMorph new onChange: [ :aString | self filterListFor: aString.]).
	self addMorphFront: self filterMorph.