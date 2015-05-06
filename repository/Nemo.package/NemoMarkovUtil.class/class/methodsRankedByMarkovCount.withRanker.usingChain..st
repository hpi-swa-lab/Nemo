ranking
methodsRankedByMarkovCount: aClass withRanker: ranker usingChain: aMarkovChain
	| rankedMethods |
	rankedMethods := SortedCollection
		sortBlock: [ :assocA :assocB | assocA value > assocB value ].
	aClass methodDictWithSuper keysDo: [ :selector | | score bag key |
		score := aClass isMeta
			ifTrue: [
				key := NemoMarkovFromASTChain new selector: selector; yourself.
				bag := aMarkovChain at: aClass theNonMetaClass name asString ifAbsent: [Bag new].
				bag valuesAndCounts at: key ifAbsent: [0] ]
			ifFalse: [
				ranker scoreForSelector: selector onClass: aClass withUsageCount: (aMarkovChain at: selector ifAbsent: [#()]) size. ].
		rankedMethods add: selector -> score ].
	^ rankedMethods