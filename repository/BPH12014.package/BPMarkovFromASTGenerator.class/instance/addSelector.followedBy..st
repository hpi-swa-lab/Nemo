as yet unclassified
addSelector: aSelector followedBy: anotherSelector
	| chain |
	chain := BPMarkovFromASTChain new
		selector: anotherSelector;
		methodReference: self methodReference;
		yourself.
	(self chains at: aSelector ifAbsentPut: Bag new)
		add: chain