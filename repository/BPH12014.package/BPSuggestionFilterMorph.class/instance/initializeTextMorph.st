as yet unclassified
initializeTextMorph

	self textMorph: (TextMorph new).
	self height: self textMorph textHeight.
	self textMorph contents: ''.
	self addMorph: self textMorph.
	self textMorph on: #keyStroke send: #textMorphKeyStroke to: self.