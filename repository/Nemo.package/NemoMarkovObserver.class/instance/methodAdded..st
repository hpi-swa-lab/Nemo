as yet unclassified
methodAdded: aMethodReference

		| ast |
		ast := NemoParserUtil parseASTFor: aMethodReference.
		BPMarkovFromASTGenerator
				enrichChains: BPBookshelf markovASTChainBook markovChain
				fromAST: ast
				andMethodReference: aMethodReference