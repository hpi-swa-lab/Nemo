markov
enrichMarkovChain: chain from: tokens for: aMethodReference

	1 to: tokens size do: [ :leftIndex |
		leftIndex to: tokens size do: [ :rightIndex |
			self putTokens: (tokens copyFrom: leftIndex to: rightIndex)
				intoChain: chain
				for: aMethodReference.
		].
	].