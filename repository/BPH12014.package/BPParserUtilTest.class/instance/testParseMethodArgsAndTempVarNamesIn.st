testing
testParseMethodArgsAndTempVarNamesIn
	| dict |
	dict := BPParserUtil parseMethodArgsAndTempVarNamesIn: self sourceCode for: self class.
	self
		assert: dict size = 2;
		assert: (dict at: #patternTempVar) size = 2;
		assert: (dict at: #patternArg) size = 2;
		assert: (dict at: #patternTempVar) includes: 'temp1';
		assert: (dict at: #patternTempVar) includes: 'temp2';
		assert: (dict at: #patternArg) includes: 'firstArg';
		assert: (dict at: #patternArg) includes: 'secondArg'