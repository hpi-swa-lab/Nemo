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
		NemoTypeFilteringUtil isMethod: (MethodReference class: aClass selector: selector) matchingTypes: nil.
		rankedMethods add: selector -> score ].
	^ rankedMethods