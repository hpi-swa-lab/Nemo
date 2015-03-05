as yet unclassified
initializeCodeMorph

	"self codeMorph: (PluggableTextMorphPlus new layoutPolicy: BPFillLayout new)."
	self codeMorph: (BPTextMorph new layoutPolicy: BPFillLayout new).
	self addMorphBack: self codeMorph.