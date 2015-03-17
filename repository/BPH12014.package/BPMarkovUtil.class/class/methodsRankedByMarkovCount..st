ranking
methodsRankedByMarkovCount: aClass
	| rankedMethods |
	rankedMethods := SortedCollection
		sortBlock: [ :assocA :assocB | assocA value > assocB value ].
	aClass methodDict keysDo: [ :selector | | count |
		"TODO: have a look at Bag>>size. could be inperformant."
		count := (BPBookshelf markovASTChainBook markovChain at: selector ifAbsent: [#()]) size.
		rankedMethods add: selector -> count ].
	^ rankedMethods