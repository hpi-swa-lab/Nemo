initialization
initialize

	super initialize.
	self layoutPolicy: BPListLayout new.
	self initializeFilterMorph.
	self initializeListMorph.
	self initializeVariables.