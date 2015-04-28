initialization
initialize

	super initialize.
	self height: 350;
		color: Color transparent.
	self layoutPolicy: (BPHorizontalLayout new fillVertical: true).
	self initializeChainSuggestionListMorph.
	self initializeCodeUsageMorph.