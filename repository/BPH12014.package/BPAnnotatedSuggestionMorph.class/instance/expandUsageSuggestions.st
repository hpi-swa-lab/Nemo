initialization
expandUsageSuggestions

	self addMorphBack: (
		self usageSuggestionListMorph
			top: self top;
			updateEntries: self provideUsageEntries
	).