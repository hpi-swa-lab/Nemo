as yet unclassified
testMarkoving

	self 
		assert: (Dictionary newFrom: {
			#keyword -> (Dictionary newFrom: { 'aaaab' -> (Bag new add: #('bcde' 'blubberbla'); yourself) }).
			#variable -> (Dictionary newFrom: { 'bcde' -> (Bag new add: #('blubberbla'); yourself) }) })
		equals: (filter 
			sourceCode: 'aaaab bcde blubberbla. dddd';
			tokens: {
				SHRange start: 1 end: 5 type: #keyword. 
				SHRange start: 7 end: 10 type: #variable.
				SHRange start: 12 end: 21 type: #variable};
			variableToken: (SHRange start: 7 end: 9 type: #variable);
			variableName: 'bcde';
			run; markovChain)