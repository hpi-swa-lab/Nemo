testing
testEmptyFilter

	self assert:	((self stringFilter filterBy: '') size = 5)