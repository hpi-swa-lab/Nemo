initialization
initializeListMorph

	self listMorph: (Morph new color: Color transparent).
	self listMorph layoutPolicy: (NemoListLayout new padding: 5; fillLast: false).
	self listMorph clipSubmorphs: true.
	self addMorphBack: self listMorph.