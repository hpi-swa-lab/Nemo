as yet unclassified
initialize

	super initialize.
	self layoutPolicy: BPFillLayout new.
	self initializeTextMorph.
	self color: Color white.
	self borderColor: Color gray.
	self borderWidth: 1.