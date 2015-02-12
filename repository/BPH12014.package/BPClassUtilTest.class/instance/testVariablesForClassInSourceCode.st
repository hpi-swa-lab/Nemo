as yet unclassified
testVariablesForClassInSourceCode

	| variables |
	variables := BPClassUtil variablesForClass: BPTestClass inSourceCode: (BPTestClass methodDict at: #variableTestMethod:and: ) getSource.
	self assert: 8 equals: variables size.
	self assert: (variables includes: 'instanceVariable1').
	self assert: (variables includes: 'instanceVariable2').
	self assert: (variables includes: 'anArg1').
	self assert: (variables includes: 'anArg2').
	self assert: (variables includes: 'blockVar1').
	self assert: (variables includes: 'blockVar2').
	self assert: (variables includes: 'tmpVar1').
	self assert: (variables includes: 'tmpVar2').