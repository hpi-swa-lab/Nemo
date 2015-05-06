as yet unclassified
testTempVariablesForClassInSourceCode

	| variables |
	variables := NemoClassUtil tempVariablesForClass: NemoSampleClass inSourceCode: (NemoSampleClass methodDict at: #variableTestMethod:and: ) getSource asString.
	self assert: 4 equals: variables size.
	self assert: (variables includes: 'blockVar1').
	self assert: (variables includes: 'blockVar2').
	self assert: (variables includes: 'tmpVar1').
	self assert: (variables includes: 'tmpVar2').