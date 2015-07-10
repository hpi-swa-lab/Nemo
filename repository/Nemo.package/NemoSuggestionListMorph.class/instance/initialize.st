initialization
initialize

	super initialize.
	self borderColor: Color gray.
	self borderWidth: 0.
	self layoutPolicy: (NemoListLayout new
			padding: 0;
			adaptHeightToSubmorphs: false;
			fillLast: true).
	self initializeDataSourceMorph.
	self initializeFilterMorph.
	self initializeListMorph.
	self initializeVariables.
	self clipSubmorphs: true