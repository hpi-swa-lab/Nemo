ranking
methodsRankedByMarkovCount: aClass withRanker: ranker usingChain: aMarkovChain model: aModel
	| rankedMethods |
	rankedMethods := SortedCollection
		sortBlock: [ :assocA :assocB | assocA value > assocB value ].
	aClass methodDictWithSuper keysDo: [ :selector | | score modifiedSelector |
		modifiedSelector := selector.
		score := ranker
			scoreForSelector: selector
			onClass: aClass theNonMetaClass
			withUsageCount: (aMarkovChain occurrencesOf: selector).
		(self rankMethodsByMatchingParameterTypes and: [aModel class canUnderstand: #bindings]) ifTrue: [
			(NemoTypeFilteringUtil
				isMethod: (NemoClassUtil methodReferenceOnClassOrSuper: aClass for: selector)
				matchingTypes:
					(Dictionary new addAll: (aModel bindings associations collect: [:binding | binding key -> binding value class]); yourself)) 			ifNotNil: [:pair | modifiedSelector := modifiedSelector -> pair key. score := score + 4000] ].
		rankedMethods add: modifiedSelector -> score ].
	^ rankedMethods