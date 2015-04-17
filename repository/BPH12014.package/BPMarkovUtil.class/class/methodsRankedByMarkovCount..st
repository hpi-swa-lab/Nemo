ranking
methodsRankedByMarkovCount: aClass
	| rankedMethods |
	rankedMethods := SortedCollection
		sortBlock: [ :assocA :assocB | assocA value > assocB value ].
	aClass methodDictWithSuper keysDo: [ :selector | | count bag key |
		count := aClass isMeta
			ifTrue: [
				key := BPMarkovFromASTChain new selector: selector; yourself.
				bag := BPBookshelf markovASTChainBook markovChain at: aClass theNonMetaClass name asString ifAbsent: [Bag new].
				bag valuesAndCounts at: key ifAbsent: [0] ]
			ifFalse: [
				(BPBookshelf markovASTChainBook markovChain at: selector ifAbsent: [#()]) size ].
		rankedMethods add: selector -> count ].
	^ rankedMethods