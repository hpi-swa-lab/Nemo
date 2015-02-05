initialization
initialize

	super initialize.
	self layoutPolicy: (BPListLayout new padding: 5).
	self initializeFilterMorph.
	self initializeListMorph.
	self initializeVariables.