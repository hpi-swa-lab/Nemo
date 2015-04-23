private-accessing
initialize

		super initialize.
		self textMorph: (BPTextMorph new editable: false; contents: '').
		self addMorphFront: self textMorph.