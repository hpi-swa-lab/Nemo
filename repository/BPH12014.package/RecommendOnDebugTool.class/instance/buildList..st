as yet unclassified
buildList: aBuilder
	| listSpec |
	listSpec := aBuilder pluggableListSpec new.
	listSpec 
		model: self;
		list: #methods; 
		getIndex: #currentIndex; 
		setIndex: #currentIndex:; 
		menu: #classListMenu:shifted:;
		keyPress: #classListKey:from:.
	^ listSpec