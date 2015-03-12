as yet unclassified
provideUsageEntriesFor: aMethodReference

	^ {
		BPSuggestionEntry new
			id: 1;
			data: aMethodReference;
			displayValue: 'test1'
	} asOrderedCollection