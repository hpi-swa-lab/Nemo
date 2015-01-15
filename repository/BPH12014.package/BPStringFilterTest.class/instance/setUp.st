running
setUp

	self stringFilter: (BPStringFilter new entries: {
		Dictionary new at: #id put: 1; at: #value put: 'abc'; yourself.
		Dictionary new at: #id put: 2; at: #value put: 'a01wsbsdgfc'; yourself.
		Dictionary new at: #id put: 3; at: #value put: 'sdfgabcsgdgh'; yourself.
		Dictionary new at: #id put: 4; at: #value put: 'ab5'; yourself.
		Dictionary new at: #id put: 5; at: #value put: 'acdf'; yourself.
	}).