testing
testLimitNumberOfEntriesWithFilter

	self morph updateMaxItems: 2.
	self morph updateEntries: {	
		BPSuggestionEntry new id: 1; value: 'abcde'.
		BPSuggestionEntry new id: 2; value: 'bcdef'.
		BPSuggestionEntry new id: 3; value: 'cdefg'.
		BPSuggestionEntry new id: 4; value: 'defgh'.
	}.
	self assert: self morph listMorph submorphs size = 2.
	self morph filterListFor: 'def'.
	self assert: self morph listMorph submorphs size = 2.
	self assert: 3 equals: self morph listMorph submorphs second entry id.