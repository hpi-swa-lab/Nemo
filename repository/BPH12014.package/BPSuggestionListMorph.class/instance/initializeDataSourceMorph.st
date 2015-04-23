initialization
initializeDataSourceMorph
	
	self dataSourceMorph: NemoDataSourceMorph new.
	self addMorphFront: self dataSourceMorph.
.