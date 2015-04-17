as yet unclassified
methodFinderResults

	| line prefix postfix compiledPrefixes compiledPostfix parts results |
	line := [self lines detect: [ :l | self startIndex <= l last ]] ifError: [ ^ {} ].
	prefix := self string copyFrom: line first to: self startIndex - 1. 
	postfix := self string copyFrom: self startIndex to: line last. 
	self halt.
	compiledPrefixes := ((prefix splitBy: ' ') 
		select: [ :part | part notEmpty ]
		thenCollect: [ :part | [Compiler evaluate: part] ifError: [ ^ {} ]]) asArray.
	compiledPostfix := [Compiler evaluate: postfix] ifError: [ ^ {} ].
	parts := compiledPrefixes asOrderedCollection add: compiledPostfix; yourself.
	results := [MethodFinder new
		load: { compiledPrefixes. compiledPostfix };
		findMessage] ifError: [ ^ {} ].
	^ results collect: [ :resultString | | newExp |
		newExp := resultString.
		1 to: parts size do: [:i | newExp := newExp copyReplaceAll: 'data' , i with: ((parts collect: [:x| x printString ]) at: i) ].
		newExp. ]		