accessing
analyzedMethodAt: aSelector calledFromContextOf: anAnalyzedMethod 
	| method |
	^ methodDict at: aSelector
		ifAbsent: 
			[method := (TiSystem current compiler 
						analyzeMethodNamed: aSelector fromClass: class calledFromContextOf: anAnalyzedMethod ).
			methodDict at: aSelector put: method.
			method makeConnections]