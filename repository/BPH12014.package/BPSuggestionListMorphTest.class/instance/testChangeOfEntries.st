testing
testChangeOfEntries

	self morph updateEntries: BPSuggestionEntry exampleMany.
	self assert: self morph listMorph submorphs size = 9.