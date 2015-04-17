initialization
initialize

	super initialize.
	self height: 210;
		color: Color transparent.
	self layoutPolicy: (BPHorizontalLayout new fillVertical: true).
	self initializeChainSuggestionListMorph.
	self initializeCodeUsageMorph.