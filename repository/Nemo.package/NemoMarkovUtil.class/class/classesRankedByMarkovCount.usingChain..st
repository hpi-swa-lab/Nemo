ranking
classesRankedByMarkovCount: aClassCollection usingChain: aMarkovChain
	| rankedMethods |
	rankedMethods := SortedCollection
		sortBlock: [ :assocA :assocB | assocA value > assocB value ].
	aClassCollection do: [ :clazz | | count |
		count := (aMarkovChain occurrencesOf: clazz name).
		rankedMethods add: clazz -> count ].
	^ rankedMethods