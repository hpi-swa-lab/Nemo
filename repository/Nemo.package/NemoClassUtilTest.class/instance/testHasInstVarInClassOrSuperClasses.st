as yet unclassified
testHasInstVarInClassOrSuperClasses
	self
		assert: (NemoClassUtil hasInstVar: 'aSampleInstVar' inClassOrSuperClasses: self class);
		deny: (NemoClassUtil hasInstVar: 'aNoneExistingInstVar' inClassOrSuperClasses: self class);
		deny: (NemoClassUtil hasInstVar: 'aSampleInstVar' inClassOrSuperClasses: nil);
		deny: (NemoClassUtil hasInstVar: nil inClassOrSuperClasses: self class)