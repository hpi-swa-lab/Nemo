as yet unclassified
initialize

	super initialize.
	self layoutPolicy: (BPFillLayout new padding: 2).
	self initializeTextMorph.
	self color: Color white.
	self borderColor: Color gray.
	self borderWidth: 1.
	self filterString: ''.