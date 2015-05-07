as yet unclassified
methodAdded: aMethodReference

		| ast |
		ast := NemoParserUtil parseASTFromMethodReference: aMethodReference.
		BPMarkovFromASTGenerator
				enrichChains: BPBookshelf markovASTChainBook markovChain
				fromAST: ast
				andMethodReference: aMethodReference