testing
testMatchRangeIn
	| list match |
	list := NemoParserUtil parseTokensIn: self sourceCode for: self class.
	match := NemoParserUtil match: #patternArg range: list second in: self sourceCode.
	self assert: match = 'firstArg'