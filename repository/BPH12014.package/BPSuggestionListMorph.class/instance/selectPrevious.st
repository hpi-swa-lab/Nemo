selection
selectPrevious

	self updateSelectIndex: (BPNumberUtil rotateReverse: self selectIndex between: 1 and: self entries size).