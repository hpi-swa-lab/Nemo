filtering
filterIncludedMarkovChains: aBPMarkovChainList
	| singleOccurenceChains chainsToRemove |
	singleOccurenceChains := aBPMarkovChainList select: [ :aBPMarkovChain | aBPMarkovChain count = 1 ].
	chainsToRemove := Set new.
Transcript cr; show: '-'; show: (MessageTally time: [
	singleOccurenceChains do: [ :aBPMarkovChain | 
		(self isChain: aBPMarkovChain includedInAnotherChainIn: singleOccurenceChains)
			ifTrue: [ chainsToRemove add: aBPMarkovChain ] ] "displayingProgress: 'Filter inclusions'".]).
	^ aBPMarkovChainList copyWithoutAll: chainsToRemove