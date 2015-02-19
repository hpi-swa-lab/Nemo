as yet unclassified
startObservationOfMethod: aMethodReference
	| sourceCode tokens |

	sourceCode := aMethodReference sourceString.
	tokens := SHParserST80 new
		rangesIn: sourceCode
		classOrMetaClass: aMethodReference actualClass
		workspace: nil
		environment: nil.

	BPMarkovFilter
		enrichChain: BPBookshelf markovChainBook markovChain
		forMethodReference: aMethodReference
		withTokens: tokens
		usingOrder: BPMarkovFilter order.