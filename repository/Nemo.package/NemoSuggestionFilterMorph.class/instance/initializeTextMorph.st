initialization
initializeTextMorph

	self textMorph: (NemoTextMorph new).
	self addMorph: self textMorph.
	self height: self textMorph textHeight + (self layoutPolicy padding * 2).
	self textMorph on: #keyStroke send: #textMorphKeyStroke: to: self.
	self textMorph setProperty: #indicateKeyboardFocus toValue: #never