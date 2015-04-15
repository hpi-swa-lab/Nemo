initialization
initialize

	super initialize.
	self borderColor: Color gray.
	self borderWidth: 1.
	self layoutPolicy: (BPListLayout new padding: 5).
	self initializeInformationLabelMorph.
	self initializeFilterMorph.
	self initializeListMorph.
	self initializeVariables.
	self clipSubmorphs: true