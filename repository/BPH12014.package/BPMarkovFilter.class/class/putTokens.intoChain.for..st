markov
putTokens: tokens intoChain: chain for: aMethodReference 

	| newChain currentToken currentTokenSource sourceString |
	tokens size <= 1 ifTrue: [^self].
	sourceString := aMethodReference sourceString.
	newChain := BPMarkovChain new
		tailSource: (tokens collect: [ :x | sourceString copyFrom: x start to: x end ]);
		method: aMethodReference;
		tailTokens: tokens.
	currentToken := tokens first.
	currentTokenSource := sourceString copyFrom: currentToken start to: currentToken end.
	chain at: currentToken type ifAbsentPut: [ Dictionary new  ].
	(chain at: currentToken type) at: currentTokenSource ifAbsentPut: [ Bag new ].
	((chain at: currentToken type) at: currentTokenSource) add: newChain