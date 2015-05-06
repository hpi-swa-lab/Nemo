as yet unclassified
startObservationOfMethod: aMethodReference
	| ast |
	ast := NemoParserUtil parseASTFor: aMethodReference.
	BPMarkovFromASTGenerator
		enrichChains: BPBookshelf markovASTChainBook markovChain
		fromAST: ast
		andMethodReference: aMethodReference