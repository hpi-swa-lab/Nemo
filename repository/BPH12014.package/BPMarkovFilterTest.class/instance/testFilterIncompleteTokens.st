as yet unclassified
testFilterIncompleteTokens

	| tokenLists difference |
	tokenLists := BPMarkovFilter splitTokensByDelimiter: (NemoParserUtil parseTokensIn: (MethodReference class: self class selector: #exampleTestMethod3:) sourceString for: self class).

	difference := BPMarkovFilter leftRightParenthesisDifference: (tokenLists at: 4).
	self assert: 0 equals: difference.

	difference := BPMarkovFilter leftRightParenthesisDifference: (tokenLists at: 4) allButFirst.
	self assert: -1 equals: difference.

	difference := BPMarkovFilter leftRightParenthesisDifference: ((tokenLists at: 4) allButLast: 2).
	self assert: 1 equals: difference
