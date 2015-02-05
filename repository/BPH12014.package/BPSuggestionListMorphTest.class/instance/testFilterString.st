testing
testFilterString

	self morph filterMorph textChanged: 'a'.
	self assert: 1 equals: self morph listMorph submorphs size.