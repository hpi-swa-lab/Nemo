tests
testPatternFormatterClassSymbol
	| result | 
	
	result := PatternLogFormatter classSymbol asPatternFormatter format:info.
	
	self assert: result = 'LogFormatterTest' description:'class spected: LogFormatterTest'.	
	self assert: (result isKindOf: String  )description: 'A formatter MUST return a string value!'.
	
	