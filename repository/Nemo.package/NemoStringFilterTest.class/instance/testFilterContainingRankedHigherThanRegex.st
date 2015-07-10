testing
testFilterContainingRankedHigherThanRegex

	self
		assert:	(self stringFilter filterBy: 'xyz' limit: 1) first displayValue equals: 'xyz1';
		assert:	(self stringFilter filterBy: 'xyz') size equals: 4