testing
testLimitNumberOfEntries

	self morph updateEntries: NemoSuggestionEntry exampleMany.
	self morph updateMaxItems: 5.
	self assert: self morph listMorph submorphs size = 5.