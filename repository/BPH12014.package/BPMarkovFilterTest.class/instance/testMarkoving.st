as yet unclassified
testMarkoving
	| chain bag |
	chain := (filter 
			method: BPMarkovFilterTest >> #exampleTestMethod1;
			tokens: (SHParserST80 new
				rangesIn: (self class >> #exampleTestMethod1) getSource asString
				classOrMetaClass: self class
				workspace: nil
				environment: nil);
			variableToken: (SHRange start: 7 end: 9 type: #instVar);
			variableName: 'bcde';
			run; markovChain).
	self 
		assert: 3 equals: chain size;
		assert: (chain includesKey: #methodTempBar);
		assert: (chain includesKey: #return);
		assert: (chain includesKey: #tempVar).
	bag := (((chain at: #methodTempBar) at: '|')).
	self
		assert: (bag isKindOf: Bag);
		assert: 1 equals: bag size;
		assert: (bag asOrderedCollection first isKindOf: BPMarkovChainTail);
		assert: {'morph'. ':='. 'Morph'} asOrderedCollection equals: (bag asOrderedCollection first tailSource)