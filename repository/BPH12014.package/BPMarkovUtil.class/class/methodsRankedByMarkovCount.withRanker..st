ranking
methodsRankedByMarkovCount: aClass withRanker: ranker
	| rankedMethods |
	rankedMethods := SortedCollection
		sortBlock: [ :assocA :assocB | assocA value > assocB value ].
	aClass methodDictWithSuper keysDo: [ :selector | | score bag key |
		score := aClass isMeta
			ifTrue: [
				key := BPMarkovFromASTChain new selector: selector; yourself.
				bag := BPBookshelf markovASTChainBook markovChain at: aClass theNonMetaClass name asString ifAbsent: [Bag new].
				bag valuesAndCounts at: key ifAbsent: [0] ]
			ifFalse: [
				ranker scoreForSelector: selector onClass: aClass withUsageCount: (BPBookshelf markovASTChainBook markovChain at: selector ifAbsent: [#()]) size. ].
		rankedMethods add: selector -> score ].
	^ rankedMethods