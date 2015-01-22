testing
testFilterString

	self morph filterMorph textMorphKeyStroke: (BPFakeEvent new keyString: 'a').
	self assert: 1 equals: self morph listMorph submorphs size.