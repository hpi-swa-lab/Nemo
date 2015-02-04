as yet unclassified
testMarkoving

	self 
		assert: (Dictionary newFrom: {
			'aaaab' -> (Bag new add: 'bcde'; yourself). 
			'bcde' -> (Bag new add: 'blubberbla'; yourself)}) 
		equals: (filter 
			sourceCode: 'aaaab bcde blubberbla';
			tokens: {
				SHRange start: 1 end: 5 type: #keyword. 
				SHRange start: 7 end: 10 type: #variable.
				SHRange start: 12 end: 21 type: #variable};
			variableToken: (SHRange start: 7 end: 9 type: #variable);
			variableName: 'bcde';
			run; sourceToSource)