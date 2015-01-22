as yet unclassified
testVariableNameAtCaret

	self assert: 'bcd'
		equals: (filter caretPosition: 7;
			tokens: {SHRange start: 1 end: 5 type: #keyword. SHRange start: 7 end: 9 type: #variable};
			sourceCode: 'aaaa. bcd';
			run; variableName)