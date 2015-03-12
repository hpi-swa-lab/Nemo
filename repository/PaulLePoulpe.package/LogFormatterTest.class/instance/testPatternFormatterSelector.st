tests
testPatternFormatterSelector
	| result | 
	
	result := PatternLogFormatter selector asPatternFormatter format:info.
	
	self assert: result = 'runCase' description:'selector spected: runCase'.	" SUnit implementation is weird. "
	self assert: (result isKindOf: String  )description: 'A formatter MUST return a string value!'.
	
	