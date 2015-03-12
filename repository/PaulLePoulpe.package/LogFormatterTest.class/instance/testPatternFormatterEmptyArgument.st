tests
testPatternFormatterEmptyArgument
	| result | 
	
	result := PatternLogFormatter argument asPatternFormatter format:info.
	
	self assert: result = '' description:'argument pattern spected: <empty string>'.	
	self assert: (result isKindOf: String  )description: 'A formatter MUST return a string value!'.