replication
analyzeMethodNamed: aSymbol fromClass: aClass calledFromContextOf: anAnalyzedMethod 
	| analyzedMethod |
	self loadCurrentContextFrom: anAnalyzedMethod.
	analyzedMethod := TiAnalyzedMethod new
						setClass: aClass selector: aSymbol.
	self privReplicate: 
			(aClass decompilerClass new 
				decompile: aSymbol 
				in: aClass 
				method: (aClass compiledMethodAt: aSymbol)) with: analyzedMethod.

	analyzedMethod primitive ifNotNil:[
			analyzedMethod primitive selector = #primitiveExternalCall ifTrue: [
				TiNamedPrimitive resolveRealPrimitiveFor: (aClass compiledMethodAt: aSymbol) into: analyzedMethod.
			]
	].

	^analyzedMethod.
