tests
evaluatedTypeFrom: aString

	^(Compiler new evaluate: aString in: nil to: nil) concreteType expandTypes 
	
	