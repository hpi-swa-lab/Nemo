as yet unclassified
addSelector: aSelector followedBy: anotherSelector
	| chain |
	chain := NemoMarkovFromASTChain new
		selector: anotherSelector;
		methodReference: self methodReference;
		yourself.
	(self chains at: aSelector ifAbsentPut: Bag new)
		add: chain