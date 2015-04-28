as yet unclassified
initializeCodeMorph

		self codeMorph: ((ToolBuilder default buildPluggableText: (
				ToolBuilder default pluggableCodePaneSpec new))).
		self addMorph: self codeMorph.