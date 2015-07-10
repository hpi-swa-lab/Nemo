initialization
initialize

	super initialize.
	self layoutPolicy: (NemoFillLayout new padding: 4).
	self initializeTextMorph.
	self color: Color transparent.
	self borderColor: self defaultBorderColor.
	self borderWidth: 0.
	self filterString: ''.