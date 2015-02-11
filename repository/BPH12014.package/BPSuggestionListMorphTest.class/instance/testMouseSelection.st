testing
testMouseSelection

	self morph listMorph submorphs second mouseEnter: nil.
	self assert: self morph listMorph submorphs second entry equals: self morph selectedEntry.