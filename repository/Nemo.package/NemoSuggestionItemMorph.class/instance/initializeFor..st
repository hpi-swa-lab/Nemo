initialization
initializeFor: anEntry

	self entry: anEntry.
	self color: Color transparent.
	self textMorph: (NemoTextMorph new 
		editable: false;
		contents: anEntry value displayValue). 
	self addMorph: self textMorph.
	self bounds: self submorphBounds.