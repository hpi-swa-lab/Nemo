running
setUp

	self stringFilter: (NemoStringFilter new entries: {
		NemoSuggestionEntry new id: 1; data: 'abc'; displayValue: 'abc'.
		NemoSuggestionEntry new id: 2; data: 'a01wsbsdgfc'; displayValue: 'a01wsbsdgfc'.
		NemoSuggestionEntry new id: 3; data: 'sdfgabcsgdgh'; displayValue: 'sdfgabcsgdgh'.
		NemoSuggestionEntry new id: 4; data: 'ab5'; displayValue: 'ab5'.
		NemoSuggestionEntry new id: 5; data: 'acdf'; displayValue: 'acdf'.
		NemoSuggestionEntry new id: 6; data: 'xayaza3'; displayValue: 'xayaza3'.
		NemoSuggestionEntry new id: 7; data: 'xyz1'; displayValue: 'xyz1'.
		NemoSuggestionEntry new id: 8; data: 'xyz2'; displayValue: 'xyz2'.
		NemoSuggestionEntry new id: 9; data: 'xyz3'; displayValue: 'xyz3'.
	}).