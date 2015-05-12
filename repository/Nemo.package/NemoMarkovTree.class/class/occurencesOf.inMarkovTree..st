public
occurencesOf: aSelector inMarkovTree: aDictionary
	"Returns the times the given selector is present in the markov tree."
	
	^(aDictionary at: aSelector ifAbsent: [ Dictionary new. ]) at: #'$count' ifAbsent: [ 0 ]. 