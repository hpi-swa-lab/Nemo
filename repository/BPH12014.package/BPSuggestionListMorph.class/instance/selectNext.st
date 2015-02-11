selection
selectNext

	self updateSelectIndex: (BPNumberUtil rotate: self selectIndex between: 1 and: self entries size).