private-processing
process

	self markovChain: Dictionary new.
	self retrieveStaticData.
	self tokens ifNotEmpty: [ :tokens | BPMarkovFilter 
		enrichChain: self markovChain 
		forMethodReference: self methodReference
		forCurrentSourceCode: self sourceCode
		withTokens: tokens
		usingOrder: BPMarkovFilter order ].