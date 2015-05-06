selection
selectPrevious

	self updateSelectIndex: (NemoNumberUtil rotateReverse: self selectIndex between: 1 and: self numberDisplayedItems).