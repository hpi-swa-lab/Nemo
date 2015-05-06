as yet unclassified
testArgVariablesForClassInSourceCode

	| variables |
	variables := NemoClassUtil argVariablesForClass: NemoSampleClass inSourceCode: (NemoSampleClass methodDict at: #variableTestMethod:and: ) getSource asString.
	self assert: 2 equals: variables size.
	self assert: (variables includes: 'anArg1').
	self assert: (variables includes: 'anArg2').