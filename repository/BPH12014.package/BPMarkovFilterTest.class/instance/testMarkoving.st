as yet unclassified
testMarkoving

	self 
		assert: (Dictionary newFrom: {
			#keyword -> (Dictionary newFrom: { 'aaaab' -> (Bag new add: #('bcde' 'blubberbla'); yourself) }).
			#instVar -> (Dictionary newFrom: { 'bcde' -> (Bag new add: #('blubberbla'); yourself) }) })
		equals: (filter 
			sourceCode: 'aaaab bcde blubberbla. dddd';
			tokens: {
				SHRange start: 1 end: 5 type: #keyword. 
				SHRange start: 7 end: 10 type: #instVar.
				SHRange start: 12 end: 21 type: #unary};
			variableToken: (SHRange start: 7 end: 9 type: #instVar);
			variableName: 'bcde';
			run; markovChain)