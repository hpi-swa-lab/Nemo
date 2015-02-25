markov
enrichChain: chain forMethodReference: aMethodReference forCurrentSourceCode: currentSourceCode withTokens: tokens usingOrder: order
	"Builds a markov chain with a given maximum order out of the given tokens and source code"

	| lastToken filteredTokens sourceCode |
	tokens ifEmpty: [ ^Dictionary new ].
	sourceCode := currentSourceCode ifNil: [aMethodReference sourceString] ifNotNil: [currentSourceCode].
	filteredTokens := self preFilterTokens: tokens.
	lastToken := tokens first.

	"simulate a reduce with tail list instead of just the element"
	(self splitTokensByDelimiter: filteredTokens) do: [ :subTokens | | mergedSubTokens |
		mergedSubTokens := self mergeArrayTokens: subTokens.
		self enrichMarkovChain: chain from: mergedSubTokens for: aMethodReference for: sourceCode.
	].
	^ chain.
	"filteredTokens withIndexCollect: [ :token :i | | lastSource tailTokens tailSource |
		(token ~= lastToken) ifTrue: [	

			lastSource := sourceCode copyFrom: lastToken start to: lastToken end.
			tailTokens := filteredTokens copyFrom: i to: ({filteredTokens size. i + (order - 1)} min).
			tailSource := tailTokens collect: [ :x | sourceCode copyFrom: x start to: x end ].

			(tailTokens allSatisfy: [ :x | self validToken: x ]) ifTrue: [
				tailTokens ifNotEmpty: [| markovTail |
					markovTail := BPMarkovChain new
						method: aMethodReference;
						tailSource: tailSource;
						tailTokens: tailTokens.
					chain at: lastToken type ifAbsentPut: [ Dictionary new  ].
					(chain at: lastToken type) at: lastSource ifAbsentPut: [ Bag new ].
					((chain at: lastToken type) at: lastSource) add: markovTail]].

		lastToken := token]].

	^chain"