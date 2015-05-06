testing
testParseTokensInFor
	| list |
	list := NemoParserUtil parseTokensIn: self sourceCode for: self class.
	self assert: list size = 13