as yet unclassified
testMarkovChainTail
	| sortedCounts |
	self
		assert: markovChainTail1 = markovChainTail2;
		deny: markovChainTail1 == markovChainTail2;
		assert: markovChainTail1 hash equals: markovChainTail2 hash.
	
	sortedCounts :=  (Bag new add: markovChainTail1; add: markovChainTail2; yourself) 
						sortedCounts.
	self
		assert: 1 equals: sortedCounts size;
		assert: 2 equals: sortedCounts first key.