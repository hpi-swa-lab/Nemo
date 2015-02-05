as yet unclassified
initializeTextMorph

	self textMorph: (BPTextMorph new).
	self addMorph: self textMorph.
	self height: self textMorph textHeight.
	self textMorph textChangedHandler: [ :aString | self textChanged: aString.].