testing
testLimitNumberOfEntries

	self morph updateEntries: BPSuggestionEntry exampleMany.
	self morph updateMaxItems: 5.
	self assert: self morph listMorph submorphs size = 5.