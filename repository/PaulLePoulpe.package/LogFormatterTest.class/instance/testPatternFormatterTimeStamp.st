tests
testPatternFormatterTimeStamp
	| result | 
	
	result := PatternLogFormatter timestamp asPatternFormatter format:debug.
	
	self assert: result = debug timestamp asString description:' Spected timestamp: ', debug timestamp asString.
	self assert: (result isKindOf: String  )description: 'A formatter MUST return a string value!'.
	
	