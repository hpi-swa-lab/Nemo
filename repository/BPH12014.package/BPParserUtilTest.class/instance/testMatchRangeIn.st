testing
testMatchRangeIn
	| list match |
	list := BPParserUtil parseTokensIn: self sourceCode for: self class.
	match := BPParserUtil match: #patternArg range: list second in: self sourceCode.
	self assert: match = 'firstArg'