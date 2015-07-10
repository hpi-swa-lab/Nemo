private-accessing
initialize

		super initialize.
		self textMorph: (NemoTextMorph new editable: false; contents: '').
		self addMorphFront: self textMorph.
		self layoutPolicy: (NemoFillLayout new padding: self padding).
		self updateHeight.