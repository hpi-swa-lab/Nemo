testing
testLimitNumberOfEntriesWithFilter

	self morph updateMaxItems: 2.
	self morph updateEntries: {	
		BPSuggestionEntry new id: 1; data: 'abcde'; displayValue: 'abcde'.
		BPSuggestionEntry new id: 2; data: 'bcdef'; displayValue: 'bcdef'.
		BPSuggestionEntry new id: 3; data: 'cdefg'; displayValue: 'cdefg'.
		BPSuggestionEntry new id: 4; data: 'defgh'; displayValue: 'defgh'.
	}.
	self assert: self morph listMorph submorphs size = 2.
	self morph filterListFor: 'def'.
	self assert: self morph listMorph submorphs size = 2.
	self assert: 3 equals: self morph listMorph submorphs second entry id.