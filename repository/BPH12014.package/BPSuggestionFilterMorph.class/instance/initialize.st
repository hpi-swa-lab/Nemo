initialization
initialize

	super initialize.
	self layoutPolicy: (BPFillLayout new padding: 1).
	self initializeTextMorph.
	self color: Color transparent.
	self borderColor: self defaultBorderColor.
	self borderWidth: 0.
	self filterString: ''.