initialization
initialize

	super initialize.
	self height: 245;
		color: Color transparent.
	self layoutPolicy: (NemoHorizontalLayout new fillVertical: true).
	self initializeChainSuggestionListMorph.
	self initializeCodeUsageMorph.