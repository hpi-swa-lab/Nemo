markov
putTokens: tokens intoChain: chain for: aMethodReference for: sourceString

	| newChain currentToken currentTokenSource |
	tokens size <= 1 ifTrue: [^self].
	newChain := BPMarkovChain new
		tailSource: (tokens collect: [ :x | sourceString copyFrom: x start to: x end ]);
		method: aMethodReference;
		tailTokens: tokens.
	currentToken := tokens first.
	currentTokenSource := sourceString copyFrom: currentToken start to: currentToken end.
	chain at: currentToken type ifAbsentPut: [ Dictionary new  ].
	(chain at: currentToken type) at: currentTokenSource ifAbsentPut: [ Bag new ].
	((chain at: currentToken type) at: currentTokenSource) add: newChain