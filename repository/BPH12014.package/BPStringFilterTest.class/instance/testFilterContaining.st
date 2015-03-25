testing
testFilterContaining

	self
		assert:	(self stringFilter filterByContaining: 'xyz' limit: 100) size equals: 3;
		assert:	(self stringFilter filterByContaining: 'yz' limit: 100) size equals: 3;
		assert:	(self stringFilter filterByContaining: 'xyz1' limit: 100) size equals: 1