as yet unclassified
initializeCodeMorph

	"self codeMorph: (PluggableTextMorphPlus new layoutPolicy: BPFillLayout new)."
	self codeMorph: (BPTextMorph new layoutPolicy: BPFillLayout new).
	self codeMorph editable: false.
	self addMorphBack: self codeMorph.