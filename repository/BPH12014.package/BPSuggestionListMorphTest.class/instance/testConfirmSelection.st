testing
testConfirmSelection

	| selectedEntry |
	self morph updateSelectIndex: 2;
		onConfirmSelection: [ :aSuggestionEntry | selectedEntry := aSuggestionEntry. ];
		confirmSelection.
	self assert: (selectedEntry = nil) not description: 'an entry should have been selected '.
	self assert: (selectedEntry id) equals: (self morph entries at: 2) id.