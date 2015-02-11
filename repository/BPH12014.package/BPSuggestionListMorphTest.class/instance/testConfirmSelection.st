testing
testConfirmSelection

	| selectedEntry |
	self morph updateSelectIndex: 2;
		onSelect: [ :aSuggestionEntry | selectedEntry := aSuggestionEntry. ];
		confirmSelection.
	self assert: (selectedEntry = nil) not description: 'an entry should have been selected '.
	self assert: (selectedEntry id) equals: (self morph entries at: 2) id.
	self assert: (self morph owner) equals: nil description: 'after confirming the selection the morph should be deleted'.