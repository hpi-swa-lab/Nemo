public
sortedCountsOf: aSelector inMarkovTree: aDictionary
	"Returns the times the given selector is present in the markov tree."
	
	| treeNode |
	treeNode := (aDictionary at: aSelector ifAbsent: [ Dictionary new. ]).
	
	^(Array new: aDictionary size streamContents: [ :stream |
		treeNode associationsDo: [ :each |
			((each key = #'$selector') or: [ each key = #'$count' ])
				ifFalse: [ stream nextPut: (each value at: #'$count') -> each key ]] ])
		sort: [:x :y | x >= y ];
		yourself