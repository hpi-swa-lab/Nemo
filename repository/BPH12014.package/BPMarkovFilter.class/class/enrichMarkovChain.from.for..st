markov
enrichMarkovChain: chain from: tokens for: aMethodReference
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
				].
				hasTooManyRightParenthesis := difference < 0.
			]
		]
	]