testing
testSelectingPrevious

	self assert: 1 equals: self morph selectIndex.
	self morph selectPrevious.
	self assert: 3 equals: self morph selectIndex.