as yet unclassified
initializeFor: anEntry

	self entry: anEntry.
	self color: Color transparent.
	self textMorph: (TextMorph new contents: anEntry value asText). 
	self addMorph: self textMorph.
	self bounds: self submorphBounds.