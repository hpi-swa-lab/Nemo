ranking
classesRankedByMarkovCount: aClassCollection
	| rankedMethods |
	rankedMethods := SortedCollection
		sortBlock: [ :assocA :assocB | assocA value > assocB value ].
	aClassCollection do: [ :clazz | | count |
		count := (BPBookshelf markovASTChainBook markovChain at: clazz name ifAbsent: [#()]) size.
		rankedMethods add: clazz -> count ].
	^ rankedMethods