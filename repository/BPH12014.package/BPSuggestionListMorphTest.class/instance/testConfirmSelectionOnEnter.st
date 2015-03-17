testing
testConfirmSelectionOnEnter

	| selectedEntry |
	self morph updateSelectIndex: 2;
		on: #confirmSelection do: [ :aSuggestionEntry | selectedEntry := aSuggestionEntry. ].
	self morph filterMorph emit: #enterKeyPressed.

	self assert: (selectedEntry = nil) not description: 'an entry should have been selected '.
	self assert: (selectedEntry id) equals: (self morph entries at: 2) id.