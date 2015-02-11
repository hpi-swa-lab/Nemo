testing
testSelectingNext

	self assert: 1 equals: self morph selectIndex.
	self morph selectNext.
	self assert: 2 equals: self morph selectIndex.
	self assert: (self morph listMorph submorphs at: 2) color equals: Color gray darker.