class initialization
enrichChain: chain forMethod: aMethod forCurrentSourceCode: currentSourceCode withTokens: tokens usingOrder: order
	"Builds a markov chain with a given maximum order out of the given tokens and source code"

	| lastToken filteredTokens sourceCode |
	tokens ifEmpty: [ ^Dictionary new ].
	sourceCode := currentSourceCode ifNil: [aMethod getSource asString] ifNotNil: [currentSourceCode].
	filteredTokens := self preFilterTokens: tokens.
	lastToken := tokens first.

	"simulate a reduce with tail list instead of just the element"
	filteredTokens withIndexCollect: [ :token :i | | lastSource tailTokens tailSource |
		(token ~= lastToken) ifTrue: [	

			lastSource := sourceCode copyFrom: lastToken start to: lastToken end.
			tailTokens := filteredTokens copyFrom: i to: ({filteredTokens size. i + (order - 1)} min).
			tailSource := tailTokens collect: [ :x | sourceCode copyFrom: x start to: x end ].

			(tailTokens allSatisfy: [ :x | self validToken: x ]) ifTrue: [
				tailTokens ifNotEmpty: [| markovTail |
					markovTail := BPMarkovChainTail new
						method: aMethod;
						tailSource: tailSource;
						tailTokens: tailTokens.
					chain at: lastToken type ifAbsentPut: [ Dictionary new  ].
					(chain at: lastToken type) at: lastSource ifAbsentPut: [ Bag new ].
					((chain at: lastToken type) at: lastSource) add: markovTail]].

		lastToken := token]].

	^chain