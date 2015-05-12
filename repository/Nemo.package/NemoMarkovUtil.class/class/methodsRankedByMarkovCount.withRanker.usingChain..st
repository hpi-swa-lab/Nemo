ranking
methodsRankedByMarkovCount: aClass withRanker: ranker usingChain: aMarkovChain
	| rankedMethods |
	rankedMethods := SortedCollection
		sortBlock: [ :assocA :assocB | assocA value > assocB value ].
	aClass methodDictWithSuper keysDo: [ :selector | | score |
		score := ranker
			scoreForSelector: selector
			onClass: aClass theNonMetaClass
			withUsageCount: (aMarkovChain occurrencesOf: selector).
		rankedMethods add: selector -> score ].
	^ rankedMethods