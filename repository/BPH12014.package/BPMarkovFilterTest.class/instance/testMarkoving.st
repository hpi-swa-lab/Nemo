as yet unclassified
testMarkoving
	| chain |
	chain := (filter 
			methodReference: (MethodReference class: BPMarkovFilterTest selector: #exampleTestMethod1);
			sourceCode: filter methodReference sourceString;
			tokens: (SHParserST80 new
				rangesIn: filter methodReference sourceString
				classOrMetaClass: self class
				workspace: nil
				environment: nil);
			variableToken: (SHRange start: 7 end: 9 type: #instVar);
			variableName: 'bcde';
			run; markovChain).
	self 
		assert: 4 equals: chain size;
		assert: (chain includesKey: #ansiAssignment);
		assert: (chain includesKey: #globalVar);
		assert: (chain includesKey: #tempVar);
		assert: (chain includesKey: #return).
	"bag := (((chain at: #methodTempBar) at: '|')).
	self
		assert: (bag isKindOf: Bag);
		assert: 1 equals: bag size;
		assert: (bag asOrderedCollection first isKindOf: BPMarkovChain);
		assert: {'morph'. ':='. 'Morph'} asOrderedCollection equals: (bag asOrderedCollection first tailSource)"