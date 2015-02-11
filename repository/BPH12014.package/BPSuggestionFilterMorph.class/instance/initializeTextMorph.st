initialization
initializeTextMorph

	self textMorph: (BPTextMorph new).
	self addMorph: self textMorph.
	self height: self textMorph textHeight + (self layoutPolicy padding * 2).
	self textMorph textChangedHandler: [ :aString | self textChanged: aString.].
	self textMorph on: #keyStroke send: #textMorphKeyStroke: to: self.