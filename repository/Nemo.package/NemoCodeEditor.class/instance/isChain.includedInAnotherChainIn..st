filtering
isChain: aBPMarkovChain includedInAnotherChainIn: chains
	chains do: [ :anotherBPMarkovChain |
		aBPMarkovChain = anotherBPMarkovChain ifFalse: [
			aBPMarkovChain method = anotherBPMarkovChain method ifTrue: [
				aBPMarkovChain tailTokens size < anotherBPMarkovChain tailTokens size ifTrue: [
					(anotherBPMarkovChain tailTokens beginsWith: aBPMarkovChain tailTokens) ifTrue: [
						^ true ] ] ] ] ].
	^ false