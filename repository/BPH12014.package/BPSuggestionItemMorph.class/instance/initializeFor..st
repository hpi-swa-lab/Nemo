as yet unclassified
initializeFor: anEntry

	self entry: anEntry.
	self color: Color transparent.
	self addMorph: (TextMorph new contents: anEntry value asText).
	self bounds: self submorphBounds.