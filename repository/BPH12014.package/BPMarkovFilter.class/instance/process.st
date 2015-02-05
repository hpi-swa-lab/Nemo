private-processing
process

	self markovChain: Dictionary new.
	self retrieveStaticData.
	self tokens ifNotEmpty: [ :t | BPMarkovFilter 
		enrichChain: self markovChain 
		ForCode: self sourceCode 
		withTokens: self tokens 
		usingOrder: BPMarkovFilter order ].