testing
testConfirmSelectionOnEnter

	| selectedEntry |
	self morph updateSelectIndex: 2;
		onConfirmSelection: [ :aSuggestionEntry | selectedEntry := aSuggestionEntry. ].
	self morph filterMorph onEnter value.

	self assert: (selectedEntry = nil) not description: 'an entry should have been selected '.
	self assert: (selectedEntry id) equals: (self morph entries at: 2) id.