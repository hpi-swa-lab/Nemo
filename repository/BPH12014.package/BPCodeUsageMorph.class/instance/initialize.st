as yet unclassified
initialize

	super initialize.
	self borderWidth: 0.
	self layoutPolicy: BPFillLayout new.
	self clipSubmorphs: true.
	self color: Color white.
	self initializeCodeMorph.