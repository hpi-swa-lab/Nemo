as yet unclassified
testTokenizing

	| tokens |	
	tokens := filter sourceCode: 'method: arg'; clazz: BPExampleClass; run; tokens.
	self assert: 2 equals: tokens size.
	self assert: #patternKeyword equals: tokens first type.