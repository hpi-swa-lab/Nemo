tests
testPatternFormatterClassSelector
	| result | 
	
	result := ' %class %selector ' asPatternFormatter format:debug.
	
	self assert: result = ' LogFormatterTest runCase ' description:' Spected result: LogFormatterTest runCase  '.
	self assert: (result isKindOf: String  )description: 'A formatter MUST return a string value!'.
	
	