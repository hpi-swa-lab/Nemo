initialization
expandUsages

	self addMorphBack: (
		self codeUsageMorph
			top: self top
	).
	self updateUsages.