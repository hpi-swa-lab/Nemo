tests
testPatternFormatterTag
	| result | 
	
	result := PatternLogFormatter tag asPatternFormatter format:debug.
	
	self assert: result = 'debug' description:' Tag Spected: debug'.
	self assert: (result isKindOf: String  )description: 'A formatter MUST return a string value!'.
	
	