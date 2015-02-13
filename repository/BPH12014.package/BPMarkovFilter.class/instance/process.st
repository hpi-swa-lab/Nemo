private-processing
process

	self markovChain: Dictionary new.
	self retrieveStaticData.
	self tokens ifNotEmpty: [ :tokens | BPMarkovFilter 
		enrichChain: self markovChain 
		forMethod: self method 
		withTokens: tokens
		usingOrder: BPMarkovFilter order ].