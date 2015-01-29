as yet unclassified
testCommandsToClassNameSubString

	self assert: 'color'
		equals: (filter
			commands: #('morph' 'color' 'red');
			run;
			classNameSubstring)