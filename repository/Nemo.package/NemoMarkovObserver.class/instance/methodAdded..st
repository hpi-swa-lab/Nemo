as yet unclassified
methodAdded: aMethodReference

		| ast |
		ast := NemoParserUtil parseASTFromMethodReference: aMethodReference.
		NemoMarkovFromASTGenerator
				enrichChains: NemoBookshelf markovASTChainBook markovChain
				fromAST: ast
				andMethodReference: aMethodReference