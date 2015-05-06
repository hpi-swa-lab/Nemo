ranking
classesRankedByMarkovCount: aClassCollection usingChain: aMarkovChain
	| rankedMethods |
	rankedMethods := SortedCollection
		sortBlock: [ :assocA :assocB | assocA value > assocB value ].
	aClassCollection do: [ :clazz | | count |
		count := (aMarkovChain at: clazz name ifAbsent: [#()]) size.
		rankedMethods add: clazz -> count ].
	^ rankedMethods