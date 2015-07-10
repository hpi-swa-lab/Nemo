testing
testLimitNumberOfEntriesWithFilter

	self morph updateMaxItems: 2.
	self morph updateEntries: {	
		NemoSuggestionEntry new id: 1; data: 'abcde'; displayValue: 'abcde'.
		NemoSuggestionEntry new id: 2; data: 'bcdef'; displayValue: 'bcdef'.
		NemoSuggestionEntry new id: 3; data: 'cdefg'; displayValue: 'cdefg'.
		NemoSuggestionEntry new id: 4; data: 'defgh'; displayValue: 'defgh'.
	}.
	self assert: self morph listMorph submorphs size = 2.
	self morph filterListFor: 'def'.
	self assert: self morph listMorph submorphs size = 2.
	self assert: 4 equals: self morph listMorph submorphs first entry id.
	self assert: 2 equals: self morph listMorph submorphs second entry id.