running
setUp

	self stringFilter: (BPStringFilter new entries: {
		BPSuggestionEntry new id: 1; value: 'abc'.
		BPSuggestionEntry new id: 2; value: 'a01wsbsdgfc'.
		BPSuggestionEntry new id: 3; value: 'sdfgabcsgdgh'.
		BPSuggestionEntry new id: 4; value: 'ab5'.
		BPSuggestionEntry new id: 5; value: 'acdf'.
	}).