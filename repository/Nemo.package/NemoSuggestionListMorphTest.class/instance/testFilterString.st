testing
testFilterString

	self morph filterMorph emit: #textChanged with: 'a'.
	self assert: 1 equals: self morph listMorph submorphs size.