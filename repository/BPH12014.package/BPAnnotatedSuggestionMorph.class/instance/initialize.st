as yet unclassified
initialize

	super initialize.
	self height: 210.
	self layoutPolicy: (BPHorizontalLayout new fillVertical: true).
	self initializeSuggestionListMorph.
	self initializeCodeUsageMorph.