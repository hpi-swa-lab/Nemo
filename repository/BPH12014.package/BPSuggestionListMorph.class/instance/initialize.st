initialization
initialize

	super initialize.
	self borderColor: Color gray.
	self borderWidth: 0.
	self layoutPolicy: (BPListLayout new padding: 2).
	self initializeInformationLabelMorph.
	self initializeFilterMorph.
	self initializeListMorph.
	self initializeVariables.
	self clipSubmorphs: true