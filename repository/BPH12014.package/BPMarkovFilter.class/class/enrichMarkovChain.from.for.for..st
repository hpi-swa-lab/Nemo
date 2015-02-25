markov
enrichMarkovChain: chain from: tokens for: aMethodReference for: sourceCode
	| hasTooManyRightParenthesis |
	1 to: tokens size do: [ :leftIndex |
		hasTooManyRightParenthesis := false.
		leftIndex to: tokens size do: [ :rightIndex | | subTokens difference |
			hasTooManyRightParenthesis ifFalse: [
				subTokens := (tokens copyFrom: leftIndex to: rightIndex).
				difference := (self leftRightParenthesisDifference: subTokens).
				difference isZero ifTrue: [
					self putTokens: subTokens
						intoChain: chain
						for: aMethodReference
						for: sourceCode].
				hasTooManyRightParenthesis := difference < 0.]]]