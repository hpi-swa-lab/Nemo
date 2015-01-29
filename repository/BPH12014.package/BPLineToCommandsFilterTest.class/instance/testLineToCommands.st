as yet unclassified
testLineToCommands

	self assert: #('morph' 'color' 'red')
		equals: (filter
			inputLine: '		morph color red   ';
			run;
			commands)