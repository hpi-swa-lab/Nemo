tests
testSimpleFormatter
	| result | 
	
	result := SimpleLogFormatter instance format: error.
	
	self assert: result = error asString description:'SimpleLogFormatter asString return spected! ' .
	self assert: (result isKindOf: String  )description: 'A formatter MUST return a string value!'.
	