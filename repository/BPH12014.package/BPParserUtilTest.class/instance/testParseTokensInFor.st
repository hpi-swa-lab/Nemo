testing
testParseTokensInFor
	| list |
	list := BPParserUtil parseTokensIn: self sourceCode for: self class.
	self assert: list size = 13