as yet unclassified
testSplitTokensByDelimiter

	| tokenLists |
	tokenLists := BPMarkovFilter splitTokensByDelimiter: (NemoParserUtil parseTokensIn: (MethodReference class: self class selector: #exampleTestMethod2) sourceString for: self class).
	self assert: 10 equals: tokenLists size.