initialization
initialize
	self cleanUpBPMorphicEventHandler.
	super initialize.
	self height: 210;
		color: Color white.
	self layoutPolicy: (BPHorizontalLayout new fillVertical: true).
	self initializeChainSuggestionListMorph.
	self initializeCodeUsageMorph.