as yet unclassified
testCommandsToMethodSelector

	self assert: 'red'
		equals: (filter
			commands: #('morph' 'color' 'red');
			run;
			methodSelector)