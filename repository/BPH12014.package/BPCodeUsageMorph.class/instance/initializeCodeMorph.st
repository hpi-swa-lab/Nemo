as yet unclassified
initializeCodeMorph

	self codeMorph: (BPTextMorph new layoutPolicy: BPFillLayout new).
	self addMorphBack: self codeMorph.