running
setUp

	self stringFilter: (BPStringFilter new entries: {
		BPSuggestionEntry new id: 1; data: 'abc'; displayValue: 'abc'.
		BPSuggestionEntry new id: 2; data: 'a01wsbsdgfc'; displayValue: 'a01wsbsdgfc'.
		BPSuggestionEntry new id: 3; data: 'sdfgabcsgdgh'; displayValue: 'sdfgabcsgdgh'.
		BPSuggestionEntry new id: 4; data: 'ab5'; displayValue: 'ab5'.
		BPSuggestionEntry new id: 5; data: 'acdf'; displayValue: 'acdf'.
	}).