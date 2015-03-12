initialization
initialize

	super initialize.
	self height: 210;
		color: Color white.
	self layoutPolicy: (BPHorizontalLayout new fillVertical: true).
	self initializeMethodSuggestionListMorph.
	self initializeUsageSuggestionListMorph.
	self initializeCodeUsageMorph.