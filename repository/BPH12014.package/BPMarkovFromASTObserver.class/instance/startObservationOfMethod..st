as yet unclassified
startObservationOfMethod: aMethodReference
	| ast |
	ast := BPParserUtil parseASTFor: aMethodReference.
	BPMarkovFromASTGenerator
		enrichChains: BPBookshelf markovASTChainBook markovChain
		fromAST: ast
		andMethodReference: aMethodReference