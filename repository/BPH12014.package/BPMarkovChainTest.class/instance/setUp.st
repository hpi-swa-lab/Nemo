as yet unclassified
setUp
	| method1 method2 |
	method1 := (BPMarkovChainTest >> #exampleTestMethod1).
	markovChainTail1 := BPMarkovChain new
		methodReference: method1;
		tailSource: ':= Morph new';
		tailTokens: {SHRange start: 38 end: 39 type: #ansiAssignment.
			SHRange start: 31 end: 45 type: #globalVar.
			SHRange start: 47 end: 49 type: #unary.}.

	method2 := (BPMarkovChainTest >> #exampleTestMethod2).
	markovChainTail2 := BPMarkovChain new
		methodReference: method1;
		tailSource: ':= Morph new';
		tailTokens: {SHRange start: 50 end: 51 type: #ansiAssignment.
			SHRange start: 53 end: 57 type: #globalVar.
			SHRange start: 59 end: 61 type: #unary.}