initialization
provideUsageEntries

	self usageProvider ifNotNilDo: [ :aBlock | ^ aBlock value: self methodSuggestionListMorph selectedEntry ].