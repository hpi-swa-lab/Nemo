as yet unclassified
methodFinderResults

	| parts |
	parts := (self currentLine splitBy: ' ')
		select: [ :part | part notEmpty. ]
		thenCollect: [ :part | Compiler evaluate: part. ].
	^ [ MethodFinder new
		load: { (parts copyWithout: parts last). parts last };
		findMessage ] ifError: [ ^ {} ]
