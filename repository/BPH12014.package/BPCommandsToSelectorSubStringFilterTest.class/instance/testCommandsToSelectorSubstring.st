as yet unclassified
testCommandsToSelectorSubstring

	self assert: 'color'
		equals: (filter
			commands: #('morph' 'color' 'red');
			run;
			selectorSubString)