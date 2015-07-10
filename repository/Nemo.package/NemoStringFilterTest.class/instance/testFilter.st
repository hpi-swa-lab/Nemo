testing
testFilter

	self assert:	(self stringFilter filterBy: 'abc') size equals: 3.
	self assert:	(self stringFilter filterBy: 'xy') size equals: 4.