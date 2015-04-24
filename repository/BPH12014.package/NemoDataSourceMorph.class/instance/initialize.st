private-accessing
initialize

		super initialize.
		self textMorph: (BPTextMorph new editable: false; contents: '').
		self addMorphFront: self textMorph.
		self layoutPolicy: (BPFillLayout new padding: self padding).
		self updateHeight.