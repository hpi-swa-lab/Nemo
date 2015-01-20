testing
testFilter

	self assert:	((self stringFilter filterBy: 'abc') size = 3)