initialization
initializeListMorph

	self listMorph: (Morph new color: Color transparent).
	self listMorph layoutPolicy: BPListLayout new.
	self addMorphBack: self listMorph.