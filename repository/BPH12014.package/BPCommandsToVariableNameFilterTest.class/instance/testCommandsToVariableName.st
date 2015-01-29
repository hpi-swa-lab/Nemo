as yet unclassified
testCommandsToVariableName

	self assert: 'morph'
		equals: (filter
			commands: #('morph' 'color' 'red');
			run;
			variableName)