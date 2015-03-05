as yet unclassified
initializeCodeUsageMorph

	self codeUsageMorph: (BPCodeUsageMorph new
			width: 300;
			borderWidth: 1).
	self addMorphBack: self codeUsageMorph.