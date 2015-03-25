testing
testEmptyFilter

	self assert:	((self stringFilter filterBy: '') size = self stringFilter entries size)