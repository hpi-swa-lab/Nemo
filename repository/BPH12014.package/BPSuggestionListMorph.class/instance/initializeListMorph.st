initialization
initializeListMorph

	self listMorph: (Morph new color: Color transparent).
	self listMorph layoutPolicy: (BPListLayout new padding: 2).
	self listMorph clipSubmorphs: true.
	self addMorphBack: self listMorph.