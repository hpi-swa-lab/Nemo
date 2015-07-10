testing
testChangeOfEntries

	self morph updateEntries: NemoSuggestionEntry exampleMany.
	self assert: self morph listMorph submorphs size = 9.