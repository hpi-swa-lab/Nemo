testing
testFilterWithLimit

	self
		assert:	((self stringFilter filterBy: 'abc' limit: 1) size = 1);
		assert:	((self stringFilter filterBy: 'abc' limit: 2) size = 2);
		assert:	((self stringFilter filterBy: 'abc' limit: 3) size = 3);
		assert:	((self stringFilter filterBy: 'abc' limit: 4) size = 3)