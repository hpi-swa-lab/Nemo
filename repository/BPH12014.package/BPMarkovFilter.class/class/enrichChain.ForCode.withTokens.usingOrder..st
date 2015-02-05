class initialization
enrichChain: chain ForCode: sourceCode withTokens: tokens usingOrder: order
	"Builds a markov chain with a given maximum order out of the given tokens and source code"

	| lastToken |

	tokens ifEmpty: [ ^Dictionary new ].

	lastToken := tokens first.

	"simulate a reduce with tail list instead of just the element"
	tokens asOrderedCollection withIndexCollect: [ :token :i || lastSource tailTokens tailSource | (token ~= lastToken) ifTrue: [
		lastSource := sourceCode copyFrom: lastToken start to: lastToken end.
		tailTokens := tokens copyFrom: i to: ({tokens size. i + (order - 1)} min).
		tailSource := tailTokens collect: [ :x | sourceCode copyFrom: x start to: x end ].

		tailTokens ifNotEmpty: [
			chain at: lastToken type ifAbsentPut: [ Dictionary new  ].
			(chain at: lastToken type) at: lastSource ifAbsentPut: [ Bag new ].
			((chain at: lastToken type) at: lastSource) add: tailSource].

		lastToken := token]].

	^chain
				

				