comparing
= aBPMarkovChainTail
	^ aBPMarkovChainTail class == self class and: [
		aBPMarkovChainTail hash = self hash and: [
			aBPMarkovChainTail tailSource = self tailSource ] ]