initialization
initializeFor: anEntry

	self entry: anEntry.
	self color: Color transparent.
	self textMorph: (BPTextMorph new 
		editable: false;
		contents: anEntry value asText).
	self addMorph: self textMorph.
	self bounds: self submorphBounds.