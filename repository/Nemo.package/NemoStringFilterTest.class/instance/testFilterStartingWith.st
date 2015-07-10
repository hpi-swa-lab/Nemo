testing
testFilterStartingWith

	self
		assert:	(self stringFilter filterByStartingWith: 'xyz' limit: 100) size equals: 3;
		assert:	(self stringFilter filterByStartingWith: 'yz' limit: 100) size equals: 0;
		assert:	(self stringFilter filterByStartingWith: 'xyz1' limit: 100) size equals: 1