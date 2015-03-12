as yet unclassified
enrichChains: aDictionary fromAST: anRBNode andMethodReference: aMethodReference
	
	self new
		chains: aDictionary;
		methodReference: aMethodReference;
		visitNode: anRBNode