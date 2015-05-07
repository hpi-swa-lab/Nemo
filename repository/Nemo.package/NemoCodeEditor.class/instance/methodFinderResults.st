code suggestion
methodFinderResults

	| line prefix postfix compiledPrefixes compiledPostfix parts results tokens lineIndices questionMarkToken |
	lineIndices := [self lines detect: [ :l | self startIndex - 1 <= l last ]] ifError: [ ^ nil ].
	line := (self string copyFrom: lineIndices first to: lineIndices last).
	tokens := NemoParserUtil parseTokensIn: line for: nil.
	questionMarkToken := tokens detect: [ :token | (line copyFrom: token start to: token end) = '?'] ifNone: [ ^ nil ].

	prefix := line first: questionMarkToken start - 1. 
	postfix := line copyFrom: questionMarkToken end + 1 to: line size.
	compiledPrefixes := ((prefix splitBy: '.') 
		select: [ :part | part notEmpty ]
		thenCollect: [ :part | [Compiler evaluate: part environment: self model] ifError: [ ^ {} ] ]) asArray.
	compiledPostfix := [Compiler evaluate: postfix environment: self model] ifError: [ ^ {} ].
	parts := compiledPrefixes asOrderedCollection add: compiledPostfix; yourself.
	results := [MethodFinder new
		load: { compiledPrefixes. compiledPostfix };
		findMessage] ifError: [ ^ {} ].
	^ results collect: [ :resultString | | newExp |
		newExp := resultString.
		1 to: parts size do: [:i | newExp := newExp copyReplaceAll: 'data' , i with: ((parts collect: [:x| x printString ]) at: i) ].
		newExp. ]		